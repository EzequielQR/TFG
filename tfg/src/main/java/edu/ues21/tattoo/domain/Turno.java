package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tatuadores")
public class Turno implements Serializable{

	private static final long serialVersionUID = -9096278711301517175L;

	@Id
	@GeneratedValue
	private int id;
	@OneToOne
	@JoinColumn(name="personas_id_iniciado_por")
	private Persona iniciadoPor;
	@ManyToOne
	@JoinColumn(name="tatuadores_id")
	private Tatuador tatuador;
	@ManyToOne
	@JoinColumn(name="clientes_id")
	private Cliente cliente;
	@Column(name="descripcion")
	private String descripcion;
	@Column(name="fecha_inicio")
	private LocalDateTime fechaInicio;
	@Column(name="fecha_fin")
	private LocalDateTime fechaFin;
	@OneToOne
	@JoinColumn(name="categorias_id_prioridad")
	private Categoria prioridad;
	@OneToOne
	@JoinColumn(name="categorias_id_estado")
	private Categoria estado;
	@OneToMany(mappedBy="turno", targetEntity=Producto.class)
	private List<Producto> listaProductosUtilizados;
	@Column(name="seña")
	private int senia;
	
	public Turno() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Persona getIniciadoPor() {
		return iniciadoPor;
	}

	public void setIniciadoPor(Persona iniciadoPor) {
		this.iniciadoPor = iniciadoPor;
	}

	public Tatuador getTatuador() {
		return tatuador;
	}

	public void setTatuador(Tatuador tatuador) {
		this.tatuador = tatuador;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public LocalDateTime getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(LocalDateTime fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public LocalDateTime getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(LocalDateTime fechaFin) {
		this.fechaFin = fechaFin;
	}

	public Categoria getPrioridad() {
		return prioridad;
	}

	public void setPrioridad(Categoria prioridad) {
		this.prioridad = prioridad;
	}

	public Categoria getEstado() {
		return estado;
	}

	public void setEstado(Categoria estado) {
		this.estado = estado;
	}

	public List<Producto> getListaProductosUtilizados() {
		return listaProductosUtilizados;
	}

	public void setListaProductosUtilizados(List<Producto> listaProductosUtilizados) {
		this.listaProductosUtilizados = listaProductosUtilizados;
	}

	public int getSenia() {
		return senia;
	}

	public void setSenia(int senia) {
		this.senia = senia;
	}
	
}