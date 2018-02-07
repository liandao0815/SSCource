package sscource.service.iservice;

import sscource.entity.Student;

public interface StudentService {

	boolean save(Student student);

	Student load(String id);

	boolean delete(String id);

	boolean update(Student student);
}
