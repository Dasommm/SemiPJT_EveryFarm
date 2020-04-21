package com.everyfarm.farmer.auction.biz;

import java.util.List;

import com.everyfarm.farmer.auction.dto.ADPagingDto;
import com.everyfarm.farmer.auction.dto.AuctionDetailDto;

public interface AuctionDetailBiz {

	//경매 진행 현황 리스트 출력
	public List<AuctionDetailDto> selectAllstatus(ADPagingDto dto,String mem_id);
	
	//페이징
	public int totalPage(int column,String mem_id);
	
	//경매 미등록 리스트 출력
	public List<AuctionDetailDto> selectNotYetstatus(ADPagingDto dto,String mem_id);
		
	//페이징
	public int notYettotalPage(int column,String mem_id);
	
	//경매 낙찰 현황 리스트 출력
	public List<AuctionDetailDto> selectEndstatus(ADPagingDto dto,String mem_id);
	
	//페이징
	public int endStatustotalPage(int column,String mem_id);
	
	//낙찰된 경매상품 status=4로 update
	public int updateStatus(int auc_no);
	
	//배송내역 조회
	public List<AuctionDetailDto> selectSendList(ADPagingDto dto,String mem_id);
		
	//페이징
	public int sendListtotalPage(int column,String mem_id);
	
}
