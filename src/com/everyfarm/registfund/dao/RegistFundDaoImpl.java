package com.everyfarm.registfund.dao;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.registfund.dao.SqlMapConfig;
import com.everyfarm.registfund.dto.RegistFundDto;

public class RegistFundDaoImpl extends SqlMapConfig implements RegistFundDao {

	private String namespace = "insertfund.";
	
	@Override
	public int registStock(RegistFundDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"registstock", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[ERROR]:1");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	@Override
	public int registFund(RegistFundDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"registfund", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[ERROR]:2");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}


}
