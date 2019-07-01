package com.company.utils;

public class Page {
	private int currentPage;
	private int prevPage;
	private int nextPage;
	private int pageCount;
	private int count;
	private int pageSize;
	private int startRecord;
	public Page(String curPage,int count,int pageSize) {
		this.currentPage=(curPage==null||curPage.equals(""))?1:Integer.parseInt(curPage);
		this.count=count;
		this.pageSize=pageSize;
		this.pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		this.prevPage=currentPage==1?1:currentPage-1;
		this.nextPage=currentPage==pageCount?pageCount:currentPage+1;
		this.startRecord=(currentPage-1)*pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public int getCount() {
		return count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getStartRecord() {
		return startRecord;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", pageCount="
				+ pageCount + ", count=" + count + ", pageSize=" + pageSize + ", startRecord=" + startRecord + "]";
	}

	
}
