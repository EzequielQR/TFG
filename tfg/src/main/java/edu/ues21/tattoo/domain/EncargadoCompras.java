package edu.ues21.tattoo.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="encargados_compras")
public class EncargadoCompras extends Persona implements Serializable{
	
	private static final long serialVersionUID = -2050088353638727084L;

	@OneToOne
	@JoinColumn(name="usuarios_nombres")
	private Usuario usuario;

	public EncargadoCompras() {
		super();
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	

}
