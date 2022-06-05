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

import com.desafiolatam.models.DireccionUsuario;
import com.desafiolatam.services.DireccionServiceUsuario;
import com.desafiolatam.services.UsuarioService;

@Controller
@RequestMapping("/direccion")
public class DireccionControllerUsuario {
	//un usuario una direccion
	@Autowired
	DireccionServiceUsuario direccionServiceUsuario;
	
	@Autowired
	UsuarioService usuarioService;   
	
	//despliegue
	@RequestMapping("/usuario")
	public String mostrarDireccion(@ModelAttribute("direccionUsuario") DireccionUsuario direccionUsuario, Model model){
		
		model.addAttribute("listaUsuarios", usuarioService.findAll());
		
		return "/usuario/direccionUsuario.jsp";
	}
	
	@RequestMapping("/usuario/ver")
	public String mostrarUsuarioDireccion(@ModelAttribute("direccionUsuario") DireccionUsuario direccionUsuario, Model model){
		
		model.addAttribute("listaUsuarios", usuarioService.findAll());
		
		return "/usuario/usuarioDireccion.jsp";
	}
	
	@PostMapping("/agregar/usuario")
	public String capturaDireccion(@Valid @ModelAttribute("direccion") DireccionUsuario direccionUsuario,
			BindingResult resultado, Model model, RedirectAttributes redirectAttributes) {
		if(!resultado.hasErrors()) {//no existe error
			
			//validar si seleccionó o no un usuario
			
			direccionServiceUsuario.save(direccionUsuario);
			redirectAttributes.addFlashAttribute("msgOk", "Dirección creada correctamente");
			return "/usuario/direccionUsuario.jsp";
		}else {//existe error
			model.addAttribute("listaUsuarios", usuarioService.findAll());
			return "/usuario/direccionUsuario.jsp";
		}
	}
}
