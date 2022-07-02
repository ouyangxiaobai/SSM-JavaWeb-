package com.szy.entity;

public enum VoteType {
	SINGLE_ONE_TIME("单选只能投一次"),//单选只能投一次
	SINGLE_ONE_DAY("单选一天只能投一次"),//单选一天只能投一次
	MUILTE_ONE_TIME("多选只能投一次"),//多选只能投一次
	MUILTE_ONE_DAY("多选一天只能投一次");//多选一天只能投一次
	private String tips;
	private VoteType(String tips){
		this.tips = tips;
	}
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
	
}
