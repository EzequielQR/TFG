package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class TurnoRepositoryImpl implements TurnoRepository{

	@Override
	public int add(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(turno);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Turno> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Turno");
		List<Turno> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Turno getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Turno turno = (Turno) session.get(Turno.class, id);
		session.getTransaction().commit();
		return turno;
	}

	@Override
	public void update(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(turno);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(turno);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Turno where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}