package sscource.service.impl;

import sscource.dao.idao.ManagerDAO;
import sscource.entity.Manager;
import sscource.service.iservice.ManagerService;

public class ManagerServiceImpl implements ManagerService {

	private ManagerDAO managerDao;
	
	public void setManagerDao(ManagerDAO managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public Manager load(String name) {
		return managerDao.load(name);
	}

	
	
}
