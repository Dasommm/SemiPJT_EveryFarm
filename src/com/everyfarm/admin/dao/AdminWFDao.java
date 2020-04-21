package com.everyfarm.admin.dao;

import static com.everyfarm.admin.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.AdminWFDto;
import com.everyfarm.admin.dto.PagingDto;

public class AdminWFDao {
	
	private String namespace = "admin.";
	
	public List<AdminWFDto> selectList(int from, int to){
		List<AdminWFDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"adminwf",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: AdminWFDao selectList");
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
			totalpage = session.selectOne(namespace+"totalpage_adminwf");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminWFDao totalPage()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res; 
	}
	
	public int adminwfres(int no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"adminwfres",no);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("AdminWFDao ERROR : adminwfres");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
