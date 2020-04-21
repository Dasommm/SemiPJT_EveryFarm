package com.everyfarm.memberMyPage.dao;

import java.util.List;

import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.memberMyPage.dto.MyFarmListDto;
import com.everyfarm.memberMyPage.dto.MyPaymentDto;
import com.everyfarm.memberMyPage.dto.MyPurchaseListDto;

public interface MemberMyPageDao {
	//1.내 정보 조회
	public MemberDto selectMyInfo(String mem_id);
	//2.내 정보 수정
	public int updateMyInfo(MemberDto dto);
	//3.회원 탈퇴
	public int memberDelete(String mem_id);
	//4.등급 조회
	public MemberDto selectGrade(String mem_id);
	//5.등업 신청
	public int applyGradeUp(String mem_id);
	//펀드 투자 내역
	public List<MyPurchaseListDto> selectMyFundList(String mem_id);
	//경매 참가 내역
	public List<MyPurchaseListDto> selectMyAuctionList(String mem_id);
	//농장 신청 내역
	public List<MyFarmListDto> selectMyFarmList(String mem_id);
	//결제/배송내역
	public List<MyPaymentDto> selectMyPaymentList(String mem_id);
	//펀드 취소
	public int refund(int order_no);
	//경매 주문페이지 상세 내역 조회
	public MyPaymentDto orderAuction(int stock_no);
	//주문, 주문상세 내역 생성
	public MyPaymentDto orderInput(int stock_no, String mem_id, int stock_kg);
	//결제
	public int payInput(int order_no, int pay_price, int stock_kg);
	//펀드내역 총 페이지
	public int fundTotalPage(int column, String mem_id);
	//펀드내역 페이징
	public List<MyPurchaseListDto> pagingMyFundList(int startseq, int endseq, String mem_id);
	//경매내역 총 페이지
	public int auctionTotalPage(int column, String mem_id);
	//경매내역 페이징
	public List<MyPurchaseListDto> pagingMyAuctionList(int startseq, int endseq, String mem_id);
	//결제/배송내역 총 페이지
	public int paymentTotalPage(int column, String mem_id);
	//결제/배송내역 페이징
	public List<MyPaymentDto> pagingMyPaymentList(int startseq, int endseq, String mem_id);
	
}
