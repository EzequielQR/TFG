package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Persona;

/**
 * @deprecated: Esto no se va a usar por que Persona es una clase abstracta, por ende, no se puede
 * 				instanciar.
 * @author eezeq
 *
 */
@Deprecated
public interface PersonaRepository {
	int add(Persona persona);
	List<Persona> getAll();
	Persona getById(int id);
	void update(Persona persona);
	void delete(Persona persona);
	void delete(int id);
}
