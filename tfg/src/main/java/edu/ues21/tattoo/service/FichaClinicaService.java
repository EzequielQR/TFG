package edu.ues21.tattoo.service;

import java.util.List;
import java.util.Map;

import edu.ues21.tattoo.domain.FichaClinica;

public interface FichaClinicaService {
	int add(FichaClinica fichaClinica);
	List<FichaClinica> getAll();
	FichaClinica getById(int id);
	void update(FichaClinica fichaClinica);
	void delete(FichaClinica fichaClinica);
	void delete(int id);
	Map<String, String> digitalTransformation(String path);
	Map<String, String> digitalTransformation(byte[] data);
}
