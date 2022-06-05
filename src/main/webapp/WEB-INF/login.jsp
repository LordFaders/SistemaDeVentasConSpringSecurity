<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page='template/head.jsp'>
	<jsp:param name='title' value='Login' />
</jsp:include>

<html>
<body>
	<jsp:include page='template/navbarInicio.jsp'>
		<jsp:param name='title' value='Sistema Web G6 2' />
	</jsp:include>

	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center" style="margin-top: 5%">
						<img
							src="/img/printer.png"
							alt="logo" width="150" opacity="50%">
					</div>
					<div class="card img-fluid">
						<img class="card-img-top"
							src="/img/metal.jpg" height="500">
						<div class="card-img-overlay">
							<h1 class="fs-4 card-title fw-bold text-white mb-4">Login</h1>
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
							<form method="POST" action="login">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail</label> <input
										id="email" type="email" class="form-control" name="username"
										value="" placeholder="Ingrese E-Mail" required autofocus>
									<div class="invalid-feedback">El Email es inválido</div>
								</div>

								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="text-muted" for="password">Password</label> <a
											href="forgot.html" class="float-end text-primary">
											¿Olvidó su Password? </a>
									</div>
									<input id="password" type="password" class="form-control"
										name="password" placeholder="Ingrese Password">
									<div class="invalid-feedback">Se requiere la password</div>
								</div>

								<div class="d-flex align-items-center text-white">
									<div class="form-check">
										<input type="checkbox" name="remember" id="remember"
											class="form-check-input"> <label for="remember"
											class="form-check-label">Recordarme</label>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
									<button type="submit" class="btn btn-primary ms-auto mt-4">
										Login</button>
								</div>
							</form>

							<div class="card-footer py-3 border-0 mt-3">
								<div class="text-center text-white">
									¿No tienes una cuenta? <a href="/registro" class="text-warning">Crea
										Una</a>
								</div>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-white">Copyright &copy;
						1976-2022 &mdash; Jaime Tapia</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page='template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>