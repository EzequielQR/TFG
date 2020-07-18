package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.Recepcionista;
import edu.ues21.tattoo.domain.repository.RecepcionistaRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class RecepcionistaRepositoryImpl implements RecepcionistaRepository{

	@Override
	public int add(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(recepcionista);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Recepcionista> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Recepcionista");
		List<Recepcionista> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Recepcionista getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Recepcionista recepcionista = (Recepcionista) session.get(Recepcionista.class, id);
		session.getTransaction().commit();
		return recepcionista;
	}

	@Override
	public void update(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(recepcionista);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(recepcionista);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Recepcionista where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}