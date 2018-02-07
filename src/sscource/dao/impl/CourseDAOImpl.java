package sscource.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import sscource.dao.idao.CourseDAO;
import sscource.entity.Course;

public class CourseDAOImpl implements CourseDAO {

	private SessionFactory sessionFactory;

	public CourseDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.openSession();
	}

	@Override
	public boolean save(Course course) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(course);
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
	public boolean delete(String id) {
		Session session = getSession();
		try {
			Course course = session.load(Course.class, id);
			session.beginTransaction();
			session.delete(course);
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
	public boolean update(Course course) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(course);
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
	public List<Course> findAll() {
		String hql = "from Course";
		Session session = getSession();
		try {
			session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Course> list = session.createQuery(hql).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Course> query(Map<String, String> condition) {
		Session session = getSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Course.class);
		Iterator<Entry<String, String>> iter = condition.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, String> entry = iter.next();
			String key = entry.getKey();
			String value = entry.getValue();
			if ("cid".equals(key)) {
				criteria.add(Restrictions.eq("cid", value));
			}
			if ("name".equals(key)) {
				criteria.add(Restrictions.like("cid", value, MatchMode.ANYWHERE));
			}
			if ("credit".equals(key)) {
				criteria.add(Restrictions.eq("credit", Float.parseFloat(value)));
			}
			if ("teacher".equals(key)) {
				criteria.add(Restrictions.like("teacher", value, MatchMode.ANYWHERE));
			}
		}
		try {
			@SuppressWarnings("unchecked")
			List<Course> list = criteria.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Course load(String id) {
		Session session = getSession();
		try {
			Course course = session.load(Course.class,id);
			session.beginTransaction();
			session.getTransaction().commit();
			return course;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
