package com.desafiolatam.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.desafiolatam.models.Cliente;
import com.desafiolatam.services.ClienteService;

@Controller
public class ClienteController {
	
	//inyección de dependencias para acceder a los métodos
	@Autowired
	ClienteService clienteService;
	
	// muestra el jsp
			@RequestMapping("/cliente")//https://localhost:9080/regsitro
			public String showCliente(@ModelAttribute("cliente") Cliente cliente, Model model) {
				
				model.addAttribute("listaClientes", clienteService.findAll());
				return "/cliente/cliente.jsp";//llamado al jsp 
			}
				
	// capturar los datos del objeto cliente
	@PostMapping("/cliente")
	public String capturaCliente(@ModelAttribute("cliente") Cliente cliente, Model model,
			RedirectAttributes redirectAttributes) // pasar parámetros a otra url
	 {// capturar

		// imprimir

		// validar distintos de null y vacío
		if (cliente.getNombre() != null && !cliente.getNombre().equals("") && cliente.getApellido() != null
				&& !cliente.getApellido().equals("") && cliente.getEmail() != null && !cliente.getEmail().equals("")) {
			
			//persistencia
			clienteService.save(cliente);

			// Pasar parametro a otra ruta de controller
			model.addAttribute("msgOK", "Cliente creado correctamente");

			
			return "cliente/cliente.jsp";
		} else {
			// retornar mensaje de error
			model.addAttribute("msgError", "Datos faltantes, por favor reintente");

			return "cliente/cliente.jsp";
		}
	}
	// metodo eliminar
		// /cliente/eliminar/${cliente.id} captura dinámica desde el jsp
		@RequestMapping("/cliente/eliminar/{id}")
		public String eliminarCliente(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
			clienteService.eliminarPorId(id);
			redirectAttributes.addFlashAttribute("msgOK", "Cliente eliminado correctamente");
			return "redirect:/cliente";
		}
		
		// metodo editar para despliegue
		// /cliente/editar/${cliente.id} captura dinamica desde el jsp
		@RequestMapping("/cliente/editar/{id}")
		public String editarPorId(@PathVariable("id") Long id, Model model) {
			model.addAttribute("cliente", clienteService.editarPorId(id));

			return "/cliente/editarCliente.jsp";
		}
		
		// método actualizar para persistencia
		@PostMapping("/cliente/actualizar")
		public String actualizarCliente(@ModelAttribute("cliente") Cliente cliente) {
			System.out.println("cliente nuevo " + cliente.getId());
			clienteService.save(cliente);
			return "redirect:/cliente";
		}
		
		@RequestMapping("/cliente/compras/{id}")
		public String cantidadCompras(@PathVariable("id") Long id, Model model) {
			Cliente cliente = clienteService.obtenerCliente(id);
			
			model.addAttribute("cliente", cliente);
			//model.addAttribute("listaCompras", cliente.getCompras());
			return "/compras/listaCompras.jsp";
		}
		
		
}
