<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Lista Usuario - Dirección' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
</jsp:include>
<body>
	<div class="container col-4 mt-5 text-white">

		<h1>Usuario / Dirección</h1>
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
					<th scope="col">Calle</th>
					<th scope="col">Numero</th>
					<th scope="col">Sector</th>
					<th scope="col">Ciudad</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="usuario" items="${listaUsuarios}">
					<tr>
						<th scope="row"><c:out value="${usuario.id}"></c:out></th>
						<td><c:out value="${usuario.nombre}"></c:out></td>
						<td><c:out value="${usuario.direccionUsuario.calle}"></c:out></td>
						<td><c:out value="${usuario.direccionUsuario.numero}"></c:out></td>
						<td><c:out value="${usuario.direccionUsuario.sector}"></c:out></td>
						<td><c:out value="${usuario.direccionUsuario.ciudad}"></c:out></td>
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