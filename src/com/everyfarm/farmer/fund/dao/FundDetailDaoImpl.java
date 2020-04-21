package com.everyfarm.farmer.fund.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.farmer.fund.dto.FundDetailDto;
import com.everyfarm.farmer.fund.dto.PagingDto;
import com.everyfarm.farmer.fund.dao.SqlMapConfig;

public class FundDetailDaoImpl extends SqlMapConfig implements FundDetailDao {

	private String namespace = "farmerfunddetail.";

	@Override
	public List<FundDetailDto> selectAllstatus(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FundDetailDto> list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+": 시작번호, 끝번호(dao)");
			
			list = session.selectList(namespace+"selectallstatus", hashmap);
			System.out.println(list.size()+":리스트의 사이즈");
		} catch (Exception e) {
			System.out.println("[ERROR]:selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return list;
	}

	@Override
	public int totalPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "totalpage", mem_id);
		} catch (Exception e) {
			System.out.println("[ERROR]:totalpage");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FundDetailDto> selectNotYetStatus(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FundDetailDto> list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"selectNotYetstatus",hashmap);  //1,16전달
			
			System.out.println(list.size()+"::리스트의 사이즈*************");
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int notYetTotalPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "notYettotalPage",mem_id);   //17
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FundDetailDto> selectEndstatus(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FundDetailDto> list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+": 시작번호, 끝번호(dao)");
			list = session.selectList(namespace+"selectEndstatus", hashmap);
			
			System.out.println("리스트 사이즈 : "+list.size());
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int endStatustotalPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"EndStatustotalpage", mem_id);
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FundDetailDto> selectRefund(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FundDetailDto> list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+": 시작번호, 끝번호(dao)");
			list = session.selectList(namespace+"selectRefund", hashmap);
			
			System.out.println("리스트 사이즈 : "+list.size());
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int refundPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"refundPage", mem_id);
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int updateStatus(int fund_no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "updateStatus",fund_no); 
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int acceptrefund(int order_no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "acceptrefund",order_no); 
			
			if(res > 0) {
				session.commit();
				System.out.println("환불수락 업데이트 완료!");
			}
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FundDetailDto> selectRefundComplete(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<FundDetailDto> list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+": 시작번호, 끝번호(dao)");
			list = session.selectList(namespace+"selectRefundComplete", hashmap);
			
			System.out.println("리스트 사이즈 : "+list.size());
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int refundCompletePage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"refundCompletePage", mem_id);
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	

}
