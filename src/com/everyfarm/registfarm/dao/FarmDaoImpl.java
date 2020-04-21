package com.everyfarm.registfarm.dao;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.registfarm.dao.SqlMapConfig;
import com.everyfarm.registfarm.dao.FarmDao;
import com.everyfarm.registfarm.dto.FarmDto;

public class FarmDaoImpl extends SqlMapConfig implements FarmDao {

	private String namespace = "farm.";
	
	@Override
	public int insertFarm(FarmDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"regist",dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public FarmDto selectFarm(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
