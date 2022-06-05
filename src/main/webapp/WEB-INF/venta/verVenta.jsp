<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Buscador de Ventas' />
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
		<h2 class="text-center">Visor de Venta</h2>
		<form method="POST" action="/venta/ver">

			<div class="mb-3">
				<div class="input-group">

					<label for="ventaId" class="form-text text-white">Número de
						venta</label><br> <input type="number" class="form-control" value="0"
						name="ventaId" id="ventaId" />
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Buscar Venta</button>
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
						<tr>
							<td><c:out value="${productosVentas.cantidad}"></c:out></td>
							<td><c:out value="${productosVentas.producto.nombre}"></c:out></td>
							<td><c:out value="${productosVentas.valorUnitario}"></c:out></td>
							<td><c:out value="${productosVentas.total}"></c:out></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td>TOTAL</td>
						<td>${venta.monto}</td>
					</tr>
					<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><a class="btn btn-success" href="/venta/export/pdf/${venta.id}">Imprimir Boleta</a>
						</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>