package com.everyfarm.member.dao;

import java.util.List;

import com.everyfarm.member.dto.MemberDto;

public interface MemberDao {
	//1.로그인
	public MemberDto login(String id, String pw);
	//네이버 이메일 중복체크
	public List<MemberDto> apiEmailChk(String api_id);
	//아이디 찾기
	public List<MemberDto> searchId(MemberDto dto);
	//비밀번호 찾기
	public List<MemberDto> searchPw(MemberDto dto);
	//임시 비밀번호로 UPDATE
	public int temporarypw(MemberDto dto);
	//네이버&카카오로 로그인 시 전체출력 후 세션 저장할 함수
	public MemberDto selectAll(String email);
	//2.회원가입
	//2-1. 중복체크
	public MemberDto idChk(String mem_id);
	//2-2. 이메일 중복확인
	public MemberDto emailJunbokCh(String mem_email);
	//회원가입
	public int signup(MemberDto dto);
	//api회원가입 체크
    public int signupapi(MemberDto dto);
    
    
}
