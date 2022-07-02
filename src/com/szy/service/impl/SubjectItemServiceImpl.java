package com.szy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szy.dao.SubjectDao;
import com.szy.dao.SubjectItemDao;
import com.szy.entity.Subject;
import com.szy.entity.SubjectItem;
import com.szy.service.SubjectItemService;
import com.szy.service.SubjectService;
@Service
public class SubjectItemServiceImpl implements SubjectItemService{

	@Autowired
	private SubjectItemDao subjectItemDao;
	@Override
	public int add(SubjectItem subjectItem) {
		// TODO Auto-generated method stub
		return subjectItemDao.add(subjectItem);
	}
	@Override
	public List<SubjectItem> findByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return subjectItemDao.findByName(map);
	}
	@Override
	public int getTotalByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return subjectItemDao.getTotalByName(map);
	}
	@Override
	public int edit(SubjectItem subjectItem) {
		// TODO Auto-generated method stub
		return subjectItemDao.edit(subjectItem);
	}
	@Override
	public int delete(String ids) {
		// TODO Auto-generated method stub
		return subjectItemDao.delete(ids);
	}
	@Override
	public int addOneVote(Long id) {
		// TODO Auto-generated method stub
		return subjectItemDao.addOneVote(id);
	}

}
