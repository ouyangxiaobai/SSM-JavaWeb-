package com.szy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szy.dao.ManagerDao;
import com.szy.entity.Manager;
import com.szy.service.ManagerService;
@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public Manager findByName(String name) {
		// TODO Auto-generated method stub
		return managerDao.findByName(name);
	}

}
