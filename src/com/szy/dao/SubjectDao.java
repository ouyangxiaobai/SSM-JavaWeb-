package com.szy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.szy.entity.Subject;

@Repository
public interface SubjectDao {
	public int add(Subject subject);
	public List<Subject> findByName(Map<String, Object> map);
	public int getTotalByName(Map<String, Object> map);
	public int edit(Subject subject);
	public int delete(String ids);
	public List<Subject> findByRelation(Map<String, Object> map);
	public int addOneVote(Long id);
}
