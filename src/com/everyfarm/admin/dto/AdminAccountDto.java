package com.everyfarm.admin.dto;

import java.sql.Date;

public class AdminAccountDto {
	
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
	
	//펀드
	private int fund_no;
	//private int stock_no;
	private int fund_currentprice;
	private int fund_price;
	private int fund_status;
	private Date fund_regDate;
	private Date fund_endDate;
	private int fund_join;
	
	//참여회원
	private int memjoin_no;
	//private String mem_id;
	//private int fund_no;
	//private int auc_no;
	private int memjoin_aucPrice;
	private int memjoin_fundPrice;
	private Date memjoin_regDate;
	
	//카운팅
	private int stock1_count;
	private int stock2_count;
	private int stock3_count;
	private int stock4_count;
	private int stock5_count;
	private int stock6_count;
	
	//총액 & 인원수
	private int fundSumCurrentPrice;
	private int auctionSumCurrentPrice;
	private int fundCurrentMember;
	private int auctionCurrentMember;
	
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
	public int getMemjoin_no() {
		return memjoin_no;
	}
	public void setMemjoin_no(int memjoin_no) {
		this.memjoin_no = memjoin_no;
	}
	public int getMemjoin_aucPrice() {
		return memjoin_aucPrice;
	}
	public void setMemjoin_aucPrice(int memjoin_aucPrice) {
		this.memjoin_aucPrice = memjoin_aucPrice;
	}
	public int getMemjoin_fundPrice() {
		return memjoin_fundPrice;
	}
	public void setMemjoin_fundPrice(int memjoin_fundPrice) {
		this.memjoin_fundPrice = memjoin_fundPrice;
	}
	public Date getMemjoin_regDate() {
		return memjoin_regDate;
	}
	public void setMemjoin_regDate(Date memjoin_regDate) {
		this.memjoin_regDate = memjoin_regDate;
	}
	public int getStock1_count() {
		return stock1_count;
	}
	public void setStock1_count(int stock1_count) {
		this.stock1_count = stock1_count;
	}
	public int getStock2_count() {
		return stock2_count;
	}
	public void setStock2_count(int stock2_count) {
		this.stock2_count = stock2_count;
	}
	public int getStock3_count() {
		return stock3_count;
	}
	public void setStock3_count(int stock3_count) {
		this.stock3_count = stock3_count;
	}
	public int getStock4_count() {
		return stock4_count;
	}
	public void setStock4_count(int stock4_count) {
		this.stock4_count = stock4_count;
	}
	public int getStock5_count() {
		return stock5_count;
	}
	public void setStock5_count(int stock5_count) {
		this.stock5_count = stock5_count;
	}
	public int getStock6_count() {
		return stock6_count;
	}
	public void setStock6_count(int stock6_count) {
		this.stock6_count = stock6_count;
	}
	public int getFundSumCurrentPrice() {
		return fundSumCurrentPrice;
	}
	public void setFundSumCurrentPrice(int fundSumCurrentPrice) {
		this.fundSumCurrentPrice = fundSumCurrentPrice;
	}
	public int getAuctionSumCurrentPrice() {
		return auctionSumCurrentPrice;
	}
	public void setAuctionSumCurrentPrice(int auctionSumCurrentPrice) {
		this.auctionSumCurrentPrice = auctionSumCurrentPrice;
	}
	public int getFundCurrentMember() {
		return fundCurrentMember;
	}
	public void setFundCurrentMember(int fundCurrentMember) {
		this.fundCurrentMember = fundCurrentMember;
	}
	public int getAuctionCurrentMember() {
		return auctionCurrentMember;
	}
	public void setAuctionCurrentMember(int auctionCurrentMember) {
		this.auctionCurrentMember = auctionCurrentMember;
	}
	
}
