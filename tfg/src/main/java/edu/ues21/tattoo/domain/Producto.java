package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="productos")
public class Producto implements Serializable{

	private static final long serialVersionUID = 5639440672666429945L;

	@Id
	@GeneratedValue
	private int id;
	@Column(name = "cantidad")
	private int cantidad;
	@OneToOne
	@JoinColumn(name="categorias_id_marca")
	private Categoria marca;
	@OneToOne
	@JoinColumn(name="categorias_id_tipo_producto")
	private Categoria tipoProducto;
	@Column(name="caracteristica")
	private String caracteristica;
	@ManyToOne
	@JoinColumn(name="turnos_id")
	@JsonBackReference
	private Turno turno;
	
	public Producto() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Categoria getMarca() {
		return marca;
	}

	public void setMarca(Categoria marca) {
		this.marca = marca;
	}

	public Categoria getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(Categoria tipoProducto) {
		this.tipoProducto = tipoProducto;
	}

	public String getCaracteristica() {
		return caracteristica;
	}

	public void setCaracteristica(String caracteristica) {
		this.caracteristica = caracteristica;
	}

	public Turno getTurno() {
		return turno;
	}

	public void setTurno(Turno turno) {
		this.turno = turno;
	}

}
