package com.everyfarm.board.biz;

import java.util.List;

import com.everyfarm.board.dao.BoardDao;
import com.everyfarm.board.dao.BoardDaoImpl;
import com.everyfarm.board.dto.BoardDto;
import com.everyfarm.board.dto.BoardPagingDto;

public class BoardBizImpl implements BoardBiz {

	BoardDao dao = new BoardDaoImpl();
	
	@Override
	public List<BoardDto> boardSelectAll(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.boardSelectAll(to,from);
	}

	@Override
	public int totalpage(int totalrows) {	
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.totalpage()/totalrows);
		
		return totalpage;
	}
	
	@Override
	public int boardInsert(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return dao.boardInsert(boardDto);
	}
	
	@Override
	public BoardDto boardDetail(int board_id) {
		int viewPlus = dao.boardViewPlus(board_id);
		return dao.boardDetail(board_id);
	}

	@Override
	public int boardUpdate(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(boardDto);
	}

	@Override
	public int boardDelete(int board_id) {
		int deleteReplyAll = dao.deleteReplyAll(board_id);			
		int boardDelete = dao.boardDelete(board_id);
		
		return boardDelete + deleteReplyAll;
	}


	@Override
	public List<BoardDto> boardNoticeAll(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.boardNoticeAll(to, from);
	}

	@Override
	public int cate1_totalpage(int totalrows) {
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.cate1_totalpage()/totalrows);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> freeBoardAll(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.freeBoardAll(to, from);
	}

	@Override
	public int cate2_totalpage(int totalrows) {
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.cate2_totalpage()/totalrows);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> bestNotice() {
		// TODO Auto-generated method stub
		return dao.bestNotice();
	}

	@Override
	public int boardReplyInsert(BoardDto board_reply) {
		// TODO Auto-generated method stub
		return dao.boardReplyInsert(board_reply);
	}

	@Override
	public List<BoardDto> boardReplyAll(int board_id) {
		// TODO Auto-generated method stub
		return dao.boardReplyAll(board_id);
	}

	@Override
	public int boardReplyDelete(int reply_board_id, int reply_comment_no) {
		return dao.boardReplyDelete(reply_board_id,reply_comment_no);
	}

	@Override
	public int boardReplyUpdate(int comment_no, String comment_content_update) {
		// TODO Auto-generated method stub
		return dao.boardReplyUpdate(comment_no, comment_content_update);
	}

	@Override
	public int replyCnt(int board_id) {

		return dao.replyCnt(board_id);
	}
	
////////////////////////////////Q&A board////////////////////////////////

	@Override
	public List<BoardDto> qaSelectAll(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.qaSelectAll(to,from);
	}

	@Override
	public int qaTotalpage(int totalrows) {
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.qaTotalpage()/totalrows);
		
		return totalpage;
	}

	@Override
	public int multiDelete(String[] board_id) {
		int multiDelReply =0;
		do {
			multiDelReply = dao.multiDeleteReply(board_id);			
		}while(multiDelReply != 0);	//삭제할 댓글이 없으면 계속 반복
		
		int multiDelete = dao.multiDelete(board_id);			
		
		// TODO Auto-generated method stub
		return  multiDelete + multiDelReply;
	}
	

	@Override
	public int cate3_totalpage(int totalrows) {
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.cate3_totalpage()/totalrows);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> userQa(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.userQa(to, from);
	}

	@Override
	public int cate4_totalpage(int totalrows) {
		//servlet에서 한페이지당 10개씩 출력하기로 했기 때문에 그 출력양에 맞는 총페이지 구해서 전달하기
		int totalpage = (int) Math.ceil((double)dao.cate4_totalpage()/totalrows);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> farmerQa(BoardPagingDto boardPaging) {
		int currentpage = boardPaging.getCurrentpage();
		int totalrows = boardPaging.getTotalrows();
		
		int from = totalrows *(currentpage -1)+1;
		int to = totalrows * currentpage;		
		
		System.out.println("biz통과");
		return dao.farmerQa(to, from);
	}



	
	
}
