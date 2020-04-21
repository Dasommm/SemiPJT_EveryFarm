package com.everyfarm.fundproduct.biz;

import java.util.List;

import com.everyfarm.fundproduct.dao.FundDao;
import com.everyfarm.fundproduct.dao.FundDaoImpl;
import com.everyfarm.fundproduct.dto.FundDto;
import com.everyfarm.fundproduct.dto.FundPagingDto;
import com.everyfarm.fundproduct.dto.FundPayDto;

public class FundBizImpl implements FundBiz {

	FundDao dao = new FundDaoImpl();
	
	@Override
	public List<FundDto> fundBestList() {
		// TODO Auto-generated method stub
		return dao.fundBestList();
	}

	@Override
	public FundDto fundDetail(int stock_no) {
		// TODO Auto-generated method stub
		return dao.fundDetail(stock_no);
	}

	@Override
	public List<FundDto> fundAllList(FundPagingDto dto) {
		int currentpage = dto.getCurrentpage();	//현재페이지
		int totalrows = dto.getTotalrows();		//한페이지에 표현할 게시글 수 16
		
		int from = totalrows * (currentpage -1) +1;	// 한페이지에 출력할 갯수가 되지 않더라도 한페이지 모두 출력해야하기 때문에 마지막에 +1을 해준다
													// ex) 한 페이지에 출력할 게시글이 10이라고 가정한다면 출력될 총 게시글이 6개이더라도 한 페이지를 출력해야한다.
													// 16 *(1-1)+1 => 1번부터
		int to = totalrows * currentpage;			// 16*1 => 16번까지
		
		return dao.fundAllList(to, from);
	}

	@Override
	public int totalpage(int totalrows) {		//servlet에서 받아온 totalrows =16
		int totalpage = (int)Math.ceil((double)dao.totalpage()/totalrows);
										// dao에서 받아온 값=44개 
										// 총 게시물 / 한페이지에 표현할 게시물의 수 = 무조건 올림으로 값 지정

		return totalpage;		// 3이 return됨
	}

	@Override
	public FundPayDto orderInput(int stock_no, String mem_id, int orderinfo_kg, int fund_no) {
		// TODO Auto-generated method stub
		return dao.orderInput(stock_no, mem_id, orderinfo_kg, fund_no);
	}

	@Override
	public int payInput(int order_no, int pay_price, int fund_no, String mem_id) {
		int payInfoInsert = dao.payInput(order_no, pay_price);	//결재완료 후 pay table에 데이터 input, orderinfo table 구매완료로 업데이트
		int memJoinUpdate = dao.memJoinUpdate(fund_no, pay_price);	//fund table 참여인원 update
		int memJoinInsert = dao.memJoinInsert(mem_id, fund_no, pay_price);	//memjoin table 참여내역 insert
		return payInfoInsert +memJoinUpdate + memJoinInsert;
	}

	@Override
	public FundDto deadLineAjax(int fund_no) {
		// TODO Auto-generated method stub
		return dao.deadLineAjax(fund_no);
	}

	@Override
	public int finish_totalpage(int totalrows) {
		int totalpage = (int)Math.ceil((double)dao.finish_totalpage()/totalrows);
		System.out.println("biz 통과");
		return totalpage;
	}

	@Override
	public List<FundDto> finishList(FundPagingDto finishPaging) {
		int currentpage = finishPaging.getCurrentpage();	//현재페이지
		int totalrows = finishPaging.getTotalrows();		//한페이지에 표현할 게시글 수 16
		
		int from = totalrows * (currentpage -1) +1;	// 한페이지에 출력할 갯수가 되지 않더라도 한페이지 모두 출력해야하기 때문에 마지막에 +1을 해준다
													// ex) 한 페이지에 출력할 게시글이 10이라고 가정한다면 출력될 총 게시글이 6개이더라도 한 페이지를 출력해야한다.
													// 16 *(1-1)+1 => 1번부터
		int to = totalrows * currentpage;			// 16*1 => 16번까지
		System.out.println("biz 통과 ");
		return dao.finishList(to, from);
	}

	@Override
	public FundDto fundJoinAjax(int fund_no) {
		// TODO Auto-generated method stub
		return dao.fundJoinAjax(fund_no);
	}

	@Override
	public FundDto priceUpdate(int fund_no) {
		// TODO Auto-generated method stub
		return dao.priceUpdate(fund_no);
	}

	@Override
	public List<FundDto> joinMemName(int fund_no) {
		// TODO Auto-generated method stub
		return dao.joinMemName(fund_no);
	}


}
