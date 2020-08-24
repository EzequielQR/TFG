package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fichas_clinica_ets")
public class FichaClinicaDetalleEts implements Serializable{

	private static final long serialVersionUID = 8890461855651281645L;

	@Id
	@GeneratedValue
	private int id;
	@Column(name="vih")
	private boolean vih;
	@Column(name="sifilis")
	private boolean sifilis;
	@Column(name="hepatitis_b")
	private boolean hepatitisB;
	@Column(name="hpv")
	private boolean hpv;
	@Column(name="comentario")
	private String comentario;
	
	public FichaClinicaDetalleEts() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isVih() {
		return vih;
	}

	public void setVih(boolean vih) {
		this.vih = vih;
	}

	public boolean isSifilis() {
		return sifilis;
	}

	public void setSifilis(boolean sifilis) {
		this.sifilis = sifilis;
	}

	public boolean isHepatitisB() {
		return hepatitisB;
	}

	public void setHepatitisB(boolean hepatitisB) {
		this.hepatitisB = hepatitisB;
	}

	public boolean isHpv() {
		return hpv;
	}

	public void setHpv(boolean hpv) {
		this.hpv = hpv;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
