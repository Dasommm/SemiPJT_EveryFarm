package com.everyfarm.fundproduct.dto;

import java.sql.Date;

public class FundDto {
	
	//펀드
	private int fund_no;
	private int stock_no;
	private int fund_currentprice;
	private int fund_price;
	private int fund_status;
	private Date fund_regdate;
	private Date fund_enddate;
	private int fund_join;
	
	//상품
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private int stock_price;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	private int stock_kg;
	
	///ajax영역
	private int day;
	private int hours;
	private int minutes;
	
	
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




	public FundDto(int fund_no, int stock_no, int fund_currentprice, int fund_price, int fund_status, Date fund_regdate,
			Date fund_enddate, int fund_join, String mem_id, String stock_name, String stock_detail, int stock_price,
			String stock_image, String stock_location, int stock_kind, int stock_kg, int day, int hours, int minutes) {
		super();
		this.fund_no = fund_no;
		this.stock_no = stock_no;
		this.fund_currentprice = fund_currentprice;
		this.fund_price = fund_price;
		this.fund_status = fund_status;
		this.fund_regdate = fund_regdate;
		this.fund_enddate = fund_enddate;
		this.fund_join = fund_join;
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_price = stock_price;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.stock_kg = stock_kg;
		this.day = day;
		this.hours = hours;
		this.minutes = minutes;
	}


	
	
	public FundDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public FundDto(int fund_no, int stock_no, int fund_currentprice, int fund_price, int fund_status, Date fund_regdate,
			Date fund_enddate, int fund_join, String mem_id, String stock_name, String stock_detail, int stock_price,
			String stock_image, String stock_location, int stock_kind, int stock_kg) {
		super();
		this.fund_no = fund_no;
		this.stock_no = stock_no;
		this.fund_currentprice = fund_currentprice;
		this.fund_price = fund_price;
		this.fund_status = fund_status;
		this.fund_regdate = fund_regdate;
		this.fund_enddate = fund_enddate;
		this.fund_join = fund_join;
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_price = stock_price;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.stock_kg = stock_kg;
	}





	public int getStock_kg() {
		return stock_kg;
	}


	public void setStock_kg(int stock_kg) {
		this.stock_kg = stock_kg;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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


	public int getStock_price() {
		return stock_price;
	}


	public void setStock_price(int stock_price) {
		this.stock_price = stock_price;
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





	public int getFund_no() {
		return fund_no;
	}


	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}


	public int getStock_no() {
		return stock_no;
	}


	public void setStock_no(int stock_no) {
		this.stock_no = stock_no;
	}


	public int getFund_currentprice() {
		return fund_currentprice;
	}


	public void setFund_currentprice(int fund_currentprice) {
		this.fund_currentprice = fund_currentprice;
	}


	public int getFund_price() {
		return fund_price;
	}


	public void setFund_price(int fund_price) {
		this.fund_price = fund_price;
	}


	public int getFund_status() {
		return fund_status;
	}


	public void setFund_status(int fund_status) {
		this.fund_status = fund_status;
	}


	public Date getFund_regdate() {
		return fund_regdate;
	}


	public void setFund_regdate(Date fund_regdate) {
		this.fund_regdate = fund_regdate;
	}


	public Date getFund_enddate() {
		return fund_enddate;
	}


	public void setFund_enddate(Date fund_enddate) {
		this.fund_enddate = fund_enddate;
	}


	public int getFund_join() {
		return fund_join;
	}


	public void setFund_join(int fund_join) {
		this.fund_join = fund_join;
	}

	
	
}


