package com.desafiolatam.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity // cualquier cambio hecho aquí afecta directamente a la tabla
@Table(name = "usuarios")
public class Usuario {
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Size(min = 3, max = 20, message = "Nombre debe tener entre 4 a 20 caracteres") // establece una cantidad mínima y
																					// máxima de caracteres para este
																					// atributo
	private String nombre;

	@NotNull
	@Email(message = "Email no puede estar vacío")
	private String email;

	@NotNull
	@Size(min = 6, message = "Su password debe conterner al menos 6 caracteres")
	private String password;

	@Transient // No crea esta columna en la tabla
	private String password2;

	// OneToOne
	@OneToOne(mappedBy = "usuario", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private DireccionUsuario direccionUsuario;
	
	//LAZY a solicitud; EAGER inmediatamente
		@ManyToMany(fetch=FetchType.EAGER)//join
		@JoinTable(
				name="roles_usuarios",
				joinColumns= @JoinColumn(name="usuario_id"),
				inverseJoinColumns=@JoinColumn(name="rol_id")
				)
		private List<Rol> roles;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	public Usuario() {
		super();
		
	}
	
	public Usuario(
			@NotNull @Size(min = 3, max = 20, message = "Nombre debe tener entre 4 a 20 caracteres") String nombre,
			@NotNull @Email(message = "Email no puede estar vacío") String email,
			@NotNull @Size(min = 6, message = "Su password debe conterner al menos 6 caracteres") String password,
			String password2, DireccionUsuario direccionUsuario, List<Rol> roles, Date createdAt, Date updatedAt) {
		super();
		this.nombre = nombre;
		this.email = email;
		this.password = password;
		this.password2 = password2;
		this.direccionUsuario = direccionUsuario;
		this.roles = roles;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public DireccionUsuario getDireccionUsuario() {
		return direccionUsuario;
	}

	public void setDireccion(DireccionUsuario direccionUsuario) {
		this.direccionUsuario = direccionUsuario;
	}

	public List<Rol> getRoles() {
		return roles;
	}

	public void setRoles(List<Rol> roles) {
		this.roles = roles;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}