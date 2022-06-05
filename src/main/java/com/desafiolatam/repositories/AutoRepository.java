package com.desafiolatam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.desafiolatam.models.Auto;

@Repository
public interface AutoRepository extends CrudRepository<Auto, Long>{

	List<Auto> findAll();//retorna la lista completa de autos
	
	
}
