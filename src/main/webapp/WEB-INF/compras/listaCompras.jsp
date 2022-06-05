<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Lista de Compras' />
</jsp:include>

<jsp:include page='../template/navBarLogueado.jsp'>
		<jsp:param name='title' value='Sistema de Ventas' />
		<jsp:param name='nombre' value='${nombreUsuario }' />
	</jsp:include>

<body>
	
		<div class="container mt-5">
				<h4 class="text text-white mb-4" >Lista de Compras de <c:out value="${cliente.nombre}"></c:out></h4>
			<div class="table-responsive-md">
				<table class="table text-white">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Fecha</th>
							<th scope="col">Monto</th>
							<th scope="col">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="compra" items="${cliente.compras}">
							<tr>
								<th scope="row"><c:out value="${compra.id}"></c:out></th>
								<td><c:out value="${compra.fecha}"></c:out></td>
								<td><c:out value="${compra.monto}"></c:out></td>
								<td><a class="btn btn-outline-warning"
									href="/cliente/editar/${cliente.id}" role="button">Editar</a> <a
									class="btn btn-outline-danger"
									href="/cliente/eliminar/${cliente.id}" role="button">Eliminar</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>