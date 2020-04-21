package com.everyfarm.farmer.farm.biz;

import java.util.List;

import com.everyfarm.farmer.farm.dao.FarmDao;
import com.everyfarm.farmer.farm.dao.FarmDaoImpl;
import com.everyfarm.farmer.farm.dto.FarmDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public class FarmBizImpl implements FarmBiz {

	public FarmDao dao = new FarmDaoImpl();
	@Override
	public List<FarmDto> myFarmList(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   //초기값 1
		int column = dto.getColumn();   
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		System.out.println(startseq+","+endseq+"::시작번호,끝번호(biz)");
		return dao.myFarmList(startseq, endseq, mem_id);
	}

	@Override
	public int myFarmListPage(int column, String mem_id) {
		int farmlistpage = (int)Math.ceil((double)dao.myFarmListPage(mem_id)/column);   // 6 / 10 > 올림:1
		System.out.println(farmlistpage+"biz의 farmlistpage");
		return farmlistpage;
	}

	@Override
	public List<FarmDto> sendFarmDetail(int wfarm_key) {
		
		return dao.sendFarmDetail(wfarm_key);
	}

	

	
}
