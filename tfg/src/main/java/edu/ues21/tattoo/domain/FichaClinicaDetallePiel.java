package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="fichas_clinica_piel")
public class FichaClinicaDetallePiel implements Serializable{
	
	private static final long serialVersionUID = 1427430786741608024L;

	@Id
	@GeneratedValue
	private int id;
	@Column(name="psoriasis")
	private boolean psoriasis;
	@Column(name="eccema")
	private boolean eccema;
	@Column(name="queloide")
	private boolean queloide;
	@Column(name="comentario")
	private String comentario;
	
	public FichaClinicaDetallePiel() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isPsoriasis() {
		return psoriasis;
	}

	public void setPsoriasis(boolean psoriasis) {
		this.psoriasis = psoriasis;
	}

	public boolean isEccema() {
		return eccema;
	}

	public void setEccema(boolean eccema) {
		this.eccema = eccema;
	}

	public boolean isQueloide() {
		return queloide;
	}

	public void setQueloide(boolean queloide) {
		this.queloide = queloide;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
}