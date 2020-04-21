package com.everyfarm.eventboard.biz;

import java.util.List;

import com.everyfarm.eventboard.dto.EventBoardDto;
import com.everyfarm.eventboard.dto.EventPagingDto;

public interface EventBoardBiz {

	
	//이벤트 전체 리스트
	public List<EventBoardDto> eventlist(EventPagingDto dto);
	 //페이징
		public int totalPage(int column);
		
	//게시글 등록
	public int insertboard(EventBoardDto dto);
	
	//이벤트 상세 리스트
	public EventBoardDto eventdetail(int eve_seq);

	//이벤트 조회수 업데이트
	public int updatecount(EventBoardDto dto);
	
	//이벤트 게시글 삭제
	public int multidelete(String[] seqs);
}
