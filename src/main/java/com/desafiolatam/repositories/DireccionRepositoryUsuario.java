package com.desafiolatam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.desafiolatam.models.DireccionUsuario;

@Repository
public interface DireccionRepositoryUsuario extends JpaRepository<DireccionUsuario, Long>{

}
