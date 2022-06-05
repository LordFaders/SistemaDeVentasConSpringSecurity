package com.desafiolatam.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desafiolatam.models.Cliente;
import com.desafiolatam.models.Producto;
import com.desafiolatam.models.ProductosVentas;
import com.desafiolatam.models.Venta;
import com.desafiolatam.pdf.ProductoVentaPDFExporter;
import com.desafiolatam.pdf.VentaPDFExporter;
import com.desafiolatam.services.ClienteService;
import com.desafiolatam.services.ProductoService;
import com.desafiolatam.services.ProductoVentaService;
import com.desafiolatam.services.VentaService;
import com.lowagie.text.DocumentException;

@Controller
@RequestMapping("/venta")
public class VentaController {

	@Autowired
	VentaService ventaService;
	@Autowired
	ProductoService productoService;
	@Autowired
	ProductoVentaService productoVentaService;
	@Autowired
	ClienteService clienteService;

	// desplegar jsp
	@RequestMapping("")
	public String showProducto(@ModelAttribute("venta") Venta venta, Model model) {
		model.addAttribute("ventaId", 0);
		model.addAttribute("listaProductos", productoService.findAll());
		return "/venta/venta.jsp";
	}

	@RequestMapping("/ver")
	public String verVenta() {
		return "/venta/verVenta.jsp";
	}

	@PostMapping("/agregar")
	public String crearVenta(@RequestParam("producto") Long productoId, @RequestParam("ventaId") Long ventaId,
			@RequestParam("cantidad") Integer cantidad, Model model, Producto obtenerPrecio) {
		if (productoId != null && productoId > 0) {
			if (cantidad != null && cantidad > 0) {

				// obtener el producto con el Id
				Producto producto = productoService.findById(productoId);

				// comparar el stock con cantidad
				if (cantidad > producto.getStock()) {
					model.addAttribute("msgError", "No hay stock disponible para este producto.");
				} else {// si hay stock

					// calcular el monto de la venta
					Float total = producto.getPrecio() * cantidad;
					Venta venta = new Venta();

					if (ventaId == 0) {// no existe se crea

						// llenar un objeto venta

						venta.setMonto(total);

					} else {// si existe la venta, la obtengo y la agrego
						venta = ventaService.findById(ventaId);
						venta.setMonto(total + venta.getMonto());

					}
					// guardar y retorna el objeto actualizadp
					venta = ventaService.save(venta);

					// rebajar el stock
					producto.setStock(producto.getStock() - cantidad);
					productoService.save(producto);

					// pasamos el ventaId al jsp
					model.addAttribute("ventaId", venta.getId());

					// crear el objeto ProductosVentas
					ProductosVentas productosVentas = new ProductosVentas();
					productosVentas.setProducto(producto);
					productosVentas.setVenta(venta);
					productosVentas.setCantidad(cantidad);
					productosVentas.setValorUnitario(producto.getPrecio());// valor histórico
					productosVentas.setTotal(total);

					// guardamos y relacionacionamos el producto con la venta
					productoVentaService.save(productosVentas);

					List<ProductosVentas> listaProductosVentas = productoVentaService
							.findAllProductosVentas(venta.getId());

					model.addAttribute("listaProductosVentas", listaProductosVentas);
					model.addAttribute("venta", venta);
				}
			} else {// no se agrgó una cantidad

			}
		} else {// no se selecciono un producto
			model.addAttribute("msgError", "Debe seleccionar un producto");
		}

		model.addAttribute("listaClientes", clienteService.findAll());
		model.addAttribute("listaProductos", productoService.findAll());
		return "/venta/venta.jsp";
	}

	@PostMapping("/ver")
	public String buscarVenta(@RequestParam("ventaId") Long ventaId, Model model) {
		boolean existeVenta = ventaService.existsById(ventaId);
		if (!existeVenta) {
			model.addAttribute("msgError", "Venta no existe");

		} else {
			List<ProductosVentas> listaProductosVentas = productoVentaService.findAllProductosVentas(ventaId);
			model.addAttribute("listaProductosVentas", listaProductosVentas);
			model.addAttribute("venta", ventaService.findById(ventaId));
		}
		return "/venta/verVenta.jsp";
	}

	@PostMapping("/finalizar")
	public String finalizarVenta(@RequestParam("cliente") Long clienteId, @RequestParam("ventaId") Long ventaId) {
		Venta venta = ventaService.findById(ventaId);
		Cliente cliente = clienteService.obtenerCliente(clienteId);
		venta.setCliente(cliente);
		ventaService.save(venta);

		// generar el documento de venta

		return "redirect:/venta";
	}
	
	// metodo eliminar
		// /venta/eliminar/${venta.id} captura dinamica desde el jsp
		@RequestMapping("/eliminar/{id}")
		public String eliminarVenta(@PathVariable("id") Long id, Model model) {
			ProductosVentas productosVentas = productoVentaService.findById(id);
			Venta venta = productosVentas.getVenta();
			venta.setMonto(venta.getMonto() - productosVentas.getTotal());
			venta = ventaService.save(venta);
			productoVentaService.deleteById(id);
			List<ProductosVentas> listaProductosVentas = productoVentaService.findAllProductosVentas(venta.getId());
			model.addAttribute("listaProductosVentas", listaProductosVentas);
			model.addAttribute("msgOK", "Producto eliminado de la venta.");
			model.addAttribute("listaClientes", clienteService.findAll());
			model.addAttribute("listaProductos", productoService.findAll());
			model.addAttribute("ventaId", venta.getId());
			model.addAttribute("venta", venta);
			return "/venta/venta.jsp";
		}

	@GetMapping("/export/pdf")
	public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
		response.setContentType("application/pdf");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
System.out.println(currentDateTime);
		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename = venta" + currentDateTime + ".pdf";
		response.setHeader(headerKey, headerValue);

		List<Venta> listaVenta = ventaService.findAll();
		VentaPDFExporter exporter = new VentaPDFExporter(listaVenta);
		exporter.export(response);

	}
	
	@GetMapping("/export/pdf/{id}") 
	public void exportToPDFVenta(@PathVariable("id") Long ventaId, HttpServletResponse response) 
			throws DocumentException, IOException {response.setContentType("application/pdf"); 
			DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss"); 
			String currentDateTime = dateFormatter.format(new Date()); 
			String headerKey = "Content-Disposition"; 
			String headerValue = "attachment; filename=venta_" + currentDateTime + ".pdf"; 
			response.setHeader(headerKey, headerValue); 
			List<ProductosVentas> listaProductosVentas = productoVentaService.findAllProductosVentas(ventaId); 
			Venta venta = ventaService.findById(ventaId); 
			ProductoVentaPDFExporter exporter = new ProductoVentaPDFExporter(listaProductosVentas,venta); 
			exporter.export(response);
			}
}
