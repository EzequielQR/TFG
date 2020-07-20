package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="usuarios")
public class Usuario implements Serializable{

	private static final long serialVersionUID = 5245895737465152752L;

	@Id
	@Column(name="nombre")
	private String nombre;
	@Column(name="contrasenia_hash")
	private String contraseniaHash;
	@Column(name="ultimo_cambio")
	private Date ultimoCambio;
	@Column(name="activo")
	private boolean activo;
	
	public Usuario() {
		super();
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getContraseniaHash() {
		return contraseniaHash;
	}

	public void setContraseniaHash(String contraseniaHash) {
		this.contraseniaHash = contraseniaHash;
	}

	public Date getUltimoCambio() {
		return ultimoCambio;
	}

	public void setUltimoCambio(Date ultimoCambio) {
		this.ultimoCambio = ultimoCambio;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
}
