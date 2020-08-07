package edu.ues21.tattoo.service;

import edu.ues21.tattoo.domain.Usuario;

public interface UsuarioService {
	String add(String nombre, String apellido);
	Usuario getById(String username);
	void update(Usuario usuario);
	void disable(String username);
	Usuario check(String username, String password);
}
