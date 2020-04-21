package com.everyfarm.member.biz;

import java.util.List;

import com.everyfarm.member.dao.MemberDao;
import com.everyfarm.member.dao.MemberDaoImpl;
import com.everyfarm.member.dto.MemberDto;

public class MemberBizImpl implements MemberBiz{

	MemberDao dao = new MemberDaoImpl();
	
	
	@Override
	public MemberDto login(String id, String pw) {
	
		return dao.login(id, pw);
	}

	@Override
	public List<MemberDto> apiEmailChk(String api_id) {

		return dao.apiEmailChk(api_id);
	}


	@Override
	public List<MemberDto> searchId(MemberDto dto) {
		return dao.searchId(dto);

	}

	@Override
	public List<MemberDto> searchPw(MemberDto dto) {

		return dao.searchPw(dto);
	}
	
	@Override
	public int temporarypw(MemberDto dto) {

		return dao.temporarypw(dto);
	}

	@Override
	public MemberDto selectAll(String email) {
		
		return dao.selectAll(email);
	}

//2.회원가입
	//2-1. 중복체크
	@Override
	public MemberDto idChk(String mem_id) {
	
		return dao.idChk(mem_id);
	}

	@Override
	public MemberDto emailJunbokCh(String mem_email) {

		return dao.emailJunbokCh(mem_email);
	}

	@Override
	public int signup(MemberDto dto) {

		return dao.signup(dto);
	}

	@Override
	public int signupapi(MemberDto dto) {
	
		return dao.signupapi(dto);
	}

	

}
