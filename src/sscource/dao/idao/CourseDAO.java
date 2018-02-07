package sscource.dao.idao;

import java.util.List;
import java.util.Map;

import sscource.entity.Course;

public interface CourseDAO {
	
	boolean save(Course course);

	boolean delete(String id);

	boolean update(Course course);
	
	List<Course> findAll();

	List<Course> query(Map<String, String> condition);
	
	Course load(String id);
}