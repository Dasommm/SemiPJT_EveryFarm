package com.everyfarm.admin.dao;

import static com.everyfarm.admin.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.PagingDto;
import com.everyfarm.admin.dto.UserListDto;

public class UserListDao {
	
private String namespace = "admin.";
	
	public List<UserListDto> selectList(int from, int to){
		List<UserListDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"userlist",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: UserListDao selectList");
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
			totalpage = session.selectOne(namespace+"totalpage_userlist");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : UserListDao totalPage()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res; 
	}
	
	public List<UserListDto> mainList(){
		List<UserListDto> list = null;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"userlist_main");
		} catch (Exception e) {
			System.out.println("ERROR: UserListDao mainList()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
}
