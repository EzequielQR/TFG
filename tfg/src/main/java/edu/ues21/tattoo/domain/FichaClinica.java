package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="fichas_clinicas")
public class FichaClinica implements Serializable{

	private static final long serialVersionUID = 3134353398914735751L;

	@Id
	@GeneratedValue
	private int id;
	@Column(name="grupo_sanguineo")
	private String grupoSanguineo;
	@Column(name="factor_rh")
	private String factorRh;
	@Column(name="alergias")
	private String alergias;
	@Column(name="problemas_cardiacos")
	private String problemasCardiacos;
	@OneToOne()
	@JoinColumn(name="fichas_clinica_ets_id")
	private FichaClinicaDetallePiel fichaClinicaDetallePiel;
	@OneToOne()
	@JoinColumn(name="fichas_clinica_piel_id")
	private FichaClinicaDetalleEts fichaClinicaDetalleEts;
	@Column(name="comentarios")
	private String comentario;
	
	public FichaClinica() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGrupoSanguineo() {
		return grupoSanguineo;
	}
	public void setGrupoSanguineo(String grupoSanguineo) {
		this.grupoSanguineo = grupoSanguineo;
	}
	public String getFactorRh() {
		return factorRh;
	}
	public void setFactorRh(String factorRh) {
		this.factorRh = factorRh;
	}
	public String getAlergias() {
		return alergias;
	}
	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}
	public String getProblemasCardiacos() {
		return problemasCardiacos;
	}
	public void setProblemasCardiacos(String problemasCardiacos) {
		this.problemasCardiacos = problemasCardiacos;
	}
	public FichaClinicaDetallePiel getFichaClinicaDetallePiel() {
		return fichaClinicaDetallePiel;
	}
	public void setFichaClinicaDetallePiel(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		this.fichaClinicaDetallePiel = fichaClinicaDetallePiel;
	}
	public FichaClinicaDetalleEts getFichaClinicaDetalleEts() {
		return fichaClinicaDetalleEts;
	}
	public void setFichaClinicaDetalleEts(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		this.fichaClinicaDetalleEts = fichaClinicaDetalleEts;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
}
