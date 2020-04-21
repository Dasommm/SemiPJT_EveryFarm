package com.everyfarm.registfund.dao;

import com.everyfarm.registfund.dto.RegistFundDto;

public interface RegistFundDao {
	// 상품 등록
	public int registStock(RegistFundDto dto);
	// 펀드 등록
	public int registFund (RegistFundDto dto);
}
