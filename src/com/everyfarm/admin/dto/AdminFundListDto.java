package com.everyfarm.admin.dto;

import java.sql.Date;

public class AdminFundListDto {
	
	//펀드
	private int fund_no;
	private int stock_no;
	private int fund_currentprice;
	private int fund_price;
	private int fund_status;
	private Date fund_regDate;
	private Date fund_endDate;
	private int fund_join;
	
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
	
}
