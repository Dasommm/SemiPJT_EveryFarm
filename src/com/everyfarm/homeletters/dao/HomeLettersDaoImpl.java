package com.everyfarm.homeletters.dao;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.letters.dto.LettersDto;

public class HomeLettersDaoImpl extends SqlMapConfig implements HomeLettersDao{

	private String namespace="homeletters.";
	
	@Override
	public int LettersCnt(LettersDto lettersdto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"LettersCnt", lettersdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
