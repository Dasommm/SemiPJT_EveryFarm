package com.everyfarm.farmer.mypage.biz;

import java.util.List;

import com.everyfarm.farmer.mypage.dto.FarmerMainDto;

public interface FarmerMainBiz {
	// 농장 신청 내역
	public List<FarmerMainDto> applyList(String mem_id);
	
	// 펀드 경매 내역
	public List<FarmerMainDto> recentOrderList(String mem_id);
			
	// 환불 요청 내역
	public List<FarmerMainDto> recentRefundList(String mem_id);
	
	// 진행중 펀드
	public int runningFund(String mem_id);
	// 승인대기 펀드
	public int standbyFund(String mem_id);
	// 진행중 경매
	public int runningAuc(String mem_id);
	// 승인대기 경매
	public int standbyAuc(String mem_id);
}
