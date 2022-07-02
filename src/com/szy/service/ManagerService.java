package com.szy.service;

import org.springframework.stereotype.Repository;

import com.szy.entity.Manager;

@Repository
public interface ManagerService {
	public Manager findByName(String name);
}
