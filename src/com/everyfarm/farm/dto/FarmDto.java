package com.everyfarm.farm.dto;

import java.util.Date;

public class FarmDto {
	
	private int wfarm_key;
	private String mem_id;
	private String wfarm_title;
	private String wfarm_zoneCode;
	private String wfarm_addr;
	private int wfarm_totalArea;
	private int wfarm_price;
	private String wfarm_status;
	private Date wfarm_regDate;
	private String wfarm_image;
	private String wfarm_content;
	
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_zonecode;
	private String mem_addr;
	private String mem_addretc;
	private String mem_email;
	private int mem_grade;
	private String mem_regdate;
	private String mem_drop;
	
	private String mf_area;
	private int totalprice;
	private int selectedCnt;
	
	//쪽지 테이블 영역
		private String letter_sender;
		private String letter_title;
		private String letter_content;
	
    //주말농장 땅위치(배열객체)
		private int array;
		
	public FarmDto() {
		
	}

	public FarmDto(int wfarm_key, String mem_id, String wfarm_title, String wfarm_zoneCode, String wfarm_addr,
			int wfarm_totalArea, int wfarm_price, String wfarm_status, Date wfarm_regDate, String wfarm_image,
			String wfarm_content, String mem_pw, String mem_name, String mem_phone, String mem_zonecode,
			String mem_addr, String mem_addretc, String mem_email, int mem_grade, String mem_regdate, String mem_drop,
			String mf_area, int totalprice, int selectedCnt, String letter_sender, String letter_title,
			String letter_content, int array) {
		super();
		this.wfarm_key = wfarm_key;
		this.mem_id = mem_id;
		this.wfarm_title = wfarm_title;
		this.wfarm_zoneCode = wfarm_zoneCode;
		this.wfarm_addr = wfarm_addr;
		this.wfarm_totalArea = wfarm_totalArea;
		this.wfarm_price = wfarm_price;
		this.wfarm_status = wfarm_status;
		this.wfarm_regDate = wfarm_regDate;
		this.wfarm_image = wfarm_image;
		this.wfarm_content = wfarm_content;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_zonecode = mem_zonecode;
		this.mem_addr = mem_addr;
		this.mem_addretc = mem_addretc;
		this.mem_email = mem_email;
		this.mem_grade = mem_grade;
		this.mem_regdate = mem_regdate;
		this.mem_drop = mem_drop;
		this.mf_area = mf_area;
		this.totalprice = totalprice;
		this.selectedCnt = selectedCnt;
		this.letter_sender = letter_sender;
		this.letter_title = letter_title;
		this.letter_content = letter_content;
		this.array = array;
	}

	public int getWfarm_key() {
		return wfarm_key;
	}

	public void setWfarm_key(int wfarm_key) {
		this.wfarm_key = wfarm_key;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getWfarm_title() {
		return wfarm_title;
	}

	public void setWfarm_title(String wfarm_title) {
		this.wfarm_title = wfarm_title;
	}

	public String getWfarm_zoneCode() {
		return wfarm_zoneCode;
	}

	public void setWfarm_zoneCode(String wfarm_zoneCode) {
		this.wfarm_zoneCode = wfarm_zoneCode;
	}

	public String getWfarm_addr() {
		return wfarm_addr;
	}

	public void setWfarm_addr(String wfarm_addr) {
		this.wfarm_addr = wfarm_addr;
	}

	public int getWfarm_totalArea() {
		return wfarm_totalArea;
	}

	public void setWfarm_totalArea(int wfarm_totalArea) {
		this.wfarm_totalArea = wfarm_totalArea;
	}

	public int getWfarm_price() {
		return wfarm_price;
	}

	public void setWfarm_price(int wfarm_price) {
		this.wfarm_price = wfarm_price;
	}

	public String getWfarm_status() {
		return wfarm_status;
	}

	public void setWfarm_status(String wfarm_status) {
		this.wfarm_status = wfarm_status;
	}

	public Date getWfarm_regDate() {
		return wfarm_regDate;
	}

	public void setWfarm_regDate(Date wfarm_regDate) {
		this.wfarm_regDate = wfarm_regDate;
	}

	public String getWfarm_image() {
		return wfarm_image;
	}

	public void setWfarm_image(String wfarm_image) {
		this.wfarm_image = wfarm_image;
	}

	public String getWfarm_content() {
		return wfarm_content;
	}

	public void setWfarm_content(String wfarm_content) {
		this.wfarm_content = wfarm_content;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_zonecode() {
		return mem_zonecode;
	}

	public void setMem_zonecode(String mem_zonecode) {
		this.mem_zonecode = mem_zonecode;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_addretc() {
		return mem_addretc;
	}

	public void setMem_addretc(String mem_addretc) {
		this.mem_addretc = mem_addretc;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public int getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getMem_regdate() {
		return mem_regdate;
	}

	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}

	public String getMem_drop() {
		return mem_drop;
	}

	public void setMem_drop(String mem_drop) {
		this.mem_drop = mem_drop;
	}

	public String getMf_area() {
		return mf_area;
	}

	public void setMf_area(String mf_area) {
		this.mf_area = mf_area;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getSelectedCnt() {
		return selectedCnt;
	}

	public void setSelectedCnt(int selectedCnt) {
		this.selectedCnt = selectedCnt;
	}

	public String getLetter_sender() {
		return letter_sender;
	}

	public void setLetter_sender(String letter_sender) {
		this.letter_sender = letter_sender;
	}

	public String getLetter_title() {
		return letter_title;
	}

	public void setLetter_title(String letter_title) {
		this.letter_title = letter_title;
	}

	public String getLetter_content() {
		return letter_content;
	}

	public void setLetter_content(String letter_content) {
		this.letter_content = letter_content;
	}

	public int getArray() {
		return array;
	}

	public void setArray(int array) {
		this.array = array;
	}

	
}
