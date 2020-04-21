package com.everyfarm.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.everyfarm.board.dto.BoardDto;
import com.everyfarm.board.dto.BoardPagingDto;
import com.sun.javafx.collections.MappingChange.Map;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {

	String namespace = "board.";
	
	@Override
	public List<BoardDto> boardSelectAll(int to, int from) {
		
		List<BoardDto> boardAllList = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			boardAllList = session.selectList(namespace+"boardList", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(boardAllList.size());
		
		return boardAllList;
	}

	@Override
	public int boardInsert(BoardDto boardDto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"boardInsert",boardDto);

			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public BoardDto boardDetail(int board_id) {

		BoardDto boardDetail = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			boardDetail = session.selectOne(namespace+"boardDetail",board_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return boardDetail;
	}

	@Override
	public int boardUpdate(BoardDto boardDto) {
		int updateRes = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			updateRes = session.update(namespace+"boardUpdate",boardDto);
			
			if(updateRes>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return updateRes;
	}

	@Override
	public int boardDelete(int board_id) {

		int deleteRes = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			deleteRes = session.delete(namespace+"boardDelete",board_id);
			
			if(deleteRes >0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return deleteRes;
	}

	@Override
	public int totalpage() {
		
		int totalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println(totalpage);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> boardNoticeAll(int to, int from) {
		List<BoardDto> boardNoticeAll = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			boardNoticeAll = session.selectList(namespace+"boardNotice", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(boardNoticeAll.size());
		
		return boardNoticeAll;
	}
	
	@Override
	public int cate1_totalpage() {
		int totalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"cate1_totalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println(totalpage);
		
		return totalpage;
	}


	@Override
	public List<BoardDto> freeBoardAll(int to, int from) {
		List<BoardDto> freeBoardAll = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			freeBoardAll = session.selectList(namespace+"freeBoard", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(freeBoardAll.size());
		
		return freeBoardAll;
	}

	@Override
	public int cate2_totalpage() {
		int totalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"cate2_totalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println(totalpage);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> bestNotice() {
		List<BoardDto> bestNotice = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			bestNotice = session.selectList(namespace+"bestNotice");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return bestNotice;
	}

	@Override
	public int boardReplyInsert(BoardDto board_reply) {
		int replyInsertRes = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			replyInsertRes = session.insert(namespace+"replyInsert",board_reply);
			
			if(replyInsertRes>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return replyInsertRes;
	}

	@Override
	public List<BoardDto> boardReplyAll(int board_id) {
		List<BoardDto> boardReplyAll = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			boardReplyAll = session.selectList(namespace+"replyAll",board_id);
		} catch (Exception e) {
			System.out.println("session오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return boardReplyAll;
	}

	@Override
	public int boardReplyDelete(int reply_board_id, int reply_comment_no) {
		int replyDeleteRes = 0;
		SqlSession session = null;
		
		BoardDto replyDeleteDto = new BoardDto();
		replyDeleteDto.setBoard_id(reply_board_id);
		replyDeleteDto.setComment_no(reply_comment_no);
		System.out.println("게시물 번호 : "+reply_board_id+"댓글 번호:"+reply_comment_no);
		
		try {
			session = getSqlSessionFactory().openSession();
			replyDeleteRes = session.delete(namespace+"replyDelete",replyDeleteDto);
			
			if(replyDeleteRes>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return replyDeleteRes;
	}

	@Override
	public int deleteReplyAll(int board_id) {
		int deleteReplyAll = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			deleteReplyAll = session.delete(namespace+"deleteReplyAll",board_id);
			
			if(deleteReplyAll>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return deleteReplyAll;
	}

	@Override
	public int boardReplyUpdate(int comment_no, String comment_content_update) {
		int boardReplyUpdate = 0;
		SqlSession session = null;
		
		BoardDto replyUpdate = new BoardDto();
		replyUpdate.setComment_no(comment_no);
		replyUpdate.setComment_content(comment_content_update);
		
		try {
			session = getSqlSessionFactory().openSession();
			boardReplyUpdate = session.update(namespace+"replyUpdate", replyUpdate);
			
			if(boardReplyUpdate>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return boardReplyUpdate;
	}

	@Override
	public int boardViewPlus(int board_id) {
		int boardViewPlus = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			boardViewPlus = session.update(namespace+"boardViewPlus",board_id);
			
			if(boardViewPlus>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
				
		return boardViewPlus;
	}

	@Override
	public int replyCnt(int board_id) {
		int replyCnt = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			replyCnt = session.selectOne(namespace+"replyCnt",board_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return replyCnt;
	}

	@Override
	public List<BoardDto> qaSelectAll(int to, int from) {
		List<BoardDto> qaAllList = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			qaAllList = session.selectList(namespace+"qaList", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println("daoImpl qa리스트 사이즈 : "+qaAllList.size());
		
		return qaAllList;
	}

	@Override
	public double qaTotalpage() {
		int qaTotalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			qaTotalpage = session.selectOne(namespace+"qaTotalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println("daoImple qa게시글 수 :"+qaTotalpage);
		
		return qaTotalpage;
	
	}


	@Override
	public double cate3_totalpage() {
		int totalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"cate3_totalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println(totalpage);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> userQa(int to, int from) {
		
		List<BoardDto> userQa = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			userQa = session.selectList(namespace+"userQa", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(userQa.size());
		
		return userQa;
	}

	@Override
	public double cate4_totalpage() {
		int totalpage = 0;
		SqlSession session =null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"cate4_totalpage");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println(totalpage);
		
		return totalpage;
	}

	@Override
	public List<BoardDto> farmerQa(int to, int from) {

		List<BoardDto> farmerQa = null;
		SqlSession session = null;
		BoardPagingDto boardPagingDto = new BoardPagingDto();
		boardPagingDto.setTo(to);
		boardPagingDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			farmerQa = session.selectList(namespace+"farmerQa", boardPagingDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("session에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(farmerQa.size());
		
		return farmerQa;
	}

	@Override
	public int multiDelete(String[] board_id) {
		
		int multiDelRes = 0;
		SqlSession session = null;
		HashMap<String, String[]> map = new HashMap<String, String[]>();
		map.put("board_ids", board_id);
		
		
		try {
			session = getSqlSessionFactory().openSession();
			multiDelRes = session.delete(namespace+"multiDelete",map);
			
			if(multiDelRes == board_id.length) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return multiDelRes;
	}
	
	
	@Override
	public int multiDeleteReply(String[] board_id) {
		System.out.println("리플 삭제 daoimpl 들어옴");
		int multiDelReply = 0;
		SqlSession session = null;
		HashMap<String, String[]> map = new HashMap<String, String[]>();
		map.put("board_ids", board_id);
		
		try {
			session = getSqlSessionFactory().openSession();
			multiDelReply = session.delete(namespace+"multiDeleteReply",map);
			
			System.out.println("리플 모두 삭제 dao:"+multiDelReply);

			session.commit();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return multiDelReply;
	}

	

}
