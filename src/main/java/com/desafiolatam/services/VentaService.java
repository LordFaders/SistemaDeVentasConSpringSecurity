package com.desafiolatam.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.Venta;
import com.desafiolatam.repositories.VentaRepository;

@Service
public class VentaService {

	@Autowired
	VentaRepository ventaRepository;

	public Venta save(@Valid Venta venta) {

		Venta ventaCreada = ventaRepository.saveAndFlush(venta);

		return ventaCreada;

	}

	public List<Venta> findAll() {

		return ventaRepository.findAll();
	}

	public Venta findById(Long ventaId) {
		
		return ventaRepository.getById(ventaId);
	}

	public boolean existsById(Long ventaId) {
		
		return ventaRepository.existsById(ventaId);
	}

	public void deleteById(Long id) {
		ventaRepository.deleteById(id);
		
	}

}
