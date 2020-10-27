package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "PageVo [pageNo=" + pageNo + "]";
	}

	public PageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
