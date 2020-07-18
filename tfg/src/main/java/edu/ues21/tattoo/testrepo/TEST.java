package edu.ues21.tattoo.testrepo;

import java.util.List;

import edu.ues21.tattoo.domain.Categoria;
import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.repository.impl.CategoriaRepositoryImpl;
import edu.ues21.tattoo.domain.repository.impl.ClienteRepositoryImpl;

public class TEST {

	public static void main(String[] args) {
		add();
	}
	
	public static void add() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		Categoria ca = new Categoria();
		ca.setId(1);
		Cliente c = new Cliente();
		c.setApellido("Ape");
		c.setCorreoElectronico("correo");
		c.setDomicilio("domi");
		c.setFichaClinica(ca);
		c.setNombre("nombre");
		c.setNumeroDocumento("num");
		c.setRol(ca);
		c.setTelefono("tel");
		c.setTipoDocumento(ca);
		impl.add(c);
	}
	public static void getAll() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		
		List l = impl.getAll();
		
		for(int i = 0; i<l.size();i++) {
			Categoria c = new Categoria();
			c = (Categoria) l.get(i);
			System.out.println(c.getId());
		}
	}
	public static void getById() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		Categoria c = impl.getById(1);
		
		System.out.println(c.getNombre());
	}
	public static void update() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		Categoria c = impl.getById(1);
		c.setDescripcion("descri");
		impl.update(c);
	}
	public static void delete() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		impl.delete(1);
	}
	public static void deleteV2() {
		ClienteRepositoryImpl impl = new ClienteRepositoryImpl();
		Categoria c = new Categoria();
		c.setId(2);
		impl.delete(c);
	}
}
