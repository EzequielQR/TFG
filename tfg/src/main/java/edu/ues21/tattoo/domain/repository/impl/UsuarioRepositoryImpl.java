package edu.ues21.tattoo.domain.repository.impl;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.Usuario;
import edu.ues21.tattoo.domain.repository.UsuarioRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class UsuarioRepositoryImpl implements UsuarioRepository{

	@Override
	public String add(Usuario usuario) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		String username = (String) session.save(usuario);
		session.getTransaction().commit();
		return username;
	}

	@Override
	public Usuario getById(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Usuario usuario = (Usuario) session.get(Usuario.class, username);
		session.getTransaction().commit();
		return usuario;
	}

	@Override
	public void update(Usuario usuario) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(usuario);
		session.getTransaction().commit();
	}

	@Override
	public void disable(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("UPDATE Usuario SET activo = 0 WHERE nombre = :pk");
		query.setString("pk", username);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	@Override
	public Usuario check(String username, String hashedPassword) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery
				("from Usuario where nombre = :nombre and contraseniaHash = :password");
		query.setString("nombre", username);
		query.setString("password", hashedPassword);
		Usuario usuario = (Usuario) query.uniqueResult();
		session.getTransaction().commit();
		return usuario;
	}

}
