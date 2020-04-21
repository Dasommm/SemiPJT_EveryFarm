package com.everyfarm.registauction.dao;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.registauction.dto.AuctionDto;

public class AuctionDaoImpl extends SqlMapConfig implements AuctionDao {

	private String namespace = "insertauction.";
	
	
	@Override
	public int registStock(AuctionDto dto) {
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
	public int registAuction(AuctionDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"registauction", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[ERROR]:2");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
