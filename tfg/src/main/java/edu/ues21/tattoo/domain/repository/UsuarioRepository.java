package edu.ues21.tattoo.domain.repository;

import edu.ues21.tattoo.domain.Usuario;

public interface UsuarioRepository {
	String add(Usuario usuario);
	Usuario getById(String username);
	void update(Usuario usuario);
	void disable(String username);
	Usuario check(String username, String hashedPassword);
}
