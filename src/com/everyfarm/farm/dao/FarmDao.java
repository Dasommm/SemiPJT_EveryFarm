package com.everyfarm.farm.dao;

import java.util.List;

import com.everyfarm.farm.dto.FarmDto;
import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.product.dto.ProductDto;

public interface FarmDao {

	//주말농장 전체 리스트
		public List<FarmDto> farmlist(int startseq, int endseq);  //1,16
		
	//페이징
		public int totalpage();	
		
	//지역별 search
		public List<FarmDto>searchlist(int startseq, int endseq,FarmDto dto);
			
	//지역별 페이징
		public int searchAreatotalPage(String zoneval);	
				
	//주말농장 detail
		public FarmDto farmdetail(int wfarm_key);
	
	//주말농장 결제 전 회원정보 select
		public FarmDto selectMemInfo(String mem_id);
		
	//주말농장 땅선택 insert
		public int insertSelectedFarm(String mem_id, int wfarm_key,int array);

	//주말농장 mf_area(분양받은 위치)가져오는 함수
		public List<FarmDto>selectMf_Area(int sendWfarm_key);
		
	//쪽지 보내기
		public int sendletter(FarmDto letterdto);	
		
	//주말농장 총평수 가져오는 함수
		public int selectTotalSize(int wfarm_key);	
		
	//주말농장 이미 결제된 땅위치 Cnt 가져오는 함수
		public int alreadySelectedCnt(int wfarm_key);	

	//만약 총평수==해당PK의 땅위치갯수가 같다면 WEEKENDFARM테이블의 status를 3으로 변경
		public int updateStatus(String wfarm_status, int wfarm_key);
}
