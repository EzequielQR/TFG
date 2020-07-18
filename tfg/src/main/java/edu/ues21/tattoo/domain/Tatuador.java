package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tatuadores")
public class Tatuador extends Persona implements Serializable{

	private static final long serialVersionUID = -8212296263876596521L;

	@OneToOne
	@JoinColumn(name="usuarios_nombre")
	private Usuario usuario;
	@OneToMany(mappedBy="tatuador", targetEntity=Turno.class)
	private List<Turno> turnos;
	
	public Tatuador() {
		super();
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public List<Turno> getTurnos() {
		return turnos;
	}
	public void setTurnos(List<Turno> turnos) {
		this.turnos = turnos;
	}
	
}
