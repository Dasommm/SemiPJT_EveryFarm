package com.everyfarm.farmer.auction.dto;

import java.sql.Date;

public class AuctionDetailDto {

	private int stock_no;
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private int stock_kg;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	private int auc_no;
	private int auc_nowPrice;
	private int auc_startPrice;
	private int auc_status;
	private Date auc_endDate;
	private Date auc_regDate;
	private int auc_join;
	
	public AuctionDetailDto() {
		
	}

	public AuctionDetailDto(int stock_no, String mem_id, String stock_name, String stock_detail, int stock_kg,
			String stock_image, String stock_location, int stock_kind, int auc_no, int auc_nowPrice, int auc_startPrice,
			int auc_status, Date auc_endDate, Date auc_regDate, int auc_join) {
		super();
		this.stock_no = stock_no;
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_kg = stock_kg;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.auc_no = auc_no;
		this.auc_nowPrice = auc_nowPrice;
		this.auc_startPrice = auc_startPrice;
		this.auc_status = auc_status;
		this.auc_endDate = auc_endDate;
		this.auc_regDate = auc_regDate;
		this.auc_join = auc_join;
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

	public int getAuc_nowPrice() {
		return auc_nowPrice;
	}

	public void setAuc_nowPrice(int auc_nowPrice) {
		this.auc_nowPrice = auc_nowPrice;
	}

	public int getAuc_startPrice() {
		return auc_startPrice;
	}

	public void setAuc_startPrice(int auc_startPrice) {
		this.auc_startPrice = auc_startPrice;
	}

	public int getAuc_status() {
		return auc_status;
	}

	public void setAuc_status(int auc_status) {
		this.auc_status = auc_status;
	}

	public Date getAuc_endDate() {
		return auc_endDate;
	}

	public void setAuc_endDate(Date auc_endDate) {
		this.auc_endDate = auc_endDate;
	}

	public Date getAuc_regDate() {
		return auc_regDate;
	}

	public void setAuc_regDate(Date auc_regDate) {
		this.auc_regDate = auc_regDate;
	}

	public int getAuc_join() {
		return auc_join;
	}

	public void setAuc_join(int auc_join) {
		this.auc_join = auc_join;
	}
	

}
