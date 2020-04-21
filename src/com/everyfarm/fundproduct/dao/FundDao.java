package com.everyfarm.fundproduct.dao;

import java.util.List;

import com.everyfarm.fundproduct.dto.FundDto;
import com.everyfarm.fundproduct.dto.FundPayDto;

public interface FundDao {
	
	//펀드 모든 List 가져오기
	public List<FundDto> fundAllList(int to, int from);
	
	//펀드 best 4 가져오기
	public List<FundDto> fundBestList();
	
	//펀드 상세정보
	public FundDto fundDetail(int stock_no);
	
	//페이징,  현재 가지고 있는 총 게시글의 수
	public int totalpage();
	
	//주문 테이블에 insert 하기
	public FundPayDto orderInput(int stock_no, String mem_id, int orderinfo_kg, int fund_no);
	
	//결제 완료 후 pay 테이블에 insert하기, orderinfo테이블 업데이트하기
	public int payInput(int order_no, int pay_price);

	//fund table 참여인원 update
	public int memJoinUpdate(int fund_no, int pay_price);

	//memjoin table에 참여내역 insert
	public int memJoinInsert(String mem_id, int fund_no, int pay_price);

	//남은시간 ajax
	public FundDto deadLineAjax(int fund_no);

	//종료된 리스트 총 게시물 수 
	public double finish_totalpage();

	// 종료된 리스트 
	public List<FundDto> finishList(int to, int from);

	//펀드 참여인원 ajax
	public FundDto fundJoinAjax(int fund_no);

	//펀딩 금액 ajax
	public FundDto priceUpdate(int fund_no);

	//펀드 참여자 ajax
	public List<FundDto> joinMemName(int fund_no);
	

	
	


}
