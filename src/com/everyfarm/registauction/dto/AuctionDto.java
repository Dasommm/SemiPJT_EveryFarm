package com.everyfarm.registauction.dto;

import java.sql.Date;

public class AuctionDto {

	// 회원아이디(등록하는 농부)
	private String mem_id;
	// 상품명
	private String stock_name;
	// 상품 특징
	private String stock_detail;
	// 무게(전체)
	private int stock_kg;
	// 경매시작가(농부가 지정)
	private int auc_startPrice;

	// 상품이미지
	private String stock_image;
	// 지역(생산지)
	private String stock_location;
	// 품목
	private int stock_kind;
	//경매 종료일
	private Date auc_endDate;
	
	public AuctionDto() {
		
	}
	
	public AuctionDto(String mem_id, String stock_name, String stock_detail, int stock_kg, int auc_startPrice,
			String stock_image, String stock_location, int stock_kind, Date auc_endDate) {
		super();
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_kg = stock_kg;
		this.auc_startPrice = auc_startPrice;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.auc_endDate = auc_endDate;
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

	public int getAuc_startPrice() {
		return auc_startPrice;
	}

	public void setAuc_startPrice(int auc_startPrice) {
		this.auc_startPrice = auc_startPrice;
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

	public Date getAuc_endDate() {
		return auc_endDate;
	}

	public void setAuc_endDate(Date auc_endDate) {
		this.auc_endDate = auc_endDate;
	}
	
	

}
