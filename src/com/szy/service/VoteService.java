package com.szy.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.szy.entity.Vote;

@Service
public interface VoteService {
	public int add(Vote vote);
	public List<Vote> findList(Map<String, Object> map);
	public List<Vote> findCollectList(Map<String, Object> map);
	public int getTotal(Map<String, Object> map);
}
