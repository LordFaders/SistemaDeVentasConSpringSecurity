<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Editar Cliente' />
</jsp:include>
<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
</jsp:include>

<body>
	<div class="container col-4 mt-5 text-white">
		<h1>Editar Cliente</h1>
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
		<form:form method="POST" action="/cliente" modelAttribute="cliente">
			<form:input type="hidden" class="form-control" path="id" />
			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="nombre">Nombre</form:label>
				<form:input type="text" class="form-control" path="nombre" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="apellido">Apellido</form:label>
				<form:input type="text" class="form-control" path="apellido" />

			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="email">Email</form:label>
				<form:input type="text" class="form-control" path="email" />
			</div>
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Actualizar</button>
			</div>
		</form:form>
	</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>