package com.szy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szy.dao.VoteDao;
import com.szy.entity.Vote;
import com.szy.service.VoteService;
@Service
public class VoteServiceImpl implements VoteService{

	@Autowired
	private VoteDao voteDao;

	@Override
	public int add(Vote vote) {
		// TODO Auto-generated method stub
		return voteDao.add(vote);
	}

	@Override
	public List<Vote> findList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return voteDao.findList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return voteDao.getTotal(map);
	}

	@Override
	public List<Vote> findCollectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return voteDao.findCollectList(map);
	}
	

}
