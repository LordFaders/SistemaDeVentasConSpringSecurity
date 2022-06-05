<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Crear Auto' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
</jsp:include>
<body>
	<div class="container col-4 mt-5 text-white">

		<h1>Crear Auto</h1>
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
		<form:form method="POST" action="/auto" modelAttribute="auto">
			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="marca">Marca</form:label>
				<form:errors path="marca" class="text-danger" />
				<form:input type="text" class="form-control" path="marca" />
			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="modelo">Modelo </form:label>
				<form:input type="text" class="form-control" path="modelo" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="color">Color</form:label>
				<form:input type="text" class="form-control" path="color" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="velocidad">Velocidad</form:label>
				<form:errors path="velocidad" class="text-danger" />
				<form:input type="text" class="form-control" path="velocidad" />
			</div>
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Registrar</button>
			</div>
		</form:form>
	</div>
	<div class="container mt-5">
		<div class="row"></div>
		<table class="table text-white">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Marca</th>
					<th scope="col">Modelo</th>
					<th scope="col">Color</th>
					<th scope="col">Velocidad</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auto" items="${listaAutos}">
					<tr>
						<th scope="row"><c:out value="${auto.id}"></c:out></th>
						<td><c:out value="${auto.marca}"></c:out></td>
						<td><c:out value="${auto.modelo}"></c:out></td>
						<td><c:out value="${auto.color}"></c:out></td>
						<td><c:out value="${auto.velocidad}"></c:out></td>
						<td><a class="btn btn-outline-warning"
							href="/auto/editar/${auto.id}" role="button">Editar</a> <a
							class="btn btn-outline-danger" href="/auto/eliminar/${auto.id}"
							role="button">Eliminar</a></td>
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