package sscource.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import sscource.entity.Course;
import sscource.entity.Student;
import sscource.service.iservice.CourseService;
import sscource.service.iservice.StudentService;

@SuppressWarnings("serial")
public class StudentAction extends ActionSupport implements ModelDriven<Student> {

	private Student student = new Student();
	private StudentService studentService;
	private CourseService courseService;

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Override
	public Student getModel() {
		return student;
	}

	public String studentlogin() {
		Student stu = studentService.load(student.getSid());
		if (stu == null || !stu.getSpassword().equals(student.getSpassword())) {
			return ERROR;
		} else {
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("studentName", stu);
			this.course();
			return INPUT;
		}
	}

	public String addStudent() {
		if (studentService.save(student)) {
			return SUCCESS;
		} else {
			return "fail";
		}
	}

	public String deleteStudent() {
		if (studentService.delete(student.getSid())) {
			return SUCCESS;
		} else {
			return "fail";
		}
	}

	public String updateStudent() {
		if (studentService.update(student)) {
			return SUCCESS;
		} else {
			return "fail";
		}
	}

	public String selectCourse() {
		Student stu = studentService.load(student.getSid());
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("cid");
		Course cou = courseService.load(id);
		float totalCredit = stu.getCredit() + cou.getCredit();
		if(totalCredit > 5) {
			return "fail";
		}
		stu.setCredit(totalCredit);
		int len = 0;
		if(stu.getCourse() != null && stu.getCourse().length() > 0) {
			len = stu.getCourse().substring(0, stu.getCourse().length() - 1).split("；").length;
		}
		String stuCourse = stu.getCourse() == null ? "" : stu.getCourse();
		if (len >= 3 || stuCourse.contains(cou.getName())) {
			return "fail";
		} else {
			String sc = stu.getCourse() + cou.getName() + "；";
			stu.setCourse(sc.replace("null", ""));
			if(cou.getCouCount() - cou.getStuCount() < 1) {
				return "fail";
			} else {
				cou.setStuCount(cou.getStuCount() + 1);
				if (studentService.update(stu) && courseService.update(cou)) {
					this.course();
					return SUCCESS;
				} 
			}
		}
		return "fail";
	}

	private void course() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Student stu = studentService.load(student.getSid());
		List<Course> list = courseService.findAll();
		request.getSession().setAttribute("allList", list);
		if(stu.getCourse() == null || stu.getCourse().length() == 0) {
			request.getSession().setAttribute("course", "");
			request.getSession().setAttribute("totalCredit", 0);
		} else {
			String course = stu.getCourse().substring(0, stu.getCourse().length() - 1);
			request.getSession().setAttribute("course", course);
			request.getSession().setAttribute("totalCredit", stu.getCredit());
		}
	}
}
