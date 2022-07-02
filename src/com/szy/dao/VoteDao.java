package com.szy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.szy.entity.Vote;

@Repository
public interface VoteDao {
	public int add(Vote vote);
	public List<Vote> findList(Map<String, Object> map);
	public List<Vote> findCollectList(Map<String, Object> map);
	public int getTotal(Map<String, Object> map);
}
