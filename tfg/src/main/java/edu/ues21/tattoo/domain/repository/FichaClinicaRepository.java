package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.FichaClinica;

public interface FichaClinicaRepository {
	int add(FichaClinica fichaClinica);
	List<FichaClinica> getAll();
	FichaClinica getById(int id);
	void update(FichaClinica fichaClinica);
	void delete(FichaClinica fichaClinica);
	void delete(int id);
}
