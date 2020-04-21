package com.everyfarm.product.dao;

import java.util.Date;
import java.util.List;

import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;

public interface ProductDao {

	//일반상품 리스트
		public List<ProductDto>productlist(int startseq, int endseq);
		
	//페이징
		public int totalpage();
		
	//best경매상품 리스트(4개만)
		public List<ProductDto>bestlist();	
		
	//지역별 search
		public List<ProductDto>searchlist(int startseq, int endseq,ProductDto dto);
	
	//지역별 페이징
		public int searchAreatotalPage(String zoneval);	
	
	//품목별로 search
		public List<ProductDto>searchtypelist(int startseq, int endseq,ProductDto dto);

	//품목별 페이징
		public int searchTypetotalPage(int searchtype);
		
	//best경매상품detail
		public ProductDto bestauctiondetail(int auc_no);
		
	//경매상품 구매시 최고가update(+입력받은값), 경매참여인원update(+1)
		public int updateAuctioninfo(ProductDto dto);
		
	//경매상품 구매시 참여회원 테이블 -- 시퀀스부여, 아이디,경매번호,입찰시 insert시킬 금액, sysdate
		public int insertmemjoin(String mem_id,ProductDto dto);
		
	//경매 detail 실시간 에이작스
		public ProductDto liveTimeAjax(int auc_no);
		
	//쪽지 보내기
		public int sendletter(ProductDto letterdto);	
	
	//sectiontwo 경매Best Rank추출 함수
		public ProductDto curBestRank();	
		
	//일반상품 시간계산
	public List<ProductDto>normalListProduct(int startseq, int endseq);	
	
	//best상품 시간계산
	public List<ProductDto>BestListProduct();	
	
	//품목별 상품 시간계산
	public List<ProductDto>searchTypeListProduct(int startseq,int endseq,ProductDto productdto);

	//지역별 상품 시간계산
	public List<ProductDto>searchAreaListProduct(int startseq, int endseq, ProductDto productdto);

	//경매기간 지난상품 status ->3
	public int updateAucStatus();
}
  