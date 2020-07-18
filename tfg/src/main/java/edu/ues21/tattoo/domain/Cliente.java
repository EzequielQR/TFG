package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="clientes")
public class Cliente extends Persona implements Serializable{
	
	private static final long serialVersionUID = -2737352616879530447L;

	@Column(name="correo_electronico")
	private String correoElectronico;
	@OneToMany(mappedBy="cliente", targetEntity=Turno.class)
	private List<Turno> listaTurnos;
	@OneToOne
	@JoinColumn(name="fichas_clinicas_id")
	private FichaClinica fichaClinica;
	
	public Cliente() {
		super();
	}
	
	public String getCorreoElectronico() {
		return correoElectronico;
	}
	public void setCorreoElectronico(String correoElectronico) {
		this.correoElectronico = correoElectronico;
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
	
}
