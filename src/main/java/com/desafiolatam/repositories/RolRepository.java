package com.desafiolatam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.desafiolatam.models.Rol;

public interface RolRepository extends JpaRepository<Rol, Long>{

	List<Rol> findByNombre(String nombre);
}
