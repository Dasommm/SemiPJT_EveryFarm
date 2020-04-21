package com.everyfarm.admin.dto;

import java.sql.Date;

public class AdminBillListDto {
	
	// 상품
	private int stock_no;
	private String mem_id;
	private String stock_name;
	private String stock_detail;
	private int stock_kg;
	private int stock_price;
	private String stock_image;
	private String stock_location;
	private int stock_kind;
	
	//주문
	private int order_no;
	//private int stock_no;
	//private String mem_id;

	//주문 상세
	private int orderinfo_no;
	//private int order_no;
	private int orderInfo_kg;
	private int orderInfo_status;
	private Date orderInfo_date;
	private int orderInfo_kind;
	
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
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrderinfo_no() {
		return orderinfo_no;
	}
	public void setOrderinfo_no(int orderinfo_no) {
		this.orderinfo_no = orderinfo_no;
	}
	public int getOrderInfo_kg() {
		return orderInfo_kg;
	}
	public void setOrderInfo_kg(int orderInfo_kg) {
		this.orderInfo_kg = orderInfo_kg;
	}
	public int getOrderInfo_status() {
		return orderInfo_status;
	}
	public void setOrderInfo_status(int orderInfo_status) {
		this.orderInfo_status = orderInfo_status;
	}
	public Date getOrderInfo_date() {
		return orderInfo_date;
	}
	public void setOrderInfo_date(Date orderInfo_date) {
		this.orderInfo_date = orderInfo_date;
	}
	public int getOrderInfo_kind() {
		return orderInfo_kind;
	}
	public void setOrderInfo_kind(int orderInfo_kind) {
		this.orderInfo_kind = orderInfo_kind;
	}
	
}
