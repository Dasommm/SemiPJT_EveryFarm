package com.everyfarm.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.everyfarm.admin.dto.AuctionApprovalDto;
import com.everyfarm.admin.dto.PagingDto;

import static com.everyfarm.admin.dao.SqlMapConfig.*;

public class AuctionApprovalDao {
	
	private String namespace = "admin.";
	
	public List<AuctionApprovalDto> selectList(){
		List<AuctionApprovalDto> list = null;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"realtime_approvallist");
		} catch (Exception e) {
			System.out.println("ERROR: AuctionApprovalDao selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List<AuctionApprovalDto> selectList(int from, int to){
		List<AuctionApprovalDto> list = null;
		SqlSession session = null;
		PagingDto pagingdto = new PagingDto();
		pagingdto.setFrom(from);
		pagingdto.setTo(to);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"approvallist",pagingdto);
		} catch (Exception e) {
			System.out.println("ERROR: AuctionApprovalDao selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int approvalRes(int no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"auctionapproval",no);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("AuctionApprovalDao ERROR : upgradeRes");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int totalPage(int totalrows) {
		int totalpage = 0;
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalpage_auctionaprroval");
			res = (int)Math.ceil((double)totalpage/totalrows);
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AuctionApproval totalPage()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res; 
	}
	
}
