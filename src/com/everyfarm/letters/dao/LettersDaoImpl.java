package com.everyfarm.letters.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.everyfarm.letters.dto.LettersDto;

public class LettersDaoImpl extends SqlMapConfig implements LettersDao{
	private String namespace="letters.";
	
	@Override
	public List<LettersDto> inboxLetters(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		LettersDto dto = new LettersDto();
		List<LettersDto> list = new ArrayList<LettersDto>();
		dto.setStartseq(startseq);
		dto.setEndseq(endseq);
		dto.setMem_id(mem_id);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"inboxLetters", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<LettersDto> sentLetters(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		LettersDto dto = new LettersDto();
		List<LettersDto> list = new ArrayList<LettersDto>();
		dto.setStartseq(startseq);
		dto.setEndseq(endseq);
		dto.setMem_id(mem_id);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"sentLetters", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int sendLetters(LettersDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"sendLetters", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int deleteLetters(String[] letter_id) {
		SqlSession session = null;
		int res = 0;
		Map<String,String[]> map = new HashMap<String, String[]>();
		map.put("letter_ids", letter_id);
		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace+"deleteLetters", map);
			if(res == letter_id.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public LettersDto LettersDetail(int letter_id) {
		SqlSession session = null;
		LettersDto dto = new LettersDto();
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"LettersDetail", letter_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public int updateStatus(int letter_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"updateStatus", letter_id);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int inboxTotalPage(int column, String mem_id) {
		int res = 0;
		SqlSession session = null;
		int totalpage = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "inboxTotalPage",mem_id);   
			totalpage = (int)Math.ceil((double)res/column);   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return totalpage;
	}

	@Override
	public int sentTotalPage(int column, String mem_id) {
		int res = 0;
		SqlSession session = null;
		int totalpage = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "sentTotalPage",mem_id);   
			totalpage = (int)Math.ceil((double)res/column);   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return totalpage;
	}

	
	
}
