package com.everyfarm.registauction.dao;

import com.everyfarm.registauction.dto.AuctionDto;

public interface AuctionDao {

	// 상품테이블 등록
	public int registStock(AuctionDto dto);
	// 경매 등록
	public int registAuction(AuctionDto dto);
}
