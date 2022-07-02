package com.szy.page;

import org.springframework.stereotype.Component;

@Component
public class Page {
	private int page;//��ǰҳ��
	private int rows;//ÿҳ��ʾ����
	private int offset = 0;//�α���ʼ��
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getOffset() {
		this.offset = (page - 1)*rows;
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
}
