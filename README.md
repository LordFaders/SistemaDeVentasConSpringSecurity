# SistemaDeVentasConSpringSecurity

####
Notas del proyecto:

En la línea 44 del login.jsp parecerá raro que el id="email" y type="email" no conincidan con el name="username"
Para referirnos a esto iremos a la clase UserDetailsServiceImpl.java en el package securingweb:
esta diferencia entre id y name se debe a que "engañamos" a Spring security con el método loadByUserName de dicha clase instanciando un Usuario pero
llamando al método findByEmail del usuarioRepository. Entonces lo que se hace es asignarle el userName al email para que Spring lotome como nombre de usuario y así pueda hacer la validación en el login.

Otro punto a tener en cuenta:
Los roles se insertan mediante query directamente en la tabla roles de la base de datos:

````
INSERT INTO `javag6spring`.`roles` (nombre) VALUES ('ROLE_USER');
INSERT INTO `javag6spring`.`roles` (nombre) VALUES ('ROLE_ADMIN');
````

Como se ve en este caso se insertaron dos roles, de Usuario y de Admin.
 En un momento creé relaciones entre usuarios y roles directamente en la tabla roles_usuarios de la BD. Esto es válido pero no para este sistema ya que está programado para que el mismo haga la relación automáticamente una vez logueado. Esto se puede analizar en UsuarioService en el método guardarUsuario. Los roles se asignan con el método de la línea 31.
Revisando el mismo UsuarioService, vemos que en la línea 26 estamos encriptando la password con el método BCrypt de Spring Security.

Por último, en UsuarioController, líneas 55 a 60 pueden encontrarla "receta" para asignar otros roles a los distintos usuarios. Nótese que un usuario 
podría tener más de un rol por lo que se establece una relación @ManyToMany entre ambas entidades:

````
ASIGNAR OTROS ROLES:
	1º crear jsp con selectores de usuarios y roles
	2º capturar el usuario y el rol en el controlador de usuario
	3º buscar usuario y rol por id a la BD
	4º agregar el rol capturado usuario.getRoles().add(Rol) a la lista de roles del usuario 
	5º guardar el usuario
  ````


Quedo atento a comentarios, dudas y correcciones que puedan surgir de este pequeño instructivo que hice a modo de ayuda memoria  personal pero que
al mismo tiempo les puede ayudar.
