package com.everyfarm.farmer.mypage.biz;

import java.util.List;

import com.everyfarm.farmer.mypage.dao.FarmerMainDao;
import com.everyfarm.farmer.mypage.dao.FarmerMainDaoImpl;
import com.everyfarm.farmer.mypage.dto.FarmerMainDto;

public class FarmerMainBizImpl implements FarmerMainBiz {

	FarmerMainDao dao = new FarmerMainDaoImpl();
	@Override
	public List<FarmerMainDto> applyList(String mem_id) {
		
		return dao.applyList(mem_id);
	}
	@Override
	public List<FarmerMainDto> recentOrderList(String mem_id) {
		
		return dao.recentOrderList(mem_id);
	}
	@Override
	public List<FarmerMainDto> recentRefundList(String mem_id) {
		
		return dao.recentRefundList(mem_id);
	}
	@Override
	public int runningFund(String mem_id) {
		
		return dao.runningFund(mem_id);
	}
	@Override
	public int standbyFund(String mem_id) {
		
		return dao.standbyFund(mem_id);
	}
	@Override
	public int runningAuc(String mem_id) {
		
		return dao.runningAuc(mem_id);
	}
	@Override
	public int standbyAuc(String mem_id) {
		
		return dao.standbyAuc(mem_id);
	}

}
