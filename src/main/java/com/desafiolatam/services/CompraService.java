package com.desafiolatam.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.Compra;
import com.desafiolatam.repositories.CompraRepository;

@Service
public class CompraService {
	
	@Autowired
	CompraRepository compraRepository;

	public List<Compra> findAll() {
		
		return compraRepository.findAll();
	}

	public void save(@Valid Compra compra) {
		compraRepository.save(compra);
		
	}

}
