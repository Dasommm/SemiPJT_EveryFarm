package com.everyfarm.farm.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.farm.dto.FarmDto;
import com.everyfarm.farm.dto.FarmPagingDto;
import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;

public class FarmDaoImpl extends SqlMapConfig implements FarmDao{

	private String namespace = "rentfarm.";
	
	@Override
	public List<FarmDto> farmlist(int startseq, int endseq) {  //주말농장 전체 리스트
		SqlSession session = null;
		List<FarmDto>list = null;
		FarmPagingDto dto = new FarmPagingDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			System.out.println(startseq+","+endseq+"::시작번호,끝번호(dao)");
			list = session.selectList(namespace+"farmlist",dto);  //1,16전달
			
			//Date date = list.get(0).getWfarm_regDate();
			//System.out.println(date+"::포맷날짜");
			//SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
			//String today =sFormat.format(date);
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
	public int totalpage() {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "totalpage");   //17
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<FarmDto> searchlist(int startseq, int endseq,FarmDto dto) {
		
		SqlSession session = null;
		List<FarmDto>list = null;
		FarmPagingDto pagingdto = new FarmPagingDto();
		HashMap<String, Object>hashmap = new HashMap<String,Object>();
		try {
			session = getSqlSessionFactory().openSession();
			System.out.println("startseq:"+startseq);
			System.out.println("endseq:"+endseq);
			System.out.println("wfarm_addr:"+dto.getWfarm_addr());
			hashmap.put("startseq", startseq);
			hashmap.put("endseq", endseq);
			hashmap.put("wfarm_addr", dto.getWfarm_addr());
			list = session.selectList(namespace+"searchlist",hashmap);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public int searchAreatotalPage(String zoneval) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			System.out.println("zoneval:"+zoneval);
			res = session.selectOne(namespace + "searchAreatotalpage",zoneval);
			System.out.println(res+"::입력받은 지역명의 갯수");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public FarmDto farmdetail(int wfarm_key) {
		SqlSession session = null;
		FarmDto dto = new FarmDto();
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"farmdetail",wfarm_key);
		} catch (Exception e) {
			System.out.println("[error]:farmdetail");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}

	@Override
	public FarmDto selectMemInfo(String mem_id) {
		SqlSession session = null;
		FarmDto farmdto = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			
			farmdto = session.selectOne(namespace+"selectMemInfo",mem_id);
		} catch (Exception e) {
			System.out.println("[error]:farmdetail");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return farmdto;
	}
	
	@Override
	public int insertSelectedFarm(String mem_id, int wfarm_key, int array) {
		SqlSession session = null;
		int res = 0;
		HashMap<String, String>hashmap = new HashMap<String, String>();
		//FarmDto farmdto = new FarmDto();
		try {
			session = getSqlSessionFactory().openSession();
			/*farmdto.setMem_id(mem_id);
			farmdto.setWfarm_key(wfarm_key);
			farmdto.setArray(array);
			*/
			
			hashmap.put("mem_id", mem_id);
			hashmap.put("wfarm_key", Integer.toString(wfarm_key));
			hashmap.put("array", Integer.toString(array));
///////////
			System.out.println(mem_id+"mem_id@@@");
			System.out.println(wfarm_key+"wfarm_key@@@");
			System.out.println(array+"array@@@");
///////////////////

			res = session.insert(namespace+"insertSelectedFarm",hashmap);
			System.out.println("res##"+res);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[error]:farmdetail");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public List<FarmDto> selectMf_Area(int sendWfarm_key) {
		SqlSession session = null;
		List<FarmDto> list = new ArrayList<FarmDto>();
	
		try {
			session = getSqlSessionFactory().openSession();
		
			list = session.selectList(namespace+"selectMf_Area",sendWfarm_key);
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return list;
	}
	
	@Override
	public int sendletter(FarmDto letterdto) {
		SqlSession session = null;
		int res = 0;
		
		System.out.println(letterdto.getMem_id()+"::수신자");
		System.out.println(letterdto.getLetter_sender()+"::발신자");
		System.out.println(letterdto.getLetter_title()+"::제목");
		System.out.println(letterdto.getLetter_content()+"::내용");
		
		try {
			session = getSqlSessionFactory().openSession();
		
			res = session.insert(namespace + "insertletter",letterdto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return res;
	}

	@Override
	public int selectTotalSize(int wfarm_key) {
		SqlSession session = null;
		int wfarm_totalArea = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			wfarm_totalArea = session.selectOne(namespace+"selectTotalSize",wfarm_key);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return wfarm_totalArea;
	}

	@Override
	public int alreadySelectedCnt(int wfarm_key) {
		SqlSession session = null;
		int alreadySelectedCnt = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			alreadySelectedCnt = session.selectOne(namespace+"alreadySelectedCnt",wfarm_key);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return alreadySelectedCnt;
	}

	@Override
	public int updateStatus(String wfarm_status, int wfarm_key) {
		SqlSession session = null;
		int updateres = 0;
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			hashmap.put("wfarm_status", wfarm_status);
			hashmap.put("wfarm_key", Integer.toString(wfarm_key));
			updateres = session.update(namespace+"updateStatus",hashmap);
		
			if(updateres > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return updateres;
	}


}
