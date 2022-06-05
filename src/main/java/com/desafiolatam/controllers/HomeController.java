package com.desafiolatam.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.desafiolatam.services.UsuarioService;

@Controller
public class HomeController {

	@Autowired
	UsuarioService usuarioService;

	@RequestMapping("/home")
	public String home(Model model, HttpSession session) {
		model.addAttribute("listaUsuarios", usuarioService.findAll());
		return "home.jsp";
		
	}

}