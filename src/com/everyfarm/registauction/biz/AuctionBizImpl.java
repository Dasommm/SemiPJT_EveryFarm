package com.everyfarm.registauction.biz;

import com.everyfarm.registauction.dao.AuctionDao;
import com.everyfarm.registauction.dao.AuctionDaoImpl;
import com.everyfarm.registauction.dto.AuctionDto;

public class AuctionBizImpl implements AuctionBiz {

	AuctionDao dao = new AuctionDaoImpl();
	@Override
	public int registStock(AuctionDto dto) {
		// TODO Auto-generated method stub
		return dao.registStock(dto);
	}
	@Override
	public int registAuction(AuctionDto dto) {
		
		return dao.registAuction(dto);
	}

}
