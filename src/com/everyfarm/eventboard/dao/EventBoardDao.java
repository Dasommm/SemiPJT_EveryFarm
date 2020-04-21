package com.everyfarm.eventboard.dao;

import java.util.List;

import com.everyfarm.eventboard.dto.EventBoardDto;
import com.everyfarm.eventboard.dto.EventPagingDto;

public interface EventBoardDao {

	//주말농장 전체 리스트
		public List<EventBoardDto>eventlist(int startseq, int endseq);
	//페이징
		public int totalpage();	
		
	//게시글 등록
		public int insertboard(EventBoardDto dto);	
		
		//이벤트 상세 리스트
		public EventBoardDto eventdetail(int eve_seq);	

		//이벤트 조회수 업데이트
		public int updatecount(EventBoardDto dto);
		
		//이벤트 게시글 삭제
		public int multidelete(String[] seqs);
}
