package com.everyfarm.farmer.fund.biz;

import java.util.List;

import com.everyfarm.farmer.fund.dao.FundDetailDao;
import com.everyfarm.farmer.fund.dao.FundDetailDaoImpl;
import com.everyfarm.farmer.fund.dto.FundDetailDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public class FundDetailBizImpl implements FundDetailBiz {

	private FundDetailDao dao = new FundDetailDaoImpl();

	@Override
	public List<FundDetailDto> selectAllstatus(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.selectAllstatus(startseq,endseq,mem_id);
		
	}

	@Override
	public int totalPage(int column, String mem_id) {
		int totalpage = (int)Math.ceil((double)dao.totalPage(mem_id)/column);
		System.out.println("biz의 totalpage : "+totalpage);
		return totalpage;
	}

	@Override
	public List<FundDetailDto> selectNotYetStatus(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.selectNotYetStatus(startseq,endseq,mem_id);
	}

	@Override
	public int notYetTotalPage(int column, String mem_id) {
		int totalpage = (int)Math.ceil((double)dao.notYetTotalPage(mem_id)/column);   //21 / 16 = 1
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}

	@Override
	public List<FundDetailDto> selectEndstatus(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage-1)+1;
		int endseq = column * currentpage;
		System.out.println(startseq + "," + endseq + ":시작번호, 끝번호 (biz)");
		
		return dao.selectEndstatus(startseq, endseq, mem_id);
	}

	@Override
	public int endStatustotalPage(int column, String mem_id) {
		int totalpage = (int)Math.ceil((double)dao.endStatustotalPage(mem_id)/column);
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}

	@Override
	public int updateStatus(int fund_no) {
		
		return dao.updateStatus(fund_no);
	}
	
	@Override
	public List<FundDetailDto> selectRefund(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.selectRefund(startseq, endseq, mem_id);
	}

	@Override
	public int refundPage(int column, String mem_id) {
		int totalpage = (int)Math.ceil((double)dao.refundPage(mem_id)/column);
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}


	@Override
	public List<FundDetailDto> selectRefundComplete(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.selectRefundComplete(startseq, endseq, mem_id);
	}

	@Override
	public int refundCompletePage(int column, String mem_id) {
		int totalpage = (int)Math.ceil((double)dao.refundCompletePage(mem_id)/column);
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}

	@Override
	public int acceptrefund(int fund_no) {
		
		return dao.acceptrefund(fund_no);
	}
	
}
