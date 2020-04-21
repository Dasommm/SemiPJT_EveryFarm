package com.everyfarm.farmer.auction.dao;

import java.util.List;

import com.everyfarm.farmer.auction.dto.AuctionDetailDto;

public interface AuctionDetailDao {

	//경매 진행현황 리스트 출력
	public List<AuctionDetailDto> selectAllstatus(int startseq, int endseq,String mem_id);
	
	//페이징
	public int totalpage(String mem_id);	
	
	//경매 낙찰 현황 리스트 출력
	public List<AuctionDetailDto> selectEndstatus(int startseq, int endseq,String mem_id);
		
	//경매 낙찰 현황 페이징
	public int EndStatustotalpage(String mem_id);
		
	//낙찰된 경매상품 status=4로 update
	public int updateStatus(int auc_no);
		
	//배송내역 조회
	public List<AuctionDetailDto> selectSendList(int startseq, int endseq,String mem_id);
				
	//페이징
	public int sendListtotalPage(String mem_id);
				
	//경매 미등록 리스트 출력
	public List<AuctionDetailDto> selectNotYetstatus(int startseq, int endseq,String mem_id);
				
	//페이징
	public int notYettotalPage(String mem_id);
}
