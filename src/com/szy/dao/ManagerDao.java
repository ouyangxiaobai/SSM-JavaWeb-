package com.szy.dao;

import org.springframework.stereotype.Repository;

import com.szy.entity.Manager;

@Repository
public interface ManagerDao {
	public Manager findByName(String name);
}
