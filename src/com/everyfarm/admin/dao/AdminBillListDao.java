package com.everyfarm.admin.dao;

import static com.everyfarm.admin.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.AdminBillListDto;
import com.everyfarm.admin.dto.PagingDto;
import com.everyfarm.admin.dto.UserListDto;

public class AdminBillListDao {
	
	private String namespace = "admin.";
	
	public List<AdminBillListDto> selectList(int from, int to){
		List<AdminBillListDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"adminbilllist",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: AdminBillListDao selectList");
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
			totalpage = session.selectOne(namespace+"totalpage_adminbilllist");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminBillListDao totalPage()");
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
			list = session.selectList(namespace+"adminbilllist_main");
		} catch (Exception e) {
			System.out.println("ERROR: AdminBillListDao mainList()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public int adminbillres(int no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"adminbillres",no);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("AdminBillListDao ERROR : adminbillres");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
