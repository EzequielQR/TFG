package edu.ues21.tattoo.service;

import edu.ues21.tattoo.domain.Usuario;

public interface UsuarioService {
	String add(String nombre, String apellido, String correoElectronico);
	Usuario getById(String username);
	void update(Usuario usuario);
	void disable(String username);
	boolean check(String rawPassword, String hashedPassword);
	String generateBCryptHash(String rawPassword);
}
