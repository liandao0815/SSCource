package sscource.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import sscource.dao.idao.ManagerDAO;
import sscource.entity.Manager;

public class ManagerDAOImpl implements ManagerDAO {

	private SessionFactory sessionFactory;
	
	public ManagerDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.openSession();
	}

	@Override
	public Manager load(String name) {
		Session session = getSession();
		try {			
			Manager manager = session.load(Manager.class,name);
			session.beginTransaction();
			session.getTransaction().commit();
			return manager;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	
}
