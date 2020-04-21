package com.everyfarm.registfarm.dao;

import java.util.List;

import com.everyfarm.registfarm.dto.FarmDto;

public interface FarmDao {

	//1. 농장 등록
	public int insertFarm(FarmDto dto);
	//2. 나의 농장 조회
	public FarmDto selectFarm(String mem_id);
}
