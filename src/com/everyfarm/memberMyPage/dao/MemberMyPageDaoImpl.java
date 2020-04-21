package com.everyfarm.memberMyPage.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.memberMyPage.dto.MyFarmListDto;
import com.everyfarm.memberMyPage.dto.MyPaymentDto;
import com.everyfarm.memberMyPage.dto.MyPurchaseListDto;

public class MemberMyPageDaoImpl extends SqlMapConfig implements MemberMyPageDao {
	private String namespace = "memberMyPage.";
	
	@Override
	public MemberDto selectMyInfo(String mem_id) {
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectMyInfo", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
				
		}
		return dto;
	}

	@Override
	public int updateMyInfo(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"updateMyInfo", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int memberDelete(String mem_id) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"memberDelete", mem_id);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int applyGradeUp(String mem_id) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"applyGradeUp", mem_id);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public MemberDto selectGrade(String mem_id) {
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectGrade", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public List<MyPurchaseListDto> selectMyFundList(String mem_id) {
		SqlSession session = null;
		MyPurchaseListDto dto = new MyPurchaseListDto();
		List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectMyFundList", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<MyFarmListDto> selectMyFarmList(String mem_id) {
		SqlSession session = null;
		List<MyFarmListDto> list = new ArrayList<MyFarmListDto>();
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectMyFarmList", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<MyPurchaseListDto> selectMyAuctionList(String mem_id) {
		SqlSession session = null;
		List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectMyAuctionList", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int refund(int order_no) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"refund", order_no);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public List<MyPaymentDto> selectMyPaymentList(String mem_id) {
		SqlSession session = null;
		List<MyPaymentDto> list = new ArrayList<MyPaymentDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectMyPaymentList", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public MyPaymentDto orderAuction(int stock_no) {
		SqlSession session = null;
		MyPaymentDto dto = new MyPaymentDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"orderAuction", stock_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public MyPaymentDto orderInput(int stock_no, String mem_id, int stock_kg) {
		MyPaymentDto dto = new MyPaymentDto();
		SqlSession session = null;
		int res2 = 0;
		dto.setStock_no(stock_no);
		dto.setMem_id(mem_id);
		dto.setStock_kg(stock_kg);
		
		try {
			session = getSqlSessionFactory().openSession();
			int res = session.insert(namespace+"orderInput", dto);
			System.out.println(dto.getOrder_no());
			if(res>0) {
				res2 = session.insert(namespace+"orderDetail", dto);
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public int payInput(int order_no, int pay_price, int stock_kg) {
		int res = 0;
		SqlSession session = null;
		MyPaymentDto dto = new MyPaymentDto();
		dto.setOrder_no(order_no);
		dto.setPay_price(pay_price);
		dto.setStock_kg(stock_kg);
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"payInput", dto);
			if(res>0) {
				int res2 = session.update(namespace+"updateStatus", dto);
				if(res2>0) {
					session.commit();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int fundTotalPage(int column, String mem_id) {
		int res = 0;
		SqlSession session = null;
		int totalpage = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "fundTotalpage",mem_id);   
			totalpage = (int)Math.ceil((double)res/column);   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return totalpage;
	}

	@Override
	public List<MyPurchaseListDto> pagingMyFundList(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		MyPurchaseListDto dto = new MyPurchaseListDto();
		List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
		dto.setStartseq(startseq);
		dto.setEndseq(endseq);
		dto.setMem_id(mem_id);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"pagingMyFundList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<MyPurchaseListDto> pagingMyAuctionList(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		MyPurchaseListDto dto = new MyPurchaseListDto();
		List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
		dto.setStartseq(startseq);
		dto.setEndseq(endseq);
		dto.setMem_id(mem_id);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"pagingMyAuctionList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int auctionTotalPage(int column, String mem_id) {
		int res = 0;
		SqlSession session = null;
		int totalpage = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "auctionTotalpage",mem_id);   
			totalpage = (int)Math.ceil((double)res/column);   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return totalpage;
	}

	@Override
	public int paymentTotalPage(int column, String mem_id) {
		int res = 0;
		SqlSession session = null;
		int totalpage = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "paymentTotalpage",mem_id);   
			totalpage = (int)Math.ceil((double)res/column);   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return totalpage;
	}

	@Override
	public List<MyPaymentDto> pagingMyPaymentList(int startseq, int endseq, String mem_id) {
		SqlSession session = null;
		MyPaymentDto dto = new MyPaymentDto();
		List<MyPaymentDto> list = new ArrayList<MyPaymentDto>();
		dto.setStartseq(startseq);
		dto.setEndseq(endseq);
		dto.setMem_id(mem_id);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"pagingMyPaymentList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	

}
