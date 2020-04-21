package com.everyfarm.farmer.mypage.dto;

import java.sql.Date;

public class FarmerMainDto {


	private String mem_id;
	private int wfarm_key;
	private String wfarm_title;
	private String mf_regdate;
	private int count;
	private int rnum;
	private int	orderinfo_kind;
	private String stock_name;
	private int pay_price;
	private Date orderinfo_date;
	private int order_no;
	private int runningfund;
	private int standbyfund;
	private int runningauc;
	private int standbyauc;
	

	public FarmerMainDto() {
		super();
	}

	
	public FarmerMainDto(String mem_id, int wfarm_key, String wfarm_title, String mf_regdate, int count, int rnum,
			int orderinfo_kind, String stock_name, int pay_price, Date orderinfo_date, int order_no, int runningfund,
			int standbyfund, int runningauc, int standbyauc) {
		super();
		this.mem_id = mem_id;
		this.wfarm_key = wfarm_key;
		this.wfarm_title = wfarm_title;
		this.mf_regdate = mf_regdate;
		this.count = count;
		this.rnum = rnum;
		this.orderinfo_kind = orderinfo_kind;
		this.stock_name = stock_name;
		this.pay_price = pay_price;
		this.orderinfo_date = orderinfo_date;
		this.order_no = order_no;
		this.runningfund = runningfund;
		this.standbyfund = standbyfund;
		this.runningauc = runningauc;
		this.standbyauc = standbyauc;
	}


	public int getOrder_no() {
		return order_no;
	}


	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}



	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getWfarm_key() {
		return wfarm_key;
	}

	public void setWfarm_key(int wfarm_key) {
		this.wfarm_key = wfarm_key;
	}

	public String getWfarm_title() {
		return wfarm_title;
	}

	public void setWfarm_title(String wfarm_title) {
		this.wfarm_title = wfarm_title;
	}

	public String getMf_regdate() {
		return mf_regdate;
	}

	public void setMf_regdate(String mf_regdate) {
		this.mf_regdate = mf_regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getOrderinfo_kind() {
		return orderinfo_kind;
	}

	public void setOrderinfo_kind(int orderinfo_kind) {
		this.orderinfo_kind = orderinfo_kind;
	}

	public String getStock_name() {
		return stock_name;
	}

	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public Date getOrderinfo_date() {
		return orderinfo_date;
	}

	public void setOrderinfo_date(Date orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}


	public int getRunningfund() {
		return runningfund;
	}


	public void setRunningfund(int runningfund) {
		this.runningfund = runningfund;
	}


	public int getStandbyfund() {
		return standbyfund;
	}


	public void setStandbyfund(int standbyfund) {
		this.standbyfund = standbyfund;
	}


	public int getRunningauc() {
		return runningauc;
	}


	public void setRunningauc(int runningauc) {
		this.runningauc = runningauc;
	}


	public int getStandbyauc() {
		return standbyauc;
	}


	public void setStandbyauc(int standbyauc) {
		this.standbyauc = standbyauc;
	}


	
	

}
