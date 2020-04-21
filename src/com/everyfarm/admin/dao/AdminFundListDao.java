package com.everyfarm.admin.dao;

import static com.everyfarm.admin.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.AdminFundListDto;
import com.everyfarm.admin.dto.PagingDto;

public class AdminFundListDao {
	
private String namespace = "admin.";
	
	public List<AdminFundListDto> selectList(int from, int to){
		List<AdminFundListDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"adminfundlist",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: AdminFundListDao selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int totalPage(int totalrows) {
		int totalpage = 0;
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalpage_adminfundlist");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminFundListDao totalPage()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res; 
	}
	
	public int adminfundres(int no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"adminfundres",no);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("AdminFundListDao ERROR : adminfundres");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
}
