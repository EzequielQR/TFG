package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.repository.ClienteRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class ClienteRepositoryImpl implements ClienteRepository{

	@Override
	public int add(Cliente cliente) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(cliente);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Cliente> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Cliente");
		List<Cliente> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Cliente getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Cliente cliente = (Cliente) session.get(Cliente.class, id);
		session.getTransaction().commit();
		return cliente;
	}

	@Override
	public Cliente getByPersonId(int idPerson) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Cliente where persona.id = :id");
		query.setInteger("id", idPerson);
		Cliente cliente = (Cliente) query.uniqueResult();
		session.getTransaction().commit();
		return cliente;
	}
	
	@Override
	public void update(Cliente cliente) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(cliente);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Cliente cliente) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(cliente);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Cliente where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	
}