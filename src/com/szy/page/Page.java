package com.szy.page;

import org.springframework.stereotype.Component;

@Component
public class Page {
	private int page;//当前页码
	private int rows;//每页显示数量
	private int offset = 0;//游标起始量
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
