package com.everyfarm.memberMyPage.biz;

import java.util.List;

import com.everyfarm.memberMyPage.dto.MyPaymentDto;
import com.everyfarm.memberMyPage.dto.MyPurchaseListDto;
import com.everyfarm.memberMyPage.dto.PagingDto;

public interface MemberMyPageBiz {
	//내 펀드내역 페이징 적용해서 가져오기
	public List<MyPurchaseListDto> pagingMyFundList(PagingDto dto, String mem_id);
	//내 경매내역 페이징 적용해서 가져오기
	public List<MyPurchaseListDto> pagingMyAuctionList(PagingDto dto, String mem_id);
	//내 결제/배송내역 페이징 적용해서 가져오기
	public List<MyPaymentDto> pagingMyPaymentList(PagingDto dto, String mem_id);
}
