package com.everyfarm.board.dto;

public class BoardPagingDto {

	private int totalrows;		//한페이지에 출력할 게시글 갯수
	private int currentpage;	//현재 페이지
	private int pagescale;		//한번에 보고자하는 페이지의 양. 한번에 1-5페이지 까지 보고 싶다면 5 
	private int startpage;		//시작 페이지. 한번에 1-5페이지까지 보고 싶다면 1
	private int endpage;		//마지막 페이지. 한번에 1-5페이지까지 보고 싶다면 5
	private int pagegroup;		//한번에 묶이는 페이지 그룹. 1-5페이지는 1, 6-10페이지는 2
	private int totalpage;		//총 만들어지는 페이지 수. 내가 가지고 있는 게시글로 표시할 수 있는 마지막 page번호.
								//만약 게시글이 126개가 있고, 한 페이지당 10개의 게시글을 표시한다고 하면, 13개의 페이지가 생긴다.
	
	private int to;				// 한 페이지에 표시될 게시글 어디까지
	private int from;			// 어디서부터
	
	public BoardPagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardPagingDto(int totalrows, int currentpage, int pagescale, int startpage, int endpage, int pagegroup,
			int totalpage, int to, int from) {
		super();
		this.totalrows = totalrows;
		this.currentpage = currentpage;
		this.pagescale = pagescale;
		this.startpage = startpage;
		this.endpage = endpage;
		this.pagegroup = pagegroup;
		this.totalpage = totalpage;
		this.to = to;
		this.from = from;
	}

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

	public int getTo() {
		return to;
	}

	public void setTo(int to) {
		this.to = to;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}
	
	
	
}
