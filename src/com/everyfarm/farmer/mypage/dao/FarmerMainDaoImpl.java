package com.everyfarm.farmer.mypage.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.farmer.mypage.dto.FarmerMainDto;

public class FarmerMainDaoImpl extends SqlMapConfig implements FarmerMainDao {

	private String namespace = "farmermypage.";
	@Override
	public List<FarmerMainDto> applyList(String mem_id) {
		SqlSession session = null;
		List<FarmerMainDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "farmapplylist", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: farmapplylist");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	@Override
	public List<FarmerMainDto> recentOrderList(String mem_id) {
		SqlSession session = null;
		List<FarmerMainDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "recentorder", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: recentorder");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	@Override
	public List<FarmerMainDto> recentRefundList(String mem_id) {
		SqlSession session = null;
		List<FarmerMainDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "recentRefund", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: recentRefund");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	@Override
	public int runningFund(String mem_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "runningfund", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: runningFund");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	@Override
	public int standbyFund(String mem_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"standbyfund", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: standbyfund");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	@Override
	public int runningAuc(String mem_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "runningauc", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: runningauc");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	@Override
	public int standbyAuc(String mem_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"standbyauc", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]: standbyauc");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
