package sscource.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import sscource.entity.Manager;
import sscource.service.iservice.ManagerService;

@SuppressWarnings("serial")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {

	private Manager manager = new Manager();
	private ManagerService managerService;
	
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public Manager getModel() {
		return manager;
	}
	
	public String managerlogin() {
		Manager man = managerService.load(manager.getMname());
		if(man == null || !man.getMpassword().equals(manager.getMpassword())) {
			return ERROR;
		}
		return INPUT;
	}
	
}
