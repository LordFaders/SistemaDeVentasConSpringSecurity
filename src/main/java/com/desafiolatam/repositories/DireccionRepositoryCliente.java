package com.desafiolatam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.desafiolatam.models.DireccionCliente;

@Repository
public interface DireccionRepositoryCliente extends JpaRepository<DireccionCliente, Long>{

}
