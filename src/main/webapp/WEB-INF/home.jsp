<jsp:include page='template/head.jsp'>
	<jsp:param name='title' value='Home' />
</jsp:include>

<html>
<body>
	<jsp:include page='template/navBarLogueado.jsp'>
		<jsp:param name='title' value='Sistema de Ventas' />
		<jsp:param name='nombre' value='${nombreUsuario}' />
	</jsp:include>
<div class="container text-white text-center mt-5 pt-5">

<h1>Bienvenido <c:out value="${usuario.nombre}"> al sistema de ventas la compañía.</c:out></h1>
<h3>Para comenzar a trabajar seleccione una opción el menú.</h3>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


</div>
	<jsp:include page='template/footer.jsp'>
		<jsp:param name='title' value='Sistema Web G6' />
	</jsp:include>
</body>
</html>