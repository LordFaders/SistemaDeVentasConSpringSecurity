package com.desafiolatam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.desafiolatam.models.Auto;
import com.desafiolatam.services.AutoService;
import com.desafiolatam.services.UsuarioService;

@Controller
@RequestMapping("/auto")
public class AutoController {

	@Autowired
	UsuarioService usuarioService;

	// inyección de dependencias para acceder a los métodos
	@Autowired
	AutoService autoService;

	// muestra el jsp
	@RequestMapping("") // https://localhost:8080/auto
	public String showAuto(@ModelAttribute("auto") Auto auto, Model model) {

			model.addAttribute("listaAutos", autoService.findAll());

			return "/auto/auto.jsp";// llamado al jsp
	}

	// capturar datos del objeto auto
	@PostMapping("")
	public String crearAuto(@Valid @ModelAttribute("auto") Auto auto, BindingResult resultado,
			RedirectAttributes redirectAttributes // pasar
													// parámetros a
													// otra url
	) {// capturar

		// imprimir
		System.out.println(auto);
		System.out.println("marca" + auto.getMarca() + "modelo" + auto.getModelo() + "color" + auto.getColor()
				+ "velocidad" + auto.getVelocidad());

		// validar distintos de null y vacío
		if (!resultado.hasErrors()) {

			// Persistir cuando no hay error
			autoService.save(auto);

			// Pasar parametro a otra ruta de controller
			redirectAttributes.addFlashAttribute("msgOK", "Auto creado correctamente");

			// redireccionamiento al auto
		} else {
			// retornar mensaje de error
			// redirectAttributes.addFlashAttribute("msgError", "Datos faltantes, por favor
			// reintente");
			return "/auto.jsp";
		}
		return "redirect:/auto";

	}

	// metodo eliminar
	// /auto/eliminar/${auto.id} captura dinamica desde el jsp
	@RequestMapping("/eliminar/{id}")
	public String eliminarAuto(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		autoService.eliminarPorId(id);
		redirectAttributes.addFlashAttribute("msgOK", "Auto eliminado correctamente");
		return "redirect:/auto";
	}

	// metodo editar para despliegue
	// /auto/editar/${auto.id} captura dinamica desde el jsp
	@RequestMapping("/editar/{id}")
	public String editarPorId(@PathVariable("id") Long id, Model model) {
		model.addAttribute("auto", autoService.editarPorId(id));

		return "/auto/editarAuto.jsp";
	}

	// método actualizar para persistencia
	@PostMapping("/actualizar")
	public String actualizarAuto(@Valid @ModelAttribute("auto") Auto auto, BindingResult resultado, Model model) {
		if (resultado.hasErrors()) {
			model.addAttribute("auto", autoService.editarPorId(auto.getId()));
			return "editarAuto.jsp";
		}

		System.out.println("auto nuevo " + auto.getId());
		autoService.save(auto);
		return "redirect:/auto";
	}

}
