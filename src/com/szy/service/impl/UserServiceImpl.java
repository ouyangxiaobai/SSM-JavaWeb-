package com.szy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szy.dao.UserDao;
import com.szy.entity.User;
import com.szy.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public int add(User user) {
		// TODO Auto-generated method stub
		return userDao.add(user);
	}

	@Override
	public List<User> findByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.findByName(map);
	}

	@Override
	public int getTotalByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.getTotalByName(map);
	}

	@Override
	public int edit(User user) {
		// TODO Auto-generated method stub
		return userDao.edit(user);
	}

	@Override
	public int delete(String ids) {
		// TODO Auto-generated method stub
		return userDao.delete(ids);
	}

	@Override
	public User findUserByName(String name) {
		// TODO Auto-generated method stub
		return userDao.findUserByName(name);
	}

	@Override
	public User findUserById(Long id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	@Override
	public int changePwd(User user) {
		// TODO Auto-generated method stub
		return userDao.changePwd(user);
	}
	

}
