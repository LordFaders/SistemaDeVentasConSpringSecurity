<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">${param.title}</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">${param.nombre }</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Usuario </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/direccion/usuario">Agregar
								dirección</a></li>
						<li><a class="dropdown-item" href="/direccion/usuario/ver">Lista
								Usuarios</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Cliente </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/cliente">Crear
								Cliente</a></li>
						<li><a class="dropdown-item" href="/direccionCliente/cliente">Agregar
								dirección</a></li>
						<li><a class="dropdown-item"
							href="/direccionCliente/cliente/ver">Lista Clientes</a></li>

					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Inventario </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/producto">Crear
								Producto</a></li>
						<li><a class="dropdown-item" href="/auto">Crear Auto</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Ventas </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/venta">Ingresar Venta</a></li>
						<li><a class="dropdown-item" href="/venta/ver">Buscar
								Venta</a></li>
						<li><a class="dropdown-item" href="/venta/export/pdf">Exportar
								Ventas</a></li>
					</ul></li>
					
					<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Compras </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/compras">Ingresar Compra</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						API </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/api/producto/obtener" target="blank">Obtener Productos</a></li>
						<li><a class="dropdown-item" href="/api/auto/obtener" target="blank">Obtener Autos</a></li>
						 <li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/api/cliente/obtener" target="blank">Obtener Clientes</a></li>
						<li><a class="dropdown-item" href="/api/direccionCliente/obtener" target="blank">Obtener Direccion Clientes</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/api/usuario/obtener" target="blank">Obtener Usuarios</a></li>
						<li><a class="dropdown-item" href="/api/direccionUsuario/obtener" target="blank">Obtener Direccion Usuarios</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/api/venta/obtener" target="blank">Obtener Ventas</a></li>
						<li><a class="dropdown-item" href="/api/productoVenta/obtener" target="blank">Obtener ProductosVentas</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/api/compra/obtener" target="blank">Obtener Compras</a></li>
					</ul></li>
				
				<li class="nav-item me-auto"><form method="POST" action="/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" class="text me-auto" value="Logout" />
					</form></li>

			</ul>
		</div>
	</div>
</nav>
