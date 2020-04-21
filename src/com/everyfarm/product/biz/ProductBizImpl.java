package com.everyfarm.product.biz;

import java.util.Date;
import java.util.List;

import com.everyfarm.product.dao.ProductDao;
import com.everyfarm.product.dao.ProductDaoImpl;
import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;

public class ProductBizImpl implements ProductBiz{

	private ProductDao dao = new ProductDaoImpl();
	
	public List<ProductDto>productlist(PagingDto dto){
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		
		return dao.productlist(startseq,endseq);
	}

	@Override
	public List<ProductDto> bestlist() {
	
		return dao.bestlist();
	}

	@Override
	public int totalPage(int column) {
		int totalpage = (int)Math.ceil((double)dao.totalpage()/column);   //17 / 16 = 1
		return totalpage;
	}

	@Override
	public List<ProductDto> searchlist(PagingDto pagingdto,ProductDto dto) {
		int currentpage = pagingdto.getCurrentpage();   //초기값 1
		int column = pagingdto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		return dao.searchlist(startseq,endseq,dto);
	}
	@Override
	public int searchAreatotalPage(int column, String zoneval) {
		int totalpage = (int)Math.ceil((double)dao.searchAreatotalPage(zoneval)/column);   //17 / 16 = 1
		return totalpage;
	}

	@Override
	public List<ProductDto> searchtypelist(PagingDto pagingdto, ProductDto dto) {
		int currentpage = pagingdto.getCurrentpage();   //초기값 1
		int column = pagingdto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		return dao.searchtypelist(startseq,endseq,dto);
	}

	@Override
	public int searchTypetotalPage(int colume, int searchtype) {
		int totalpage = (int)Math.ceil((double)dao.searchTypetotalPage(searchtype)/colume); //17 / 16 = 1
		return totalpage;
	}

	@Override
	public ProductDto bestauctiondetail(int auc_no) {
	
		return dao.bestauctiondetail(auc_no);
	}

	@Override
	public int updateAuctioninfo(ProductDto dto) {
		
		return dao.updateAuctioninfo(dto);
	}

	@Override
	public int insertmemjoin(String mem_id,ProductDto dto) {
		
		return dao.insertmemjoin(mem_id,dto);
	}

	@Override
	public ProductDto liveTimeAjax(int auc_no){
		
		return dao.liveTimeAjax(auc_no);
	}

	@Override
	public int sendletter(ProductDto letterdto) {
		
		return dao.sendletter(letterdto);
	}

	@Override
	public ProductDto curBestRank() {

		return dao.curBestRank();
	}

	@Override
	public List<ProductDto> normalListProduct(PagingDto dto) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		
		return dao.normalListProduct(startseq,endseq);
	}

	@Override
	public List<ProductDto> BestListProduct() {
	
		return dao.BestListProduct();
	}

	@Override
	public List<ProductDto> searchTypeListProduct(PagingDto dto, ProductDto productdto) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		return dao.searchTypeListProduct(startseq,endseq,productdto);
	}

	@Override
	public List<ProductDto> searchAreaListProduct(PagingDto dto, ProductDto productdto) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		return dao.searchAreaListProduct(startseq,endseq,productdto);
	}

	@Override
	public int updateAucStatus() {
		
		return dao.updateAucStatus();
	}

	
}
