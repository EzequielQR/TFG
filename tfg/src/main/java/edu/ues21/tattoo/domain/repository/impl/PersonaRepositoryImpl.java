package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.domain.repository.PersonaRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class PersonaRepositoryImpl implements PersonaRepository{

	@Override
	public int add(Persona persona) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(persona);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Persona> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Persona");
		List<Persona> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Persona getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Persona persona = (Persona) session.get(Persona.class, id);
		session.getTransaction().commit();
		return persona;
	}

	@Override
	public void update(Persona persona) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(persona);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Persona persona) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(persona);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Persona where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}