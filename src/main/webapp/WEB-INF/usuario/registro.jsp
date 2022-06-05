<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <jsp:include page='../template/head.jsp'>
                    <jsp:param name='title' value='Registro' />
                </jsp:include>

                <body>
                    <jsp:include page='../template/navbarInicio.jsp'>
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
                                        <img src="/img/printer.png" alt="logo" width="100">
                                    </div>
                                    
                                    <div class="card img-fluid">
                                    <img class="card-img-top"
							src="/img/metal.jpg" height="800">
                                   <div class="card-img-overlay">
                                        <div class="card-body p-3">
                                            <h1 class="fs-4 card-title fw-bold text-white mb-4">Registro</h1>

                                            <c:if test="${msgError != null}">
                                                <div class="alert alert-danger" role="alert">
                                                    <c:out value="${msgError}"></c:out>
                                                </div>
                                            </c:if>

                                            <form:form method="POST" action="/registro" modelAttribute="usuario">
                                                <div class="mb-3">
                                                    <form:label class="mb-2 text-white" path="nombre">Nombre</form:label>
                                                    <form:input type="text" class="form-control" path="nombre" />
                                                    <div class="invalid-feedback">Se requiere el nombre</div>
                                                </div>

                                                <div class="mb-3">
                                                    <form:label class="mb-2 text-white" path="email">E-Mail </form:label>
                                                    <form:input type="text" class="form-control" path="email" />
                                                    <div class="invalid-feedback">El Email es inválido</div>
                                                </div>

                                                <div class="mb-3">
                                                    <form:label class="mb-2 text-white" path="password">Password</form:label>
                                                    <form:input type="password" class="form-control" path="password" />
                                                    <div class="invalid-feedback">Se requiere la Password</div>
                                                </div>

                                                <div class="mb-3">
                                                    <form:label class="mb-2 text-white" path="password2"> Confirme Password
                                                    </form:label>
                                                    <form:input type="password" class="form-control" path="password2" />
                                                    <div class="invalid-feedback">Se requiere la Password</div>
                                                </div>

                                                <p class="form-text text-white mb-3">Registrándose usted está de acuerdo con nuestros términos y condiciones.</p>

                                                <div class="align-items-center d-flex">
                                                    <button type="submit" class="btn btn-primary ms-auto">
										Registrar</button>
                                                </div>
                                            </form:form>
                                        </div>
                                        <div class="card-footer py-3 border-0">
                                            <div class="text-center text-white">
                                                ¿Ya tiene una cuenta? <a href="/" class="text-warning">Login</a>
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

                    <jsp:include page='../template/footer.jsp'>
                        <jsp:param name='title' value='Sistema Web G6' />
                    </jsp:include>
                </body>

                </html>