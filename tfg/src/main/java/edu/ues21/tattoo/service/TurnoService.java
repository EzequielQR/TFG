package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Turno;

public interface TurnoService {
	int add(Turno turno);
	List<Turno> getAll();
	Turno getById(int id);
	void update(Turno turno);
	void delete(Turno turno);
	void delete(int id);
}
