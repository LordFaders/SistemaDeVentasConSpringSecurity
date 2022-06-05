<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Ingresar Venta' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
	<jsp:param name='nombre' value='${nombreUsuario }' />
</jsp:include>

<body>
	<div class="container col-4 mt-5 text-white">
		<c:if test="${msgError != null}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${msgError}"></c:out>
			</div>
		</c:if>
		<h2 class="text-center">Ingresar Venta</h2>
		<form method="POST" action="/venta/agregar">
			<input type="hidden" value="${ventaId}" name="ventaId">
			<div class="mb-3">
				<div class="input-group">
					<select name="producto">
						<option value="0">Seleccione un producto</option>
						<c:forEach items="${listaProductos}" var="product">
							<option value="${product.id}">
								<c:out value="${product.nombre}"></c:out>
							</option>
						</c:forEach>
					</select> <input type="number" class="form-control" value="0"
						placeholder="Cantidad" name="cantidad" />
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Agregar</button>
			</div>
		</form>
	</div>


	<div class="container mt-5">
		<h4 class="text text-white text-center">Lista de Ventas</h4>
		<div class="table-responsive-md">
			<table class="table text-white">
				<thead>
					<tr>
						<th scope="col">Cantidad</th>
						<th scope="col">Producto</th>

						<th scope="col">Valor Unitario</th>
						<th scope="col">SubTotal</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="productosVentas" items="${listaProductosVentas}">
						<!--<c:if test="${ventaId == productosVentas.venta.id}">-->
						<tr>
							<td><c:out value="${productosVentas.cantidad}"></c:out></td>
							<td><c:out value="${productosVentas.producto.nombre}"></c:out></td>
							<td><c:out value="${productosVentas.valorUnitario}"></c:out></td>
							<td><c:out value="${productosVentas.total}"></c:out></td>
							<td><a class="btn btn-outline-danger"
								href="/venta/eliminar/${productosVentas.id}" role="button">Eliminar</a></td>
						</tr>
						<!--</c:if>-->
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td>TOTAL</td>
						<td>${venta.monto}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<form method="POST" action="/venta/finalizar">
				<input type="hidden" value="${ventaId}" name="ventaId">
				<div class="mb-3">
					<div class="input-group">
						<select name="cliente">
							<option value="0">Seleccione un cliente</option>
							<c:forEach items="${listaClientes}" var="cliente">
								<option value="${cliente.id}">
									<c:out value="${cliente.nombre}"></c:out>
								</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="align-items-center d-flex">
					<button type="submit" class="btn btn-primary ms-auto">
						Finalizar Venta</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>