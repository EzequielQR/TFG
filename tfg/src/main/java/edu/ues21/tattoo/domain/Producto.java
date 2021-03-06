package edu.ues21.tattoo.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="productos")
public class Producto implements Serializable{

	private static final long serialVersionUID = 5639440672666429945L;

	@Id
	@GeneratedValue
	private int id;
	@Column(name = "cantidad_actual")
	private int cantidad;
	@Column(name = "cantidad_minima")
	private int cantidadMinima;
	@OneToOne
	@JoinColumn(name="categorias_id_marca")
	private Categoria marca;
	@OneToOne
	@JoinColumn(name="categorias_id_tipo_producto")
	private Categoria tipoProducto;
	@Column(name="caracteristica")
	private String caracteristica;
	//@ManyToMany(cascade = CascadeType.ALL)
	@ManyToMany(mappedBy = "listaProductosUtilizados", fetch = FetchType.EAGER, targetEntity = Turno.class)
	@Fetch(value = FetchMode.SUBSELECT)
//	@JoinTable(
//			name = "turnos_has_productos",
//			joinColumns = @JoinColumn(name = "productos_id"),
//			inverseJoinColumns = @JoinColumn(name = "turnos_id"))
	@JsonBackReference
	private List<Turno> listaTurnos;
	
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

	public int getCantidadMinima() {
		return cantidadMinima;
	}

	public void setCantidadMinima(int cantidadMinima) {
		this.cantidadMinima = cantidadMinima;
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

	public List<Turno> getListaTurnos() {
		return listaTurnos;
	}

	public void setListaTurnos(List<Turno> listaTurnos) {
		this.listaTurnos = listaTurnos;
	}
	
}