package com.everyfarm.farmer.farm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.farmer.farm.dto.FarmDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public class FarmDaoImpl extends SqlMapConfig implements FarmDao {

	String namespace = "supervisefarm.";

	@Override
	public List<FarmDto> myFarmList(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FarmDto> list = new ArrayList<FarmDto>();
		PagingDto dto = new PagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"myfarmlist",hashmap);  //1,16전달
			
			System.out.println(list.size()+"::리스트의 사이즈*************");
		} catch (Exception e) {
			System.out.println("[ERROR]: myFarmList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int myFarmListPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "myfarmlistpage",mem_id);   //6
		} catch (Exception e) {
			System.out.println("[error]:myfarmlistpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FarmDto> sendFarmDetail(int wfarm_key) {
		SqlSession session = null;
		List<FarmDto> list = new ArrayList<FarmDto>();
		
		
		try {
			session = getSqlSessionFactory().openSession();
			
			list = session.selectList(namespace+"sendfarmlist",wfarm_key);  //1,16전달
			
			System.out.println(list.size()+"::리스트의 사이즈*************");
		} catch (Exception e) {
			System.out.println("[ERROR]: sendfarmlist");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	

	


}
