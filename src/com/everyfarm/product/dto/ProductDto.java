package com.everyfarm.product.dto;

import java.sql.Date;

public class ProductDto {

	//상품영역
	private int stock_no;
	private String mem_id;
	private int mem_grade;
	private String stock_name;
	private String stock_detail;
	private int stock_kg;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	
	//경매영역
	private int auc_no;
	private int auc_startPrice;
	private int auc_nowPrice;
	private int auc_status;
	private Date auc_regDate;
	private Date auc_endDate;
	private int auc_join;
	
	//경매 에이작스 영역
	private int day;
	private int hours;
	private int minutes;
	private int seconds;
	
	private String localtime;  //현재 시간
	
	//쪽지 테이블 영역
	private String letter_sender;
	private String letter_title;
	private String letter_content;
	
	
	public ProductDto() {
		
	}


	public ProductDto(int stock_no, String mem_id, int mem_grade, String stock_name, String stock_detail, int stock_kg,
			String stock_image, String stock_location, int stock_kind, int auc_no, int auc_startPrice, int auc_nowPrice,
			int auc_status, Date auc_regDate, Date auc_endDate, int auc_join, int day, int hours, int minutes,
			int seconds, String localtime, String letter_sender, String letter_title, String letter_content) {
		super();
		this.stock_no = stock_no;
		this.mem_id = mem_id;
		this.mem_grade = mem_grade;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_kg = stock_kg;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.auc_no = auc_no;
		this.auc_startPrice = auc_startPrice;
		this.auc_nowPrice = auc_nowPrice;
		this.auc_status = auc_status;
		this.auc_regDate = auc_regDate;
		this.auc_endDate = auc_endDate;
		this.auc_join = auc_join;
		this.day = day;
		this.hours = hours;
		this.minutes = minutes;
		this.seconds = seconds;
		this.localtime = localtime;
		this.letter_sender = letter_sender;
		this.letter_title = letter_title;
		this.letter_content = letter_content;
	}


	public int getStock_no() {
		return stock_no;
	}


	public void setStock_no(int stock_no) {
		this.stock_no = stock_no;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public int getMem_grade() {
		return mem_grade;
	}


	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}


	public String getStock_name() {
		return stock_name;
	}


	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}


	public String getStock_detail() {
		return stock_detail;
	}


	public void setStock_detail(String stock_detail) {
		this.stock_detail = stock_detail;
	}


	public int getStock_kg() {
		return stock_kg;
	}


	public void setStock_kg(int stock_kg) {
		this.stock_kg = stock_kg;
	}


	public String getStock_image() {
		return stock_image;
	}


	public void setStock_image(String stock_image) {
		this.stock_image = stock_image;
	}


	public String getStock_location() {
		return stock_location;
	}


	public void setStock_location(String stock_location) {
		this.stock_location = stock_location;
	}


	public int getStock_kind() {
		return stock_kind;
	}


	public void setStock_kind(int stock_kind) {
		this.stock_kind = stock_kind;
	}


	public int getAuc_no() {
		return auc_no;
	}


	public void setAuc_no(int auc_no) {
		this.auc_no = auc_no;
	}


	public int getAuc_startPrice() {
		return auc_startPrice;
	}


	public void setAuc_startPrice(int auc_startPrice) {
		this.auc_startPrice = auc_startPrice;
	}


	public int getAuc_nowPrice() {
		return auc_nowPrice;
	}


	public void setAuc_nowPrice(int auc_nowPrice) {
		this.auc_nowPrice = auc_nowPrice;
	}


	public int getAuc_status() {
		return auc_status;
	}


	public void setAuc_status(int auc_status) {
		this.auc_status = auc_status;
	}


	public Date getAuc_regDate() {
		return auc_regDate;
	}


	public void setAuc_regDate(Date auc_regDate) {
		this.auc_regDate = auc_regDate;
	}


	public Date getAuc_endDate() {
		return auc_endDate;
	}


	public void setAuc_endDate(Date auc_endDate) {
		this.auc_endDate = auc_endDate;
	}


	public int getAuc_join() {
		return auc_join;
	}


	public void setAuc_join(int auc_join) {
		this.auc_join = auc_join;
	}


	public int getDay() {
		return day;
	}


	public void setDay(int day) {
		this.day = day;
	}


	public int getHours() {
		return hours;
	}


	public void setHours(int hours) {
		this.hours = hours;
	}


	public int getMinutes() {
		return minutes;
	}


	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}


	public int getSeconds() {
		return seconds;
	}


	public void setSeconds(int seconds) {
		this.seconds = seconds;
	}


	public String getLocaltime() {
		return localtime;
	}


	public void setLocaltime(String localtime) {
		this.localtime = localtime;
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

}
