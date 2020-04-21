package com.everyfarm.product.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;

public class ProductDaoImpl extends SqlMapConfig implements ProductDao{

	private String namespace = "product.";
	
	@Override
	public List<ProductDto> productlist(int startseq, int endseq) {
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto dto = new PagingDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			
			list = session.selectList(namespace+"auctionlist",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<ProductDto> bestlist() {
		SqlSession session = null;
		List<ProductDto>list = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"bestauctionlist");
			System.out.println(list.get(2).getStock_image()+"********다오");
		} catch (Exception e) {
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
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<ProductDto> searchlist(int startseq, int endseq,ProductDto dto) {
		
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto pagingdto = new PagingDto();
		HashMap<String, Object>hashmap = new HashMap<String,Object>();
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", startseq);
			hashmap.put("endseq", endseq);
			hashmap.put("stock_location", dto.getStock_location());
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
			res = session.selectOne(namespace + "searchAreatotalpage",zoneval);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<ProductDto> searchtypelist(int startseq, int endseq, ProductDto dto) {
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto pagingdto = new PagingDto();
		HashMap<String, Object>hashmap = new HashMap<String,Object>();
		try {
			session = getSqlSessionFactory().openSession();
			
			hashmap.put("startseq", startseq);
			hashmap.put("endseq", endseq);
			hashmap.put("stock_kind", dto.getStock_kind());
			list = session.selectList(namespace+"searchtypelist",hashmap);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int searchTypetotalPage(int searchtype) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "searchTypetotalpage",searchtype);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public ProductDto bestauctiondetail(int auc_no) {
		SqlSession session = null;
		ProductDto productdto = new ProductDto();
		try {
			session = getSqlSessionFactory().openSession();
			productdto = session.selectOne(namespace+"bestauctiondetail",auc_no);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return productdto;
	}

	@Override
	public int updateAuctioninfo(ProductDto dto) {      //경매상품 구매시 최고가update(+입력받은값), 경매참여인원update(+1)
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			System.out.println("다오 임플");
			System.out.println(dto.getAuc_nowPrice()+"*******");
			System.out.println(dto.getAuc_join()+"*******");
			System.out.println(dto.getAuc_no()+"******");
			
			res = session.update(namespace+"updateAuctioninfo",dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int insertmemjoin(String mem_id,ProductDto dto) {
		SqlSession session = null;
		int res = 0;
		
		HashMap<String,String>hashmap = new HashMap<String,String>();
		
		try {
			session = getSqlSessionFactory().openSession();
			hashmap.put("mem_id", mem_id);
			hashmap.put("auc_no", Integer.toString(dto.getAuc_no()));
			hashmap.put("memjoin_aucPrice", Integer.toString(dto.getAuc_nowPrice()));
			res = session.update(namespace+"insertmemjoin",hashmap);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public ProductDto liveTimeAjax(int auc_no){
		SqlSession session = null;
		ProductDto dto = new ProductDto();
		//HashMap<String, String>hashmap = new HashMap<String,String>();

	
		     /* long time = System.currentTimeMillis(); 
		      SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		      //SimpleDateFormat dayTime = new SimpleDateFormat("rrrr-mm-dd hh24:mi:ss");
		      String str = dayTime.format(new Date(time));
		      System.out.println(str+"::str**********");
		      */
		     // System.out.println("얜 마지막으로테스트시간::"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))); 
		      //String localtime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		// System.out.println(localtime+"::systime 이거 실시간으로 바껴ㅑ야댐");     
		      
		 	 // dto.setLocaltime(localtime);

		      
		try {
			session = getSqlSessionFactory().openSession();
		
			dto = session.selectOne(namespace + "liveTimeAjax",auc_no);
			
			System.out.println(dto.getDay()+"::여기부터 result결과");
			System.out.println(dto.getHours());
			System.out.println(dto.getMinutes());
			System.out.println(dto.getSeconds());
		System.out.println(dto.getMinutes()+"분:"+dto.getSeconds()+"초");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public int sendletter(ProductDto letterdto) {
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
	public ProductDto curBestRank() {
		SqlSession session = null;
		ProductDto productdto = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			productdto = session.selectOne(namespace+"curBestRank");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return productdto;
	}

	@Override
	public List<ProductDto> normalListProduct(int startseq, int endseq) {
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto dto = new PagingDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			
			list = session.selectList(namespace+"normalListProduct",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<ProductDto> BestListProduct() {
		SqlSession session = null;
		List<ProductDto>list = null;
		
		try {
			session = getSqlSessionFactory().openSession();

			list = session.selectList(namespace+"BestListProduct");
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<ProductDto> searchTypeListProduct(int startseq, int endseq, ProductDto productdto) {
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, Integer>hashmap = new HashMap<String, Integer>();
		
		try {
			session = getSqlSessionFactory().openSession();
		
			hashmap.put("startseq", startseq);
			hashmap.put("endseq", endseq);
			hashmap.put("stock_kind", productdto.getStock_kind());
			
			list = session.selectList(namespace+"searchTypeListProduct",hashmap);
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<ProductDto> searchAreaListProduct(int startseq, int endseq, ProductDto productdto) {
		SqlSession session = null;
		List<ProductDto>list = null;
		PagingDto dto = new PagingDto();
		HashMap<String, String>hashmap = new HashMap<String, String>();
		
		try {
			session = getSqlSessionFactory().openSession();
		
			hashmap.put("startseq", Integer.toString(startseq));
			hashmap.put("endseq", Integer.toString(endseq));
			hashmap.put("stock_location", productdto.getStock_location());
			
			list = session.selectList(namespace+"searchAreaListProduct",hashmap);
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int updateAucStatus() {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"updateAucStatus");
			
			if (res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	

}
