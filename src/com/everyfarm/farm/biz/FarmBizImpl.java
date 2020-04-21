package com.everyfarm.farm.biz;

import java.util.List;

import com.everyfarm.farm.dao.FarmDao;
import com.everyfarm.farm.dao.FarmDaoImpl;
import com.everyfarm.farm.dto.FarmDto;
import com.everyfarm.farm.dto.FarmPagingDto;
import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;

public class FarmBizImpl implements FarmBiz{
	
	private FarmDao dao = new FarmDaoImpl();

	@Override
	public List<FarmDto> farmlist(FarmPagingDto dto) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1=  16*(1-1)+1
		int endseq = column * currentpage;   //16
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.farmlist(startseq,endseq);
	}

	@Override
	public int totalPage(int column) {       //16
		int totalpage = (int)Math.ceil((double)dao.totalpage()/column);   //21 / 16 = 1
		System.out.println(totalpage+"biz의 totalpage");
		return totalpage;
	}
	
	@Override
	public List<FarmDto> searchlist(FarmPagingDto pagingdto,FarmDto dto) {
		int currentpage = pagingdto.getCurrentpage();   //초기값 1
		int column = pagingdto.getColumn();   //16
		
		int startseq = column * (currentpage - 1) + 1;  //1
		int endseq = column * currentpage;   //16
		return dao.searchlist(startseq,endseq,dto);
	}
	@Override
	public int searchAreatotalPage(int column, String zoneval) {  //16 , 입력받은 지역명
		int totalpage = (int)Math.ceil((double)dao.searchAreatotalPage(zoneval)/column);   //입력받은지역명의count / 16 = 1
		return totalpage;
	}

	@Override
	public FarmDto farmdetail(int wfarm_key) {
	
		return dao.farmdetail(wfarm_key);
	}

	@Override
	public FarmDto selectMemInfo(String mem_id) {
	
		return dao.selectMemInfo(mem_id);
	}
	
	@Override
	public int insertSelectedFarm(String mem_id, int wfarm_key, int array) {
		
		return dao.insertSelectedFarm(mem_id, wfarm_key, array);
	}
	
	@Override
	public List<FarmDto> selectMf_Area(int sendWfarm_key) {
	
		return dao.selectMf_Area(sendWfarm_key);
	}
	
	@Override
	public int sendletter(FarmDto letterdto) {
		
		return dao.sendletter(letterdto);
	}

	@Override
	public int selectTotalSize(int wfarm_key) {
	
		return dao.selectTotalSize(wfarm_key);
	}

	@Override
	public int alreadySelectedCnt(int wfarm_key) {
		
		return dao.alreadySelectedCnt(wfarm_key);
	}

	@Override
	public int updateStatus(String wfarm_status, int wfarm_key) {
		
		return dao.updateStatus(wfarm_status,wfarm_key);
	}



}
