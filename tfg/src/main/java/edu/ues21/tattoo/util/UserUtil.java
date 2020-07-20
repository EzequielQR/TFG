package edu.ues21.tattoo.util;

import edu.ues21.tattoo.domain.Usuario;

/**
 * Cuando se implemente la capa de seguridad se procede a borrar esta clase.
 * @author eezeq
 *
 */
public class UserUtil {

	private static Usuario usuario;
	
	public static Usuario getUsuario() {
		return usuario;
	}
	/**
	 * Llamar a este metodo cuando hace un login exitoso al sistema.
	 */
	public static void setUsuario(Usuario usuario) {
		UserUtil.usuario = usuario;
	}
	/**
	 * Llamar a este metodo cuando se deslogea del sistema.
	 */
	public static void destroy() {
		usuario=null;
	}
}