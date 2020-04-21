package com.everyfarm.registfarm.dto;

public class FarmDto {
	private int wfarm_key;
	private String mem_id;
	private String wfarm_title;
	private String wfarm_zoneCode;
	private String wfarm_addr;
	private int wfarm_totalArea;
	private int wfarm_price;
	private String wfarm_status;
	private String wfarm_image;
	private String wfarm_content;
	
	public FarmDto() {
		
	}
	
	public FarmDto(int wfarm_key, String mem_id, String wfarm_title, String wfarm_zoneCode, String wfarm_addr,
			int wfarm_totalArea, int wfarm_price, String wfarm_status, String wfarm_image,
			String wfarm_content) {
		super();
		this.wfarm_key = wfarm_key;
		this.mem_id = mem_id;
		this.wfarm_title = wfarm_title;
		this.wfarm_zoneCode = wfarm_zoneCode;
		this.wfarm_addr = wfarm_addr;
		this.wfarm_totalArea = wfarm_totalArea;
		this.wfarm_price = wfarm_price;
		this.wfarm_status = wfarm_status;
		this.wfarm_image = wfarm_image;
		this.wfarm_content = wfarm_content;
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


	public String getWfarm_image() {
		return wfarm_image;
	}

	public void setWfarm_image(String wfarm_image) {
		this.wfarm_image = wfarm_image;
	}

	public String getWfarm_content() {
		return wfarm_content;
	}

	public void setWfarm_content(String wfarm_content) {
		this.wfarm_content = wfarm_content;
	}
	
	
}
