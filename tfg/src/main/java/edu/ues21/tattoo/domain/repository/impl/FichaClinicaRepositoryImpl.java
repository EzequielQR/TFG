package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.repository.FichaClinicaRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class FichaClinicaRepositoryImpl implements FichaClinicaRepository{

	@Override
	public int add(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(fichaClinica);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<FichaClinica> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from FichaClinica");
		List<FichaClinica> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public FichaClinica getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		FichaClinica fichaClinica = (FichaClinica) session.get(FichaClinica.class, id);
		session.getTransaction().commit();
		return fichaClinica;
	}

	@Override
	public void update(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(fichaClinica);
		session.getTransaction().commit();
	}

	@Override
	public void delete(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(fichaClinica);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete FichaClinica where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}