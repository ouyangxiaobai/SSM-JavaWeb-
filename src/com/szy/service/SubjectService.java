package com.szy.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.szy.entity.Subject;

@Service
public interface SubjectService {
	public int add(Subject subject);
	public List<Subject> findByName(Map<String, Object> map);
	public int getTotalByName(Map<String, Object> map);
	public int edit(Subject subject);
	public int delete(String ids);
	public List<Subject> findByRelation(Map<String, Object> map);
	public int addOneVote(Long id);
}
