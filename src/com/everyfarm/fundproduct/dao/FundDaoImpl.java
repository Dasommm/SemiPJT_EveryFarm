package com.everyfarm.fundproduct.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.fundproduct.dto.FundDto;
import com.everyfarm.fundproduct.dto.FundPagingDto;
import com.everyfarm.fundproduct.dto.FundPayDto;

public class FundDaoImpl extends SqlMapConfig implements FundDao {
	
	private String namespace = "fund.";
	
	@Override
	public List<FundDto> fundAllList(int to, int from) {
						//to는 10, from은 1 
		
		List<FundDto> list = null;
		SqlSession session = null;	
		int statusUpdate = 0;
		FundPagingDto dto = new FundPagingDto();
			dto.setTo(to);
			dto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			statusUpdate = session.update(namespace+"fundStatusUpdate");
			System.out.println("업데이트"+statusUpdate);
			if(statusUpdate>0) {
				session.commit();
			}
			
			list = session.selectList(namespace+"selectList",dto);		
			
		} catch (Exception e) {
			System.out.println("session");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<FundDto> fundBestList() {	//펀드 best4 뽑기

		List<FundDto> list = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"bestList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public FundDto fundDetail(int stock_no) {			//펀드 detail

		FundDto detail = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			detail = session.selectOne(namespace+"detail",stock_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return detail;
	}


	@Override
	public int totalpage() {		//총 게시물 갯수

		int totalpage = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalpage");
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}		
		
		return totalpage;
	}

	@Override
	//bill table에 input해서 주문번호 받기, 그 주문번호를 가지고 orderinfo 상세 페이지에 구매요청으로 데이터 입력
	public FundPayDto orderInput(int stock_no, String mem_id, int orderinfo_kg, int fund_no) {
		FundPayDto payDto = null;
		SqlSession session = null;
		
		payDto = new FundPayDto();
		payDto.setFund_no(fund_no);
		payDto.setStock_no(stock_no);
		payDto.setMem_id(mem_id);
		payDto.setPay_price(orderinfo_kg);
		
		try {
			session = getSqlSessionFactory().openSession();
			int res = session.insert(namespace+"orderinput",payDto);	//bill table insert => order_no 가져옴
			System.out.println("주문번호 : "+payDto.getOrder_no());
			
			if(res>0) {
				int res2 = session.insert(namespace+"orderdetail",payDto); //orderinfo table insert 
				if(res2>0) {
					session.commit();					
				}
			}
			payDto = session.selectOne(namespace+"orderRes",payDto.getOrder_no()); 
			System.out.println("daoImpl orderNo :"+payDto.getOrder_no());
			System.out.println("daoImpl memId :"+payDto.getMem_id());
			System.out.println("daoImpl payPrice :"+payDto.getPay_price());

			//=>order_no, mem_id, pay_price 담겨있음
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return payDto;
	}

	@Override
	//결재완료 후 pay table에 데이터 input, orderinfo table 구매완료로 업데이트
	public int payInput(int order_no, int pay_price) {
		int payRes = 0;
		SqlSession session = null;
		
		System.out.println(order_no);
		System.out.println(pay_price);
		FundPayDto payInput = new FundPayDto();
		payInput.setOrder_no(order_no);
		payInput.setPay_price(pay_price);
		
		try {
			session = getSqlSessionFactory().openSession();
			payRes = session.insert(namespace+"payInput",payInput);
			
			if(payRes>0) {
				int updatePayInfo = session.update(namespace+"updateDetail",payInput);
				if(updatePayInfo>0) {
					session.commit();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return payRes;
	}

	
	@Override
	//fund table 참여인원 update
	public int memJoinUpdate(int fund_no, int pay_price) {
		int updateRes = 0;
		SqlSession session = null;
		
		FundPayDto payDto = new FundPayDto();
		payDto.setFund_no(fund_no);
		payDto.setPay_price(pay_price);
		
		try {
			session = getSqlSessionFactory().openSession();
			updateRes = session.update(namespace+"memJoinUpdate",payDto);
			
			if(updateRes>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return updateRes;
	}

	@Override
	//memjoin table 참여내역 insert
	public int memJoinInsert(String mem_id, int fund_no, int pay_price) {
		int memJoinInsertRes = 0;
		SqlSession session = null;
		
		FundPayDto payDto = new FundPayDto();
		payDto.setMem_id(mem_id);
		payDto.setFund_no(fund_no);
		payDto.setPay_price(pay_price);
		
		try {
			session = getSqlSessionFactory().openSession();
			memJoinInsertRes = session.insert(namespace+"joinInsert",payDto);
			
			if(memJoinInsertRes>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}		
		
		return memJoinInsertRes;
	}

	@Override
	public FundDto deadLineAjax(int fund_no) {

		SqlSession session = null;
		
		FundDto deadDto = new FundDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			deadDto = session.selectOne(namespace+"deadAjax",fund_no);
			
			System.out.println(deadDto.getDay()+"result----");
			System.out.println(deadDto.getHours());
			System.out.println(deadDto.getMinutes());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return deadDto;
	}

	@Override
	public double finish_totalpage() {
		System.out.println("dao들어옴");
		int finish_totalpage = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			finish_totalpage = session.selectOne(namespace+"finishPage");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
			System.out.println("totalpage dao 끝");
		}
				
		return finish_totalpage;
	}

	@Override
	public List<FundDto> finishList(int to, int from) {
		List<FundDto> finishList = null;
		SqlSession session = null;	
		
		FundPagingDto finishDto = new FundPagingDto();
			finishDto.setTo(to);
			finishDto.setFrom(from);
		
		try {
			session = getSqlSessionFactory().openSession();
			finishList = session.selectList(namespace+"finishList",finishDto);		
			
		} catch (Exception e) {
			System.out.println("session");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
			System.out.println("List dao 통과");
		}
		
		return finishList;
	}

	@Override
	public FundDto fundJoinAjax(int fund_no) {
		FundDto joinAjax = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			joinAjax = session.selectOne(namespace+"joinAjax",fund_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return joinAjax;
	}

	@Override
	public FundDto priceUpdate(int fund_no) {
		FundDto priceAjax = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			priceAjax = session.selectOne(namespace+"priceAjax",fund_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return priceAjax;
	}

	@Override
	public List<FundDto> joinMemName(int fund_no) {
		List<FundDto> memName = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			memName = session.selectList(namespace+"joinMemName",fund_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println("dao name result:"+memName.size());
			session.close();
		}
		
		return memName;
}

}
