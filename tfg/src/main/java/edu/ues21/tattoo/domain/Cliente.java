package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
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

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="clientes")
public class Cliente implements Serializable{
	
	private static final long serialVersionUID = -2737352616879530447L;

	@Id
	@GeneratedValue
	private int id;
	@OneToMany(mappedBy="cliente", fetch=FetchType.EAGER, cascade=CascadeType.ALL, targetEntity=Turno.class)
	@Fetch(value = FetchMode.SUBSELECT)
	@JsonBackReference
	private List<Turno> listaTurnos;
	@OneToOne
	@JoinColumn(name="fichas_clinicas_id")
	private FichaClinica fichaClinica;
	@OneToOne
	@JoinColumn(name="personas_id")
	private Persona persona;
	
	public Cliente() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Turno> getListaTurnos() {
		return listaTurnos;
	}
	public void setListaTurnos(List<Turno> listaTurnos) {
		this.listaTurnos = listaTurnos;
	}
	public FichaClinica getFichaClinica() {
		return fichaClinica;
	}
	public void setFichaClinica(FichaClinica fichaClinica) {
		this.fichaClinica = fichaClinica;
	}

	public Persona getPersona() {
		return persona;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	
}