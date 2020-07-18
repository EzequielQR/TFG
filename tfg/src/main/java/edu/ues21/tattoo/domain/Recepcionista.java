package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="recepcionistas")
public class Recepcionista extends Persona implements Serializable{

	private static final long serialVersionUID = 8791542374617243078L;

	@OneToOne
	@JoinColumn(name="usuarios_nombre")
	private Usuario usuario;

	public Recepcionista() {
		super();
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}