package com.everyfarm.farmer.fund.dto;

import java.sql.Date;

public class FundDetailDto {
	private int stock_no;
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private String stock_kg;
	private String stock_price;
	private String stock_image;
	private String stock_location;
	private String stock_kind;
	private int fund_no;
	private int fund_currentprice;
	private int fund_price;
	private int fund_status;
	private Date fund_regDate;
	private Date fund_endDate;
	private int fund_join;
	private int order_no;
	private Date orderinfo_date;
	private int pay_price;
	private int orderinfo_status;
	public FundDetailDto() {
		
	}
	public FundDetailDto(int stock_no, String mem_id, String stock_name, String stock_detail, String stock_kg,
			String stock_price, String stock_image, String stock_location, String stock_kind, int fund_no,
			int fund_currentprice, int fund_price, int fund_status, Date fund_regDate, Date fund_endDate, int fund_join,
			int order_no, Date orderinfo_date, int pay_price, int orderinfo_status) {
		super();
		this.stock_no = stock_no;
		this.mem_id = mem_id;
		this.stock_name = stock_name;
		this.stock_detail = stock_detail;
		this.stock_kg = stock_kg;
		this.stock_price = stock_price;
		this.stock_image = stock_image;
		this.stock_location = stock_location;
		this.stock_kind = stock_kind;
		this.fund_no = fund_no;
		this.fund_currentprice = fund_currentprice;
		this.fund_price = fund_price;
		this.fund_status = fund_status;
		this.fund_regDate = fund_regDate;
		this.fund_endDate = fund_endDate;
		this.fund_join = fund_join;
		this.order_no = order_no;
		this.orderinfo_date = orderinfo_date;
		this.pay_price = pay_price;
		this.orderinfo_status = orderinfo_status;
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
	public String getStock_kg() {
		return stock_kg;
	}
	public void setStock_kg(String stock_kg) {
		this.stock_kg = stock_kg;
	}
	public String getStock_price() {
		return stock_price;
	}
	public void setStock_price(String stock_price) {
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
	public String getStock_kind() {
		return stock_kind;
	}
	public void setStock_kind(String stock_kind) {
		this.stock_kind = stock_kind;
	}
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
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
	public Date getFund_regDate() {
		return fund_regDate;
	}
	public void setFund_regDate(Date fund_regDate) {
		this.fund_regDate = fund_regDate;
	}
	public Date getFund_endDate() {
		return fund_endDate;
	}
	public void setFund_endDate(Date fund_endDate) {
		this.fund_endDate = fund_endDate;
	}
	public int getFund_join() {
		return fund_join;
	}
	public void setFund_join(int fund_join) {
		this.fund_join = fund_join;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getOrderinfo_date() {
		return orderinfo_date;
	}
	public void setOrderinfo_date(Date orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getOrderinfo_status() {
		return orderinfo_status;
	}
	public void setOrderinfo_status(int orderinfo_status) {
		this.orderinfo_status = orderinfo_status;
	}

	
}
