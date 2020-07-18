package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.Categoria;
import edu.ues21.tattoo.domain.repository.CategoriaRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class CategoriaRepositoryImpl implements CategoriaRepository {

	@Override
	public int add(Categoria categoria) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(categoria);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Categoria> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Categoria");
		List<Categoria> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Categoria getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Categoria categoria = (Categoria) session.get(Categoria.class, id);
		session.getTransaction().commit();
		return categoria;
	}

	@Override
	public void update(Categoria categoria) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(categoria);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Categoria categoria) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(categoria);
		session.getTransaction().commit();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Categoria where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}