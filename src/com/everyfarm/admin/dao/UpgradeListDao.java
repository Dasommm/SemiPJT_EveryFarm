package com.everyfarm.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.PagingDto;
import com.everyfarm.admin.dto.UpgradeListDto;
import static com.everyfarm.admin.dao.SqlMapConfig.*;

public class UpgradeListDao {
	
	private String namespace = "admin.";
	
	public List<UpgradeListDto> selectList(int from, int to){
		List<UpgradeListDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"upgradelist",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: UpgradeListDao selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public UpgradeListDto selectOne(String id) {
		UpgradeListDto dto = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne", id);
		} catch (Exception e) {
			System.out.println("ERROR : selectOne");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	public int upgradeRes(String id) {
		int res_mem = 0;
		int res_far = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res_mem = session.update(namespace+"upgraderank_mem",id);
			res_far = session.update(namespace+"upgraderank_far",id);
			if(res_mem>0 && res_far>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("UpgradListDao ERROR : upgradeRes");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res_far;
	}
	
	public int totalPage(int totalrows) {
		int totalpage = 0;
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalpage_upgradelist");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : upgradelist totalPage()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res; 
	}
	
}
