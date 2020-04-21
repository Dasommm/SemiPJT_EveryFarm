package com.everyfarm.eventboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.eventboard.dto.EventBoardDto;
import com.everyfarm.eventboard.dto.EventPagingDto;

public class EventBoardDaoImpl extends SqlMapConfig implements EventBoardDao{

	private String namespace = "eventboard.";
	
	@Override
	public int totalpage() {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "totalpage");   //17
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public List<EventBoardDto> eventlist(int startseq, int endseq) {
		SqlSession session = null;
		List<EventBoardDto>list = null;
		EventPagingDto dto = new EventPagingDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"eventlist",dto);  //1,16전달
			
			System.out.println(list.size()+"::이벤트리스트의 사이즈*************");
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertboard(EventBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			
		
			res = session.insert(namespace+"insertboard",dto);  //1,16전달
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public EventBoardDto eventdetail(int eve_seq) {
		SqlSession session = null;
		EventBoardDto dto = new EventBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			System.out.println(eve_seq+"::eve_seq찍혀야된다.");
			dto = session.selectOne(namespace+"eventdetail",eve_seq);  //1,16전달
			
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public int updatecount(EventBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"updatecount",dto);
		
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int multidelete(String[] seqs) {
		SqlSession session = null;
		int res = 0;
		Map<String,String[]>map = new HashMap<String, String[]>();
		map.put("seqs", seqs);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"multidelete",map);
			
			if(res == seqs.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;

	}
	
}