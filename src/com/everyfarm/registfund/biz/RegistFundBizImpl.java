package com.everyfarm.registfund.biz;

import com.everyfarm.registfund.dao.RegistFundDao;
import com.everyfarm.registfund.dao.RegistFundDaoImpl;
import com.everyfarm.registfund.dto.RegistFundDto;

public class RegistFundBizImpl implements RegistFundBiz {

	RegistFundDao dao = new RegistFundDaoImpl();
	
	@Override
	public int registStock(RegistFundDto dto) {
		return dao.registStock(dto);
	}
	
	@Override
	public int registFund(RegistFundDto dto) {
		return dao.registFund(dto);
	}

}
