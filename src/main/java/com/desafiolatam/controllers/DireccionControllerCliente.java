package com.desafiolatam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.desafiolatam.models.DireccionCliente;
import com.desafiolatam.services.ClienteService;
import com.desafiolatam.services.DireccionServiceCliente;

@Controller
@RequestMapping("/direccionCliente")
public class DireccionControllerCliente {

	@Autowired
	DireccionServiceCliente direccionServiceCliente;
	
	@Autowired
	ClienteService clienteService;
	
	@RequestMapping("/cliente")
	public String mostrarDireccion(@ModelAttribute("direccionCliente") DireccionCliente direccionCliente, Model model){
		
		model.addAttribute("listaClientes", clienteService.findAll());
		
		return "/cliente/direccionCliente.jsp";
	}
	
	@RequestMapping("/cliente/ver")
	public String mostrarClienteDireccion(@ModelAttribute("direccionCliente") DireccionCliente direccionCliente, Model model){
		
		model.addAttribute("listaClientes", clienteService.findAll());
		
		return "/cliente/clienteDireccion.jsp";
	}   
	
	@PostMapping("/agregar/cliente")
	public String capturaDireccion(@Valid @ModelAttribute("direccionCliente") DireccionCliente direccionCliente,
			BindingResult resultado, Model model, RedirectAttributes redirectAttributes) {
		if(!resultado.hasErrors()) {//no existe error
			
			//validar si seleccionó o no un cliente
			
			direccionServiceCliente.save(direccionCliente);
			redirectAttributes.addFlashAttribute("msgOk", "Dirección creada correctamente");
			return "/cliente/direccionCliente.jsp";
		}else {//existe error
			model.addAttribute("listaClientes", clienteService.findAll());
			return "/cliente/direccionCliente.jsp";
		}
	}
}
