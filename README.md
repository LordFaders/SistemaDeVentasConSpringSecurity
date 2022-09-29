# SistemaDeVentasConSpringSecurity

###
Notas del proyecto:
````
Si ven la línea 44 del login.jsp les parecerá raro que el id="email" y type="email" no conincidan con el name="username"
Para referirnos a esto iremos a la clase UserDetailsServiceImpl.java en el package securingweb:
Esta diferencia entre id y name se debe a que "engañamos" a Spring security con el método loadByUserName de dicha clase instanciando un Usuario pero
llamando al método findByEmail del usuarioRepository. Entonces lo que se hace es castear el email asignándole el nombre username para que Spring lo
tome como nombre de usuario y así pueda hacer la validación en el login.

Otro punto a tener en cuenta:
Los roles se insertan mediante query directamente en la tabla roles de la base de datos:

INSERT INTO `javag6spring`.`roles` (nombre) VALUES ('ROLE_USER');
INSERT INTO `javag6spring`.`roles` (nombre) VALUES ('ROLE_ADMIN');

Como se ve en este caso se insertaron dos roles, de Usuario y de Admin.
Si recuerdan la penúltima clase, del 28 de abril, en un momento el profesor me hizo crear relaciones entre usuarios y roles directamente en la 
tabla roles_usuarios de la BD. Este tema es válido pero no para nuestro sistema ya que está programado para que el mismo haga la relación automáticamente
una vez logueado. Esto lo pueden analizar en UsuarioService en el método guardarUsuario. Los roles se asignan con el método de la línea 31.
Revisando este mimsmo método, nos damos cuenta de que en la línea 26 estamos encriptando la password con el método BCrypt de Spring Security.

Por último, en UsuarioController, líneas 55 a 60 pueden encontrarla "receta" para asignasr otros roles a los distintos usuarios. Nótese que un usuario 
podría tener más de un rol por lo que se establece una relación @ManyToMany entre ambas entidades.

Quedo atento a comentarios, dudas y correcciones que puedan surgir de este pequeño instructivo que hice a modeo de ayuda memoria  personal pero que
al mismo tiempo les puede ayudar.
