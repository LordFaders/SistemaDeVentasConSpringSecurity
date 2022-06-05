package com.desafiolatam.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.desafiolatam.models.Auto;
import com.desafiolatam.models.Cliente;
import com.desafiolatam.models.Compra;
import com.desafiolatam.models.DireccionCliente;
import com.desafiolatam.models.DireccionUsuario;
import com.desafiolatam.models.Producto;
import com.desafiolatam.models.ProductosVentas;
import com.desafiolatam.models.Usuario;
import com.desafiolatam.models.Venta;
import com.desafiolatam.services.AutoService;
import com.desafiolatam.services.ClienteService;
import com.desafiolatam.services.CompraService;
import com.desafiolatam.services.DireccionServiceCliente;
import com.desafiolatam.services.DireccionServiceUsuario;
import com.desafiolatam.services.ProductoService;
import com.desafiolatam.services.ProductoVentaService;
import com.desafiolatam.services.UsuarioService;
import com.desafiolatam.services.VentaService;

@RestController
@RequestMapping("/api")
public class ApiRestController {
	
	@Autowired
	ProductoService productoService;
	
	@Autowired
	VentaService ventaService;
	
	@Autowired
	ProductoVentaService productoVentaService;
	
	@Autowired
	ClienteService clienteService;
	
	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	CompraService compraService;
	
	@Autowired
	AutoService autoService;
	
	@Autowired
	DireccionServiceUsuario direccionServiceUsuario;
	
	@Autowired
	DireccionServiceCliente  direccionServiceCliente;
	
	
	
	//POST; GET; PUT; DELETE;
	
	@RequestMapping(value="/producto/obtener", method = RequestMethod.GET)
	public List<Producto> obtenerProductos(){
		List<Producto> listaProductos = productoService.findAll();
		
		return listaProductos;
		
	}
	
	@RequestMapping(value="/cliente/obtener", method = RequestMethod.GET)
	public List<Cliente> obtenerCliente(){
		List<Cliente> listaClientes = clienteService.findAll();
		
		return listaClientes;
		
	}
	@RequestMapping(value="/venta/obtener", method = RequestMethod.GET)
	public List<Venta> obtenerVentas(){
		List<Venta> listaVentas = ventaService.findAll();
		
		return listaVentas;
		
	}
	
	@RequestMapping(value="/productoVenta/obtener", method = RequestMethod.GET)
	public List<ProductosVentas> obtenerproductoVenta(){
		List<ProductosVentas> listaProductosVentas = productoVentaService.findAll();
		
		return listaProductosVentas;
		
	}
	
	
	
	@RequestMapping(value="/usuario/obtener", method = RequestMethod.GET)
	public List<Usuario> obtenerUsuario(){
		List<Usuario> listaUsuarios = usuarioService.findAll();
		
		return listaUsuarios;
		
	}
	
	@RequestMapping(value="/compra/obtener", method = RequestMethod.GET)
	public List<Compra> obtenerCompra(){
		List<Compra> listaCompras = compraService.findAll();
		
		return listaCompras;
		
	}
	
	@RequestMapping(value="/auto/obtener", method = RequestMethod.GET)
	public List<Auto> obtenerAuto(){
		List<Auto> listaAutos = autoService.findAll();
		
		return listaAutos;
		
	}
	
	@RequestMapping(value="/direccionUsuario/obtener", method = RequestMethod.GET)
	public List<DireccionUsuario> obtenerDireccionUsuario(){
		List<DireccionUsuario> listaDireccionesUsuarios = direccionServiceUsuario.findAll();
		
		return listaDireccionesUsuarios;
		
	}
	
	@RequestMapping(value="/direccionCliente/obtener", method = RequestMethod.GET)
	public List<DireccionCliente> obtenerDireccionCliente(){
		List<DireccionCliente> listaDireccionesClientes = direccionServiceCliente.findAll();
		
		return listaDireccionesClientes;
		
	}
	
	@RequestMapping(value="/producto/obtener/{id}", method = RequestMethod.GET)
	public Producto obtenerProductoId(@PathVariable("id") Long id) {
		Producto producto = productoService.findById(id);
		return producto;
	}
	
	@RequestMapping(value="/venta/obtener/{id}", method = RequestMethod.GET)
	public Venta obtenerVentaId(@PathVariable("id") Long id) {
		Venta venta = ventaService.findById(id);
		return venta;
	}
	
	@RequestMapping(value="/cliente/obtener/{id}", method = RequestMethod.GET)
	public Cliente obtenerClienteId(@PathVariable("id") Long id) {
		Cliente cliente = clienteService.findById(id);
		return cliente;
	}
	
	
	//auto
	// cliente
	// producto
}
