package com.everyfarm.farmer.auction.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.farm.dto.FarmPagingDto;
import com.everyfarm.farmer.auction.dto.AuctionDetailDto;

public class AuctionDetailDaoImpl extends SqlMapConfig implements AuctionDetailDao {

	private String namespace = "farmerauctiondetail.";
	
	@Override
	public List<AuctionDetailDto> selectAllstatus(int startseq, int endseq,String mem_id) {
		SqlSession session = null;
		List<AuctionDetailDto>list = null;
		FarmPagingDto dto = new FarmPagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"selectallstatus",hashmap);  //1,16전달
			
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
	public int totalpage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "totalpage",mem_id);   //6
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}


	@Override
	public List<AuctionDetailDto> selectEndstatus(int startseq, int endseq,String mem_id) {
		SqlSession session = null;
		List<AuctionDetailDto>list = null;
		FarmPagingDto dto = new FarmPagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"selectEndstatus",hashmap);  //1,16전달
			
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
	public int EndStatustotalpage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "EndStatustotalpage",mem_id);   //17
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}


	@Override
	public int updateStatus(int auc_no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "updateStatus",auc_no); 
			
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
	public List<AuctionDetailDto> selectSendList(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		List<AuctionDetailDto> list = null;
		FarmPagingDto dto = new FarmPagingDto();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("mem_id", mem_id);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"selectSendList",hashmap);  //1,10전달
			
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
	public int sendListtotalPage(String mem_id) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "sendListtotalPage",mem_id);   //17
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}


	@Override
	public List<AuctionDetailDto> selectNotYetstatus(int startseq, int endseq,String mem_id) {
		SqlSession session = null;
		List<AuctionDetailDto>list = null;
		FarmPagingDto dto = new FarmPagingDto();
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
	public int notYettotalPage(String mem_id) {
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


	

}
