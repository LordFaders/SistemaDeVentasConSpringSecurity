package com.desafiolatam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.desafiolatam.models.Producto;
import com.desafiolatam.models.ProductosVentas;

@Repository
public interface ProductoVentaRepository extends JpaRepository<ProductosVentas, Long>{
	//JPQL, no usar*, usar el objeto y no la tabla
	
	//SELECT * FROM PRODUCTOS_VENTAS WHERE VENTA_ID =
	@Query("SELECT pv FROM ProductosVentas pv WHERE pv.venta.id = ?1 ")
	List<ProductosVentas> findAllProductosVentasWhereVenta(Long ventaId);
	
	@Query("SELECT pv FROM ProductosVentas pv WHERE pv.producto.id = ?1")
	List<Producto> findAllProductosVentasWhereProductoId(Long productoId);
	
	//QUERY NATIVAS
	@Query(value="SELECT * FROM PRODUCTOS_VENTAS WHERE VENTA_ID = ?1", nativeQuery = true)
	List<ProductosVentas> findAllProductosVentas(Long ventaId);
}
