package com.desafiolatam.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.DireccionUsuario;
import com.desafiolatam.repositories.DireccionRepositoryUsuario;

@Service
public class DireccionServiceUsuario {

	@Autowired
	DireccionRepositoryUsuario direccionRepositoryUsuario;

	public void save(@Valid DireccionUsuario direccionUsuario) {
		
		direccionRepositoryUsuario.save(direccionUsuario);
	}

	public List<DireccionUsuario> findAll() {

		return direccionRepositoryUsuario.findAll();
	}
}
