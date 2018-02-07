package sscource.dao.idao;

import sscource.entity.Student;

public interface StudentDAO {

	boolean save(Student student);

	Student load(String id);

	boolean delete(String id);

	boolean update(Student student);
}
