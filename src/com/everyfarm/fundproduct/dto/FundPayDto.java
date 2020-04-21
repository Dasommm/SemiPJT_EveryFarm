package com.everyfarm.fundproduct.dto;

public class FundPayDto {
	
	private int order_no;
	private int stock_no;
	private int fund_no;
	private int pay_no;
	private int pay_price;
	private String mem_id;
	

	
	
	public FundPayDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FundPayDto(int order_no, int stock_no, int fund_no, int pay_no, int pay_price, String mem_id) {
		super();
		this.order_no = order_no;
		this.stock_no = stock_no;
		this.fund_no = fund_no;
		this.pay_no = pay_no;
		this.pay_price = pay_price;
		this.mem_id = mem_id;
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

	public int getFund_no() {
		return fund_no;
	}

	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
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

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

}
