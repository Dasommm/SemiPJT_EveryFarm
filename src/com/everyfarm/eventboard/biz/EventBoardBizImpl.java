package com.everyfarm.eventboard.biz;

import java.util.List;

import com.everyfarm.eventboard.dao.EventBoardDao;
import com.everyfarm.eventboard.dao.EventBoardDaoImpl;
import com.everyfarm.eventboard.dto.EventBoardDto;
import com.everyfarm.eventboard.dto.EventPagingDto;

public class EventBoardBizImpl implements EventBoardBiz{

	private EventBoardDao dao = new EventBoardDaoImpl();
	
	@Override
	public List<EventBoardDto> eventlist(EventPagingDto dto) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.eventlist(startseq,endseq);
	}
	
	@Override
	public int totalPage(int column) {       //16
		int totalpage = (int)Math.ceil((double)dao.totalpage()/column);   //21 / 16 = 1
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}

	@Override
	public int insertboard(EventBoardDto dto) {
		
		return dao.insertboard(dto);
	}

	@Override
	public EventBoardDto eventdetail(int eve_seq) {
		
		return dao.eventdetail(eve_seq);
	}

	@Override
	public int updatecount(EventBoardDto dto) {
	
		return dao.updatecount(dto);
	}

	@Override
	public int multidelete(String[] seqs) {
		
		return dao.multidelete(seqs);
	}

}
