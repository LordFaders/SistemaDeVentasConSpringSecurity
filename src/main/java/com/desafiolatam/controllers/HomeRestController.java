package com.desafiolatam.controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeRestController {

	@RequestMapping("/hi") // get, post, put, delete
	public String hola() {
		return "Hola clase";// o mensaje, o jsp u otra ruta (controlador)
	}

	@RequestMapping("/hola")
	public String saludo() {
		return "Hola clase 2";
	}

	@RequestMapping("/jaime/tapia")
	public String usuario() {
		return "Hola usuario";
	}

	@RequestMapping("/modulo/{moduloId}/seccion/{seccionId}")
	public String rutaDinamica() {
		return "Hola, esto es una ruta dinámica";
	}

	@RequestMapping("/anio/{anio}/mes/{mes}/dia/{dia}")
	public String obtenerFecha(@PathVariable("anio") int anio, @PathVariable("mes") String mes,
			@PathVariable("dia") int dia) {
		return "La fecha es: " + dia + " de " + mes + " de " + anio;
	}

	// http://localhost:9080/parametro?idProducto=100
	@RequestMapping("/parametro")
	public String parametro(@RequestParam(value="idProducto", required = false) String id) {
		if(id == null) {
			return "no existe el parámetro";
		}else
		
		return "Hola " + id;
	}
}
