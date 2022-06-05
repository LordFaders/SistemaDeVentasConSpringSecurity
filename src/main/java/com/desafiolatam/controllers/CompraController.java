package com.desafiolatam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.desafiolatam.models.Compra;
import com.desafiolatam.services.ClienteService;
import com.desafiolatam.services.CompraService;

@Controller
@RequestMapping("/compras")
public class CompraController {

	@Autowired
	CompraService compraService;

	@Autowired
	ClienteService clienteService;

	// despliegue
	@RequestMapping("")
	public String mostrarCompra(@ModelAttribute("compra") Compra compra, Model model) {

		model.addAttribute("listaClientes", clienteService.findAll());

		return "/compras/compras.jsp";
	}

	@PostMapping("/agregar/cliente")
	public String capturaCompra(@Valid @ModelAttribute("compra") Compra compra, BindingResult resultado, Model model) {
		if (!resultado.hasErrors()) {// no existe error

			// validar si seleccionó o no un usuario

			compraService.save(compra);
			return "redirect:/cliente";
		} else {// existe error
			model.addAttribute("listaClientes", clienteService.findAll());
			return "/compras/compras.jsp";
		}
	}

	
}