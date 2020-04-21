package com.everyfarm.farmer.farm.dao;

import java.util.List;

import com.everyfarm.farmer.farm.dto.FarmDto;

public interface FarmDao {
	
	// 보유 농장 내역
	public List<FarmDto> myFarmList(int startseq, int endseq, String mem_id);
	// 보유 농장 페이징
	public int myFarmListPage(String mem_id);
	// 임대 현황
	public List<FarmDto> sendFarmDetail(int wfarm_key);
	
	
}
