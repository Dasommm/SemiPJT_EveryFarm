package com.everyfarm.farmer.auction.biz;

import java.util.List;

import com.everyfarm.farmer.auction.dao.AuctionDetailDao;
import com.everyfarm.farmer.auction.dao.AuctionDetailDaoImpl;
import com.everyfarm.farmer.auction.dto.ADPagingDto;
import com.everyfarm.farmer.auction.dto.AuctionDetailDto;

public class AuctionDetailBizImpl implements AuctionDetailBiz {

private AuctionDetailDao dao = new AuctionDetailDaoImpl();
@Override
public List<AuctionDetailDto> selectAllstatus(ADPagingDto dto,String mem_id) {
	int currentpage = dto.getCurrentpage();   //초기값 1
	int column = dto.getColumn();   //16
	
	int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
	int endseq = column * currentpage;   //16
	System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
	return dao.selectAllstatus(startseq,endseq,mem_id);
}

@Override
// 페이징 (총 몇페이지인지)
public int totalPage(int column,String mem_id) {
	int totalpage = (int)Math.ceil((double)dao.totalpage(mem_id)/column);   // 6 / 10 > 올림:1
	System.out.println(totalpage+"biz의 totalpage");
	return totalpage;
}

@Override
// 경매 낙찰된 리스트 출력
public List<AuctionDetailDto> selectEndstatus(ADPagingDto dto,String mem_id) {
	int currentpage = dto.getCurrentpage();   //초기값 1
	int column = dto.getColumn();   //10
	
	int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
	int endseq = column * currentpage;   //10
	System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
	return dao.selectEndstatus(startseq,endseq,mem_id);
}

@Override
public int endStatustotalPage(int column,String mem_id) {
	int totalpage = (int)Math.ceil((double)dao.EndStatustotalpage(mem_id)/column);   //21 / 16 = 1
	System.out.println(totalpage+"biz의 totalpage");
	return totalpage;
}

@Override
public int updateStatus(int auc_no) {

	return dao.updateStatus(auc_no);
}

@Override
public List<AuctionDetailDto> selectSendList(ADPagingDto dto, String mem_id) {
	int currentpage = dto.getCurrentpage();   //초기값 1
	int column = dto.getColumn();   //16
	
	int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
	int endseq = column * currentpage;   //16
	System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
	return dao.selectSendList(startseq,endseq,mem_id);
}

@Override
public int sendListtotalPage(int column, String mem_id) {
	int totalpage = (int)Math.ceil((double)dao.sendListtotalPage(mem_id)/column);   //21 / 16 = 1
	System.out.println(totalpage+"biz의 totalpage");
	return totalpage;
}

@Override
public List<AuctionDetailDto> selectNotYetstatus(ADPagingDto dto, String mem_id) {
	int currentpage = dto.getCurrentpage();   //초기값 1
	int column = dto.getColumn();   //16
	
	int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
	int endseq = column * currentpage;   //16
	System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
	return dao.selectNotYetstatus(startseq,endseq,mem_id);
}

@Override
public int notYettotalPage(int column, String mem_id) {
	int totalpage = (int)Math.ceil((double)dao.notYettotalPage(mem_id)/column);   //21 / 16 = 1
	System.out.println(totalpage+"biz의 totalpage");
	return totalpage;
}
	
}
