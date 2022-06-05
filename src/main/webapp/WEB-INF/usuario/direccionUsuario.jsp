<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='../template/head.jsp'>
	<jsp:param name='title' value='Agregar Direccion de Usuario' />
</jsp:include>

<body>
	<jsp:include page='../template/navBarLogueado.jsp'>
		<jsp:param name='title' value='Sistema de Ventas' />
	</jsp:include>

	<!-- 	<c:if test="${msgError != null}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${msgError}"></c:out>
			</div>
		</c:if> -->

	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-3">
						<img
							src="/img/printer.png"
							alt="logo" width="100">
					</div>
					 
					 <div class="card img-fluid">
                                    <img class="card-img-top"
							src="/img/metal.jpg" height="800">
					<div class="card-img-overlay">
                                        <div class="card-body p-3">
							<h1 class="fs-4 card-title fw-bold text-white mb-4">Agregar Dirección de Usuario</h1>

							<c:if test="${msgError != null}">
								<div class="alert alert-danger" role="alert">
									<c:out value="${msgError}"></c:out>
								</div>
							</c:if>

							<form:form method="POST" action="/direccion/agregar/usuario"
								modelAttribute="direccionUsuario">
								<div class="mb-3">
									<form:select path="usuario" class="form-select">
										<form:option value="0"> Seleccione Usuario</form:option>
										<c:forEach items="${listaUsuarios}" var="user">
										<c:if test="${user.direccionUsuario.id == null}">
											<form:option value="${user.id}">
												<c:out value="${user.nombre}"></c:out>
											</form:option>
											</c:if>
										</c:forEach>
									</form:select>
								</div>
								<div class="mb-3">
									<form:label class="mb-2 text-white" path="calle">Calle</form:label>
									<form:errors path="calle" class="text-danger" />
									<form:input type="text" class="form-control" path="calle" />
									<div class="invalid-feedback">Se requiere la calle</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-white" path="numero">Número </form:label>
									<form:errors path="calle" class="text-danger" />
									<form:input type="text" class="form-control" path="numero" />
									<div class="invalid-feedback">Se requiere el número</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-white" path="sector">Sector</form:label>
									<form:input type="text" class="form-control" path="sector" />
									<div class="invalid-feedback">Se requiere el sector</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-white" path="ciudad">Ciudad
                                                    </form:label>
									<form:input type="text" class="form-control" path="ciudad" />
									<div class="invalid-feedback">Se requiere la ciudad</div>
								</div>

								<div class="mb-3">
									<form:label class="mb-2 text-white" path="region">Región
                                                    </form:label>
									<form:input type="text" class="form-control" path="region" />
									<div class="invalid-feedback">Se requiere la ciudad</div>
								</div>

								<div class="align-items-center d-flex">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<button type="submit" class="btn btn-primary ms-auto">
										Agregar Dirección</button>
								</div>
							</form:form>
						</div>
		
						</div>
					</div>
					<div class="text-center mt-5 text-muted">Copyright &copy;
						2017-2022 &mdash; Desafio Latam</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page='../template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>

</html>