package com.everyfarm.farmer.farm.dto;

import java.sql.Date;

public class FarmDto {

	private int wfarm_key;
	private String mem_id;
	private String wfarm_title;
	private int wfarm_totalArea;
	private int wfarm_price;
	private String wfarm_status;
	private Date wfarm_regDate;
	private int areacount;
	private String wfarm_zoneCode;
	private String wfarm_addr;
	private int count;
	private String mf_regdate;
	public FarmDto() {
		super();
	}
	
	
	

	public FarmDto(int wfarm_key, String mem_id, String wfarm_title, int wfarm_totalArea, int wfarm_price,
			String wfarm_status, Date wfarm_regDate, int areacount, String wfarm_zoneCode, String wfarm_addr, int count,
			String mf_regdate) {
		super();
		this.wfarm_key = wfarm_key;
		this.mem_id = mem_id;
		this.wfarm_title = wfarm_title;
		this.wfarm_totalArea = wfarm_totalArea;
		this.wfarm_price = wfarm_price;
		this.wfarm_status = wfarm_status;
		this.wfarm_regDate = wfarm_regDate;
		this.areacount = areacount;
		this.wfarm_zoneCode = wfarm_zoneCode;
		this.wfarm_addr = wfarm_addr;
		this.count = count;
		this.mf_regdate = mf_regdate;
	}




	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}




	public String getMf_regdate() {
		return mf_regdate;
	}




	public void setMf_regdate(String mf_regdate) {
		this.mf_regdate = mf_regdate;
	}




	public int getWfarm_key() {
		return wfarm_key;
	}
	public void setWfarm_key(int wfarm_key) {
		this.wfarm_key = wfarm_key;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getWfarm_title() {
		return wfarm_title;
	}
	public void setWfarm_title(String wfarm_title) {
		this.wfarm_title = wfarm_title;
	}
	public int getWfarm_totalArea() {
		return wfarm_totalArea;
	}
	public void setWfarm_totalArea(int wfarm_totalArea) {
		this.wfarm_totalArea = wfarm_totalArea;
	}
	public int getWfarm_price() {
		return wfarm_price;
	}
	public void setWfarm_price(int wfarm_price) {
		this.wfarm_price = wfarm_price;
	}
	public String getWfarm_status() {
		return wfarm_status;
	}
	public void setWfarm_status(String wfarm_status) {
		this.wfarm_status = wfarm_status;
	}
	public Date getWfarm_regDate() {
		return wfarm_regDate;
	}
	public void setWfarm_regDate(Date wfarm_regDate) {
		this.wfarm_regDate = wfarm_regDate;
	}
	public int getAreacount() {
		return areacount;
	}
	public void setAreacount(int areacount) {
		this.areacount = areacount;
	}


	public String getWfarm_zoneCode() {
		return wfarm_zoneCode;
	}


	public void setWfarm_zoneCode(String wfarm_zoneCode) {
		this.wfarm_zoneCode = wfarm_zoneCode;
	}


	public String getWfarm_addr() {
		return wfarm_addr;
	}


	public void setWfarm_addr(String wfarm_addr) {
		this.wfarm_addr = wfarm_addr;
	}
	
	
	
}
