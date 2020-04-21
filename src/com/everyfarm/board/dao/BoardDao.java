package com.everyfarm.board.dao;

import java.util.List;

import com.everyfarm.board.dto.BoardDto;

public interface BoardDao {
	
	//댓글 리스트
	public List<BoardDto> boardReplyAll(int board_id);

	//공지사항 고정
	public List<BoardDto> bestNotice();

	//모든 글 조회
	public List<BoardDto> boardSelectAll(int to, int from);
	
	//총 게시물 갯수 구하기
	public int totalpage();
	
	//공지사항 조회
	public List<BoardDto> boardNoticeAll(int to, int from);
	
	//공지사항 총 게시물 갯수 구하기
	public int cate1_totalpage();

	//자유게시판 조회
	public List<BoardDto> freeBoardAll(int to, int from);
	
	//자유게시판 총 게시물 갯수 구하기
	public int cate2_totalpage();

	//글 작성
	public int boardInsert(BoardDto boardDto);

	//디테일 조회
	public BoardDto boardDetail(int board_id);
	
	//글 수정
	public int boardUpdate(BoardDto boardDto);
	
	//글 삭제
	public int boardDelete(int board_id);

	//댓글 등록
	public int boardReplyInsert(BoardDto board_reply);

	//댓글 삭제
	public int boardReplyDelete(int reply_board_id, int reply_comment_no);

	//글 삭제시 댓글도 모두 삭제
	public int deleteReplyAll(int board_id);

	//댓글 수정
	public int boardReplyUpdate(int comment_no, String comment_content_update);

	//조회수 추가
	public int boardViewPlus(int board_id);

	//조회수 조회
	public int replyCnt(int board_id);

///////////////////////////////////Q&A board//////////////////////////	
	
	//모든 글 조회
	public List<BoardDto> qaSelectAll(int to, int from);

	//모든 게시글 수 조회
	public double qaTotalpage();

	//여러글 삭제
	public int multiDelete(String[] board_id);

	//회원문의 총 게시글 수 조회
	public double cate3_totalpage();

	//회원 문의 게시글
	public List<BoardDto> userQa(int to, int from);

	//농부 문의 총 게시글 수 조회
	public double cate4_totalpage();

	//농부 문의글 뽑기
	public List<BoardDto> farmerQa(int to, int from);

	//다중 글 삭제시 댓글 삭제
	public int multiDeleteReply(String[] board_id);
	
	
	

	
}
