package com.everyfarm.registfund.dto;

import java.sql.Date;

public class RegistFundDto {
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private int stock_kg;
	private int stock_price;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	private Date fund_endDate;
	private int fund_price;
	
	public RegistFundDto() {
		
	}
	
	

	public RegistFundDto(String mem_id, String stock_name, String stock_detail, int stock_kg, int stock_price,
			String stock_image, String stock_location, int stock_kind, Date fund_endDate, int fund_price) {
		super();
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_kg = stock_kg;
		this.stock_price = stock_price;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.fund_endDate = fund_endDate;
		this.fund_price = fund_price;
	}



	public int getFund_price() {
		return fund_price;
	}



	public void setFund_price(int fund_price) {
		this.fund_price = fund_price;
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

	public int getStock_kg() {
		return stock_kg;
	}

	public void setStock_kg(int stock_kg) {
		this.stock_kg = stock_kg;
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



	public Date getFund_endDate() {
		return fund_endDate;
	}

	public void setFund_endDate(Date fund_endDate) {
		this.fund_endDate = fund_endDate;
	}
	
	
	
	
}
