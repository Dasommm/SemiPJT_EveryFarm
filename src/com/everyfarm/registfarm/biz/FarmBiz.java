package com.everyfarm.registfarm.biz;

import com.everyfarm.registfarm.dto.FarmDto;

public interface FarmBiz {

	//1. 농장 등록
	public int insertFarm(FarmDto dto);
	//2. 나의 농장 조회
	public FarmDto selectFarm(String mem_id);
}
