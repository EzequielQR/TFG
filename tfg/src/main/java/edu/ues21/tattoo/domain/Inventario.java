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
@Table(name="inventarios")
public class Inventario implements Serializable{
	
	private static final long serialVersionUID = 2599028738204879260L;

	@Id
	@GeneratedValue
	private int id;
	@OneToOne
	@JoinColumn(name="productos_id")
	private Producto producto;
	@Column(name="cantidad")
	private int cantidad;
	
	public Inventario() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

}
