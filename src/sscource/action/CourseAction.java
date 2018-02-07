package sscource.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import sscource.entity.Course;
import sscource.service.iservice.CourseService;

@SuppressWarnings("serial")
public class CourseAction extends ActionSupport implements ModelDriven<Course> {

	private Course course = new Course();
	private CourseService courseService;
	private List<String> info1;
	private List<String> info2;

	public List<String> getInfo1() {
		return info1;
	}

	public List<String> getInfo2() {
		return info2;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Override
	public Course getModel() {
		return course;
	}
	
	public String addCourse() {
		if(courseService.save(course)) {
			return INPUT;
		}
		else {
			return "fail";
		}
	}
	
	public String deleteCourse() {
		if(courseService.delete(course.getCid())) {
			return SUCCESS;
		}
		else {
			return "fail";
		}
	}
	
	public String updateCourse() {
		if(courseService.update(course)) {
			return SUCCESS;
		}
		else {
			return "fail";
		}
	}
	
	public String queryCourse() {
		Map<String,String> condition = new HashMap<String,String>();
		HttpServletRequest request = ServletActionContext.getRequest();
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String key = paramNames.nextElement();
			String value = request.getParameter(key);
			if (value != null && value.trim().length() != 0) {
				condition.put(key, value);
			}
		}
		List<Course> list = courseService.query(condition);
		if(list != null) {
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("list", list);
			return "query";
		}
		else {
			return "fail";
		}
	}
	
	public String ajaxInfo1() {
		info1 = new ArrayList<String>();
		List<Course> list = courseService.findAll();
		Iterator<Course> iter = list.iterator();
		while (iter.hasNext()) {
			Course course = (Course) iter.next();
			String count = new Integer(course.getCouCount()).toString();
			String info = course.getName() + " = " + count;
			info1.add(info);
		}
		return "ajax";
	}
	
	public String ajaxInfo2() {
		info2 = new ArrayList<String>();
		List<Course> list = courseService.findAll();
		Iterator<Course> iter = list.iterator();
		while (iter.hasNext()) {
			Course course = (Course) iter.next();
			String count = new Integer(course.getStuCount()).toString();
			String info = course.getName() + " = " + count;
			info2.add(info);
		}
		return "ajax";
	}
}
