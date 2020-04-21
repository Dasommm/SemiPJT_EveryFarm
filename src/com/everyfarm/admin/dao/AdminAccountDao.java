package com.everyfarm.admin.dao;

import static com.everyfarm.admin.dao.SqlMapConfig.getSqlSessionFactory;

import org.apache.ibatis.session.SqlSession;


public class AdminAccountDao {
	
	private String namespace = "admin.";
	
	public int stockKindCount(int kindnumber) {
		int totalstock = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalstock = session.selectOne(namespace+"stockKindCount", kindnumber);
			if(totalstock>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminAccountDao stockKindCount()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalstock; 
	}
	
	public int fundSumCurrentPrice() {
		int totalres = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalres = session.selectOne(namespace+"fundSumCurrentPrice");
			if(totalres>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminAccountDao fundSumCurrentPrice()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalres; 
	}
	
	public int auctionSumCurrentPrice() {
		int totalres = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalres = session.selectOne(namespace+"auctionSumCurrentPrice");
			if(totalres>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminAccountDao auctionSumCurrentPrice()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalres; 
	}
	
	public int fundCurrentMember() {
		int totalres = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalres = session.selectOne(namespace+"fundCurrentMember");
			if(totalres>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminAccountDao fundCurrentMember()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalres; 
	}
	
	public int auctionCurrentMember() {
		int totalres = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalres = session.selectOne(namespace+"auctionCurrentMember");
			if(totalres>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("ERROR : AdminAccountDao auctionCurrentMember()");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalres; 
	}

}
