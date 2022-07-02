package com.szy.entity;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class Vote {
	private Long id;
	private Long userId;
	private Long subjectId;
	private Long subjectItemId;
	private User user;
	private Subject subject;
	private SubjectItem subjectItem;
	private List<SubjectItem> subjectItems;
	private Date createTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	
	public Long getSubjectItemId() {
		return subjectItemId;
	}
	public void setSubjectItemId(Long subjectItemId) {
		this.subjectItemId = subjectItemId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public SubjectItem getSubjectItem() {
		return subjectItem;
	}
	public void setSubjectItem(SubjectItem subjectItem) {
		this.subjectItem = subjectItem;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<SubjectItem> getSubjectItems() {
		return subjectItems;
	}
	public void setSubjectItems(List<SubjectItem> subjectItems) {
		this.subjectItems = subjectItems;
	}
	
}
