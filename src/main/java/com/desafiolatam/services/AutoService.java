package com.desafiolatam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.Auto;
import com.desafiolatam.repositories.AutoRepository;

@Service
public class AutoService {

	@Autowired
	AutoRepository autoRepository;

	public Auto save(Auto auto) {

		return autoRepository.save(auto);
	}

	public List<Auto> findAll() {
		return autoRepository.findAll();

	}

	public void eliminarPorId(Long id) {
		autoRepository.deleteById(id);

	}

	public Auto editarPorId(Long id) {
		return autoRepository.findById(id).get();

	}
}
