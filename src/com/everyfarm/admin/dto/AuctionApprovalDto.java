package com.everyfarm.admin.dto;

import java.sql.Date;

public class AuctionApprovalDto {

	//경매
	private int auc_no;
	private int stock_no;
	private int auc_startPrice;
	private int auc_nowPrice;
	private int auc_status;
	private Date auc_regDate;
	private Date auc_endDate;
	private int auc_join;

	//상품
	//private int stock_no;
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private int stock_kg;
	private int stock_price;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	
	public AuctionApprovalDto() {
		super();
	}

	public AuctionApprovalDto(int auc_startPrice, int auc_nowPrice, Date auc_regDate, Date auc_endDate, String mem_id,
			String stock_name) {
		super();
		this.auc_startPrice = auc_startPrice;
		this.auc_nowPrice = auc_nowPrice;
		this.auc_regDate = auc_regDate;
		this.auc_endDate = auc_endDate;
		this.mem_id = mem_id;
		this.stock_name = stock_name;
	}
	
	public int getAuc_no() {
		return auc_no;
	}
	public void setAuc_no(int auc_no) {
		this.auc_no = auc_no;
	}
	public int getStock_no() {
		return stock_no;
	}
	public void setStock_no(int stock_no) {
		this.stock_no = stock_no;
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
	
}
