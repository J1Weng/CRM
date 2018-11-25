package com.j1weng.entity;

import java.util.List;

public class PageBean<Object> {
	private int pageNum;   //当前页码
	private int pageRecord;   //当页记录数
	private int totalRecord;   //总记录数
	private int totalPage;   //总页数
	private List<Object> beanList;   //当前页的记录
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageRecord() {
		return pageRecord;
	}
	public void setPageRecord(int pageRecord) {
		this.pageRecord = pageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totolPage) {
		this.totalPage = totolPage;
	}
	public List<Object> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<Object> beanList) {
		this.beanList = beanList;
	}
	
	 @Override
	    public String toString() {
	        return "PageBean{" +
	                "pageNum=" + pageNum +
	                ", pageRecord=" + pageRecord +
	                ", totalRecord=" + totalRecord +
	                ", totalPage=" + totalPage +
	                ", beanList=" + beanList +
	                '}';
	    }

}
