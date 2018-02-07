package sscource.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import sscource.dao.idao.StudentDAO;
import sscource.entity.Student;

public class StudentDAOImpl implements StudentDAO {
	
	private SessionFactory sessionFactory;

	public StudentDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.openSession();
	}

	@Override
	public boolean save(Student student) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(student);
			session.getTransaction().commit();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Student load(String id) {
		Session session = getSession();
		try {
			Student student = session.load(Student.class,id);
			session.beginTransaction();
			session.getTransaction().commit();
			return student;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean delete(String id) {
		Session session = getSession();
		try {
			Student student = session.load(Student.class,id);
			session.beginTransaction();
			session.delete(student);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean update(Student student) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(student);
			session.getTransaction().commit();
		return true;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

}
