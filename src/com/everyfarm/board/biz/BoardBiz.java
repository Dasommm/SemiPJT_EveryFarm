package com.everyfarm.board.biz;

import java.util.List;

import com.everyfarm.board.dto.BoardDto;
import com.everyfarm.board.dto.BoardPagingDto;

public interface BoardBiz {

	//모든 글 조회
	public List<BoardDto> boardSelectAll(BoardPagingDto boardPaging);
	
	//총 게시물 갯수 구하기
	public int totalpage(int totalrows);
	
	//공지사항 조회
	public List<BoardDto> boardNoticeAll(BoardPagingDto boardPaging);
	
	//공지사항 총 게시물 갯수 구하기
	public int cate1_totalpage(int totalrows);

	//자유게시판 조회
	public List<BoardDto> freeBoardAll(BoardPagingDto boardPaging);
	
	//자유게시판 총 게시물 갯수 구하기
	public int cate2_totalpage(int totalrows);	
	
	//글 작성
	public int boardInsert(BoardDto boardDto);

	//디테일 조회
	public BoardDto boardDetail(int board_id);
	
	//글 수정
	public int boardUpdate(BoardDto boardDto);
	
	//글 삭제
	public int boardDelete(int board_id);

	//공지사항 고정
	public List<BoardDto> bestNotice();

	//댓글 등록
	public int boardReplyInsert(BoardDto board_reply);

	//댓글 리스트 
	public List<BoardDto> boardReplyAll(int board_id);

	//댓글 삭제
	public int boardReplyDelete(int reply_board_id, int reply_comment_no);

	//댓글 수정
	public int boardReplyUpdate(int comment_no, String comment_content_update);

	//조회수 조회
	public int replyCnt(int board_id);

	// 다중 삭제
	public int multiDelete(String[] board_id);

////////////////////////////////////Q&A board///////////////////////////////
	
	//모든 글 조회
	public List<BoardDto> qaSelectAll(BoardPagingDto boardPaging);
	
	//총 게시물 갯수 구하기
	public int qaTotalpage(int totalrows);
	
	//회원 문의 게시글 갯수 구하기
	public int cate3_totalpage(int totalrows);

	//회원 문의 게시글 뽑기
	public List<BoardDto> userQa(BoardPagingDto boardPaging);

	//농부 문의 게시글 뽑기
	public int cate4_totalpage(int totalrows);

	//농부 문의 게시글 뽑기
	public List<BoardDto> farmerQa(BoardPagingDto boardPaging);



	
	
}
