package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="personas")
@Inheritance(strategy=InheritanceType.JOINED)
public abstract class Persona implements Serializable{
	
	private static final long serialVersionUID = 8601740518104999903L;

	@Id
	@GeneratedValue
	private int id;
	@OneToOne
	@JoinColumn(name="categorias_id_tipo_documento")
	private Categoria tipoDocumento;
	@Column(name="numero_documento")
	private String numeroDocumento;
	@Column(name="nombre")
	private String nombre;
	@Column(name="apellido")
	private String apellido;
	@Column(name="telefono")
	private String telefono;
	@Column(name="domicilio")
	private String domicilio;
	@OneToOne
	@JoinColumn(name="categorias_id_rol")
	private Categoria rol;
	
	public Persona() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Categoria getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(Categoria tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public String getNumeroDocumento() {
		return numeroDocumento;
	}

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public Categoria getRol() {
		return rol;
	}

	public void setRol(Categoria rol) {
		this.rol = rol;
	}	

}
