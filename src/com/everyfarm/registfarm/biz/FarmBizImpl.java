package com.everyfarm.registfarm.biz;

import com.everyfarm.registfarm.dao.FarmDao;
import com.everyfarm.registfarm.dao.FarmDaoImpl;
import com.everyfarm.registfarm.dto.FarmDto;

public class FarmBizImpl implements FarmBiz {

	FarmDao dao = new FarmDaoImpl();
	
	@Override
	public int insertFarm(FarmDto dto) {
		// TODO Auto-generated method stub
		return dao.insertFarm(dto);
	}

	@Override
	public FarmDto selectFarm(String mem_id) {
		// TODO Auto-generated method stub
		return dao.selectFarm(mem_id);
	}

}
