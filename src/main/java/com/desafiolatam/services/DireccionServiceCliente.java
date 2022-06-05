package com.desafiolatam.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.DireccionCliente;
import com.desafiolatam.repositories.DireccionRepositoryCliente;

@Service
public class DireccionServiceCliente {

	@Autowired
	DireccionRepositoryCliente direccionRepositoryCliente;

	public void save(@Valid DireccionCliente direccionCliente) {
		direccionRepositoryCliente.save(direccionCliente);
	}

	public List<DireccionCliente> findAll() {

		return direccionRepositoryCliente.findAll();
	}
}
