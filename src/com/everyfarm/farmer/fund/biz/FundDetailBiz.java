package com.everyfarm.farmer.fund.biz;

import java.util.List;

import com.everyfarm.farmer.fund.dto.FundDetailDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public interface FundDetailBiz {
	
		// 펀드 진행 리스트
		public List<FundDetailDto> selectAllstatus(PagingDto dto, String mem_id);
		
		// 페이징
		public int totalPage(int column, String mem_id);
		
		// 펀드 미등록 리스트 출력
		public List<FundDetailDto> selectNotYetStatus(PagingDto dto, String mem_id);
		
		// 페이징
		public int notYetTotalPage(int column, String mem_id);
		
		// 펀드 완료 내역
		public List<FundDetailDto> selectEndstatus(PagingDto dto, String mem_id);
		
		// 페이징
		public int endStatustotalPage(int column, String mem_id);
		
		// 배송하기
		public int updateStatus(int fund_no);
		
		// 펀드 환불 요청 리스트
		public List<FundDetailDto> selectRefund(PagingDto dto, String mem_id);
		
		// 페이징
		public int refundPage(int column, String mem_id);
		
		//환불요청 수락
		public int acceptrefund(int fund_no);
		
		// 펀드 환불 완료 리스트
		public List<FundDetailDto> selectRefundComplete(PagingDto dto, String mem_id);
		
		//페이징
		public int refundCompletePage(int column, String mem_id);
		
		
}
