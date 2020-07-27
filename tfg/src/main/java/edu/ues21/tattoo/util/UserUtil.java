package edu.ues21.tattoo.util;

import edu.ues21.tattoo.domain.Usuario;

/**
 * Cuando se implemente la capa de seguridad se procede a borrar esta clase.
 * @author eezeq
 *
 */
public class UserUtil {

	private static Usuario usuario;
	
	public static Usuario getUsuario(Usuario user) {
		if(usuario == null) {
			usuario = user;
		}
		return usuario;
	}
	/**
	 * Llamar a este metodo cuando se deslogea del sistema.
	 */
	public static void destroy() {
		usuario=null;
	}
}