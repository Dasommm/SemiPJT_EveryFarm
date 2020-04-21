package com.everyfarm.eventboard.dto;

import java.util.Date;

public class EventBoardDto {

	private int eve_seq;
	private String eve_writer;
	private String eve_title;
	private String eve_content;
	private Date eve_regDate;
	private int eve_count;
	private String eve_img;
	private String eve_addr;
	
	public EventBoardDto() {
		
	}

	public EventBoardDto(int eve_seq, String eve_writer, String eve_title, String eve_content, Date eve_regDate,
			int eve_count, String eve_img, String eve_addr) {
		super();
		this.eve_seq = eve_seq;
		this.eve_writer = eve_writer;
		this.eve_title = eve_title;
		this.eve_content = eve_content;
		this.eve_regDate = eve_regDate;
		this.eve_count = eve_count;
		this.eve_img = eve_img;
		this.eve_addr = eve_addr;
	}

	public int getEve_seq() {
		return eve_seq;
	}

	public void setEve_seq(int eve_seq) {
		this.eve_seq = eve_seq;
	}

	public String getEve_writer() {
		return eve_writer;
	}

	public void setEve_writer(String eve_writer) {
		this.eve_writer = eve_writer;
	}

	public String getEve_title() {
		return eve_title;
	}

	public void setEve_title(String eve_title) {
		this.eve_title = eve_title;
	}

	public String getEve_content() {
		return eve_content;
	}

	public void setEve_content(String eve_content) {
		this.eve_content = eve_content;
	}

	public Date getEve_regDate() {
		return eve_regDate;
	}

	public void setEve_regDate(Date eve_regDate) {
		this.eve_regDate = eve_regDate;
	}

	public int getEve_count() {
		return eve_count;
	}

	public void setEve_count(int eve_count) {
		this.eve_count = eve_count;
	}

	public String getEve_img() {
		return eve_img;
	}

	public void setEve_img(String eve_img) {
		this.eve_img = eve_img;
	}

	public String getEve_addr() {
		return eve_addr;
	}

	public void setEve_addr(String eve_addr) {
		this.eve_addr = eve_addr;
	}
	
	
}
