package com.everyfarm.farmer.fund.dao;

import java.util.List;

import com.everyfarm.farmer.fund.dto.FundDetailDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public interface FundDetailDao {
	
			// 펀드 진행 리스트
			public List<FundDetailDto> selectAllstatus(int startseq, int endseq, String mem_id);
			
			// 페이징
			public int totalPage(String mem_id);
			
			// 펀드 미등록 리스트 출력
			public List<FundDetailDto> selectNotYetStatus(int startseq, int endseq, String mem_id);
			
			// 페이징
			public int notYetTotalPage(String mem_id);
			
			// 펀드 완료 내역
			public List<FundDetailDto> selectEndstatus(int startseq, int endseq, String mem_id);
			
			// 페이징
			public int endStatustotalPage(String mem_id);
			
			// 배송하기
			public int updateStatus(int fund_no);
			
			// 펀드 환불 요청 리스트
			public List<FundDetailDto> selectRefund(int startseq, int endseq, String mem_id);
			
			// 페이징
			public int refundPage(String mem_id);
			
			//환불요청 수락
			public int acceptrefund(int fund_no);
			
			// 펀드 환불 완료 리스트
			public List<FundDetailDto> selectRefundComplete(int startseq, int endseq, String mem_id);
			
			//페이징
			public int refundCompletePage(String mem_id);
}
