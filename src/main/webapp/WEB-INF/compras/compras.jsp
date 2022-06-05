<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Ingresar Compra' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
	<jsp:param name='title' value='Sistema de Ventas' />
	<jsp:param name='nombre' value='${nombreUsuario }' />
</jsp:include>

<body>
	<div class="container col-4 mt-5 text-white">
		<h1>Ingresar Compra</h1>
		<form:form method="POST" action="/compras/agregar/cliente" modelAttribute="compra">

			<div class="mb-3">
				<form:select path="cliente">
					<form:option value="0"> Seleccione Cliente</form:option>
					<c:forEach items="${listaClientes}" var="client">
							<form:option value="${client.id}">
								<c:out value="${client.nombre}"></c:out>
							</form:option>
					</c:forEach>
				</form:select>
			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="fecha">Fecha</form:label>
				<form:input type="date" class="form-control" path="fecha" />
			</div>

			<div class="mb-3">
				<form:label class="mb-2 text-muted" path="monto">Monto</form:label>
				<form:input type="number" class="form-control" path="monto" />
			</div>
			
			<div class="align-items-center d-flex">
				<button type="submit" class="btn btn-primary ms-auto">
					Ingresar Compra</button>
			</div>
		</form:form>
	</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>