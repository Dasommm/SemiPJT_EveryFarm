package com.everyfarm.admin.dto;

public class PagingDto {
	
	private int totalrows;
	private int currentpage;
	private int pagescale;
	private int startpage;
	private int endpage;
	private int pagegroup;
	private int totalpage;
	
	private int from;
	private int to;
	
	public int getTotalrows() {
		return totalrows;
	}
	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagescale() {
		return pagescale;
	}
	public void setPagescale(int pagescale) {
		this.pagescale = pagescale;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
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
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	
}
