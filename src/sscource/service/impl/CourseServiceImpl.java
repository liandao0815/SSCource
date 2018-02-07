package sscource.service.impl;

import java.util.List;
import java.util.Map;

import sscource.dao.idao.CourseDAO;
import sscource.entity.Course;
import sscource.service.iservice.CourseService;

public class CourseServiceImpl implements CourseService {

	private CourseDAO courseDao;

	public void setCourseDao(CourseDAO courseDao) {
		this.courseDao = courseDao;
	}

	@Override
	public boolean save(Course course) {
		return courseDao.save(course);
	}

	@Override
	public boolean delete(String id) {
		return courseDao.delete(id);
	}

	@Override
	public boolean update(Course course) {
		return courseDao.update(course);
	}

	@Override
	public List<Course> query(Map<String, String> condition) {
		return courseDao.query(condition);
	}

	@Override
	public List<Course> findAll() {
		return courseDao.findAll();
	}

	@Override
	public Course load(String id) {
		return courseDao.load(id);
	}
	
}