package com.everyfarm.registfund.biz;

import com.everyfarm.registfund.dto.RegistFundDto;

public interface RegistFundBiz {
	// 상품 등록
	public int registStock(RegistFundDto dto);
	// 펀드 등록
	public int registFund(RegistFundDto dto);
}
