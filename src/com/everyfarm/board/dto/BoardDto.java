package com.everyfarm.board.dto;

import java.sql.Date;

public class BoardDto {
	
	// 게시판
	private int board_id;
	private String mem_id;
	private String board_title;
	private String board_content;
	private int board_readcnt;
	private Date board_regdate;
	private String board_image;
	private int board_category;
	
	//댓글
	private int comment_no;
	private String comment_content;
	private Date comment_regdate;
	
	public BoardDto(int board_id, String mem_id, String board_title, String board_content, int board_readcnt,
			Date board_regdate, String board_image, int board_category, int comment_no, String comment_content,
			Date comment_regdate) {
		super();
		this.board_id = board_id;
		this.mem_id = mem_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_readcnt = board_readcnt;
		this.board_regdate = board_regdate;
		this.board_image = board_image;
		this.board_category = board_category;
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.comment_regdate = comment_regdate;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_readcnt() {
		return board_readcnt;
	}

	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}

	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public String getBoard_image() {
		return board_image;
	}

	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}

	public int getBoard_category() {
		return board_category;
	}

	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}
	
	

}
