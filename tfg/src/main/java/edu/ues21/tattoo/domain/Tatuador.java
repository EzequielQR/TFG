package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="tatuadores")
public class Tatuador implements Serializable{

	private static final long serialVersionUID = -8212296263876596521L;

	@Id
	@GeneratedValue
	private int id;
	@OneToOne
	@JoinColumn(name="usuarios_nombre")
	private Usuario usuario;
	@OneToMany(mappedBy="tatuador", fetch=FetchType.EAGER, cascade=CascadeType.ALL, targetEntity=Turno.class)
	@Fetch(value = FetchMode.SUBSELECT)
	@JsonManagedReference
	private List<Turno> turnos;
	@Column(name="pseudonimo")
	private String pseudonimo;
	@Column(name="color_hex")
	private String color;
	@OneToOne
	@JoinColumn(name="personas_id")
	private Persona persona;
	
	public Tatuador() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPseudonimo() {
		return pseudonimo;
	}
	public void setPseudonimo(String pseudonimo) {
		this.pseudonimo = pseudonimo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Persona getPersona() {
		return persona;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	
}