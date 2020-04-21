package com.everyfarm.eventboard.dto;

public class EventPagingDto {

	private int startseq;  //현재 페이지의 첫번째 게시글의 seq
	private int endseq;    //현재 페이지의 마지막 게시글의 seq
	private int underpagescale;  //한번에 표시해줄 아래 페이지 번호의 크기(1 2 3 4 5 or 1 2 3)
	private int pagegroup; //페이지 그룹(1~5,6~10)
	private int totalpage;  //전제 게시글의 수로 계산할 마지막 page번호
	private int currentpage;  //현재 페이지
	private int column;  //한 페이지의 게시글 수(10개씩 끊을 예정)
	
	public EventPagingDto() {
		
	}
	public EventPagingDto(int startseq, int endseq, int underpagescale, int pagegroup, int totalpage, int currentpage,
			int column) {
		super();
		this.startseq = startseq;
		this.endseq = endseq;
		this.underpagescale = underpagescale;
		this.pagegroup = pagegroup;
		this.totalpage = totalpage;
		this.currentpage = currentpage;
		this.column = column;
	}
	public int getStartseq() {
		return startseq;
	}
	public void setStartseq(int startseq) {
		this.startseq = startseq;
	}
	public int getEndseq() {
		return endseq;
	}
	public void setEndseq(int endseq) {
		this.endseq = endseq;
	}
	public int getUnderpagescale() {
		return underpagescale;
	}
	public void setUnderpagescale(int underpagescale) {
		this.underpagescale = underpagescale;
	}
	public int getPagegroup() {
		return pagegroup;
	}
	public void setPagegroup(int pagegroup) {
		this.pagegroup = pagegroup;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getColumn() {
		return column;
	}
	public void setColumn(int column) {
		this.column = column;
	}
	
	
}
