package com.everyfarm.memberMyPage.biz;

import java.util.List;

import com.everyfarm.memberMyPage.dao.MemberMyPageDao;
import com.everyfarm.memberMyPage.dao.MemberMyPageDaoImpl;
import com.everyfarm.memberMyPage.dto.MyPaymentDto;
import com.everyfarm.memberMyPage.dto.MyPurchaseListDto;
import com.everyfarm.memberMyPage.dto.PagingDto;

public class MemberMyPageBizImpl implements MemberMyPageBiz{
	
	private MemberMyPageDao dao = new MemberMyPageDaoImpl();

	@Override
	public List<MyPurchaseListDto> pagingMyFundList(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		
		return dao.pagingMyFundList(startseq, endseq, mem_id);
	}

	@Override
	public List<MyPurchaseListDto> pagingMyAuctionList(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   
		int column = dto.getColumn();   
		
		int startseq = column * (currentpage - 1) + 1;  
		int endseq = column * currentpage;   
		
		return dao.pagingMyAuctionList(startseq, endseq, mem_id);
	}

	@Override
	public List<MyPaymentDto> pagingMyPaymentList(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   
		int column = dto.getColumn();   
		
		int startseq = column * (currentpage - 1) + 1;  
		int endseq = column * currentpage;   
		
		return dao.pagingMyPaymentList(startseq, endseq, mem_id);
	}

}
