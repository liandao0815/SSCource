package sscource.service.impl;

import sscource.dao.idao.StudentDAO;
import sscource.entity.Student;
import sscource.service.iservice.StudentService;

public class StudentServiceImpl implements StudentService {

	private StudentDAO studentDao;

	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public boolean save(Student student) {
		return studentDao.save(student);
	}

	@Override
	public Student load(String id) {
		return studentDao.load(id);
	}

	@Override
	public boolean delete(String id) {
		return studentDao.delete(id);
	}

	@Override
	public boolean update(Student student) {
		return studentDao.update(student);
	}

}
