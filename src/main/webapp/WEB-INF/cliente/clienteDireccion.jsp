<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Lista Cliente - Dirección' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
</jsp:include>
<body>
	<div class="container col-4 mt-5 text-white">

		<h1>Cliente / Dirección</h1>
		<c:if test="${msgError != null}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${msgError}"></c:out>
			</div>
		</c:if>
		<c:if test="${msgOK != null}">
			<div class="alert alert-success" role="alert">
				<c:out value="${msgOK}"></c:out>
			</div>
		</c:if>
</div>
	<div class="container mt-5">
		<div class="row"></div>
		<table class="table text-white">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">Calle</th>
					<th scope="col">Numero</th>
					<th scope="col">Sector</th>
					<th scope="col">Ciudad</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cliente" items="${listaClientes}">
					<tr>
						<th scope="row"><c:out value="${cliente.id}"></c:out></th>
						<td><c:out value="${cliente.nombre}"></c:out></td>
						<td><c:out value="${cliente.apellido}"></c:out></td>
						<td><c:out value="${cliente.direccionCliente.calle}"></c:out></td>
						<td><c:out value="${cliente.direccionCliente.numero}"></c:out></td>
						<td><c:out value="${cliente.direccionCliente.sector}"></c:out></td>
						<td><c:out value="${cliente.direccionCliente.ciudad}"></c:out></td>
						<td><a class="btn btn-outline-warning"
									href="/cliente/editar/${cliente.id}" role="button">Editar</a> <a
									class="btn btn-outline-danger"
									href="/cliente/eliminar/${cliente.id}" role="button">Eliminar</a>
									<a class="btn btn-outline-success"
									href="/cliente/compras/${cliente.id}" role="button"><c:out value="${cliente.compras.size()}"></c:out> compras</a>
									</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>