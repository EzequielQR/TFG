package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="encargados_compras")
public class EncargadoCompras implements Serializable{
	
	private static final long serialVersionUID = -2050088353638727084L;

	@Id
	@GeneratedValue
	private int id;
	@OneToOne
	@JoinColumn(name="usuarios_nombre")
	private Usuario usuario;
	@OneToOne
	@JoinColumn(name="personas_id")
	private Persona persona;

	public Persona getPersona() {
		return persona;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public EncargadoCompras() {
		super();
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}