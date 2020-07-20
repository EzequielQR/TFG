package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.repository.TatuadorRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class TatuadorRepositoryImpl implements TatuadorRepository{

	@Override
	public int add(Tatuador tatuador) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(tatuador);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Tatuador> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Tatuador");
		List<Tatuador> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Tatuador getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Tatuador tatuador = (Tatuador) session.get(Tatuador.class, id);
		session.getTransaction().commit();
		return tatuador;
	}

	@Override
	public void update(Tatuador tatuador) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(tatuador);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Tatuador tatuador) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(tatuador);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Tatuador where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}