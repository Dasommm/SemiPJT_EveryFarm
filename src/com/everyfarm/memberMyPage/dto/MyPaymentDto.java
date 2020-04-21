package com.everyfarm.memberMyPage.dto;

import java.util.Date;

public class MyPaymentDto {
	//주문
	private int order_no;
	private int stock_no;
	private String mem_id;
	private int orderinfo_no;
	private int orderinfo_kg;
	private int orderinfo_status;
	private Date orderinfo_date;
	private int orderinfo_kind;
	
	//결제
	private int pay_no;
	private int pay_price;
	
	//상품
	private String stock_name;
	private int fund_status;
	private int auc_status;
	private int fund_no;
	private int auc_no;
	private String stock_image;
	private int auc_nowPrice;
	private int stock_kg;
	
	//페이징
	private int startseq;
	private int endseq;
	
	public MyPaymentDto() {
		
	}
	public MyPaymentDto(int order_no, int stock_no, String mem_id, int orderinfo_no, int orderinfo_kg,
			int orderinfo_status, Date orderinfo_date, int orderinfo_kind, int pay_no, int pay_price, String stock_name,
			int fund_status, int auc_status) {
		super();
		this.order_no = order_no;
		this.stock_no = stock_no;
		this.mem_id = mem_id;
		this.orderinfo_no = orderinfo_no;
		this.orderinfo_kg = orderinfo_kg;
		this.orderinfo_status = orderinfo_status;
		this.orderinfo_date = orderinfo_date;
		this.orderinfo_kind = orderinfo_kind;
		this.pay_no = pay_no;
		this.pay_price = pay_price;
		this.stock_name = stock_name;
		this.fund_status = fund_status;
		this.auc_status = auc_status;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public int getOrderinfo_no() {
		return orderinfo_no;
	}
	public void setOrderinfo_no(int orderinfo_no) {
		this.orderinfo_no = orderinfo_no;
	}
	public int getOrderinfo_kg() {
		return orderinfo_kg;
	}
	public void setOrderinfo_kg(int orderinfo_kg) {
		this.orderinfo_kg = orderinfo_kg;
	}
	public int getOrderinfo_status() {
		return orderinfo_status;
	}
	public void setOrderinfo_status(int orderinfo_status) {
		this.orderinfo_status = orderinfo_status;
	}
	public Date getOrderinfo_date() {
		return orderinfo_date;
	}
	public void setOrderinfo_date(Date orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}
	public int getOrderinfo_kind() {
		return orderinfo_kind;
	}
	public void setOrderinfo_kind(int orderinfo_kind) {
		this.orderinfo_kind = orderinfo_kind;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}
	public int getFund_status() {
		return fund_status;
	}
	public void setFund_status(int fund_status) {
		this.fund_status = fund_status;
	}
	public int getAuc_status() {
		return auc_status;
	}
	public void setAuc_status(int auc_status) {
		this.auc_status = auc_status;
	}
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}
	public int getAuc_no() {
		return auc_no;
	}
	public void setAuc_no(int auc_no) {
		this.auc_no = auc_no;
	}
	public String getStock_image() {
		return stock_image;
	}
	public void setStock_image(String stock_image) {
		this.stock_image = stock_image;
	}
	public int getAuc_nowPrice() {
		return auc_nowPrice;
	}
	public void setAuc_nowPrice(int auc_nowPrice) {
		this.auc_nowPrice = auc_nowPrice;
	}
	public int getStock_kg() {
		return stock_kg;
	}
	public void setStock_kg(int stock_kg) {
		this.stock_kg = stock_kg;
	}
	public int getStartseq() {
		return startseq;
	}
	public void setStartseq(int startseq) {
		this.startseq = startseq;
	}
	public int getEndseq() {
		return endseq;
	}
	public void setEndseq(int endseq) {
		this.endseq = endseq;
	}
	
}
