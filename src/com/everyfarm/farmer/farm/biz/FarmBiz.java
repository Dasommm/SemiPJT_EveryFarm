package com.everyfarm.farmer.farm.biz;

import java.util.List;

import com.everyfarm.farmer.farm.dto.FarmDto;
import com.everyfarm.farmer.fund.dto.PagingDto;

public interface FarmBiz {

	// 보유 농장 내역
	public List<FarmDto> myFarmList(PagingDto dto, String mem_id);
	// 보유 농장 페이징
	public int myFarmListPage(int column, String mem_id);
	// 임대 현황
	public List<FarmDto> sendFarmDetail(int wfarm_key);

}
