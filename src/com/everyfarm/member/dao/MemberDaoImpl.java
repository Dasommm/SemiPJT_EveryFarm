package com.everyfarm.member.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.everyfarm.member.dto.MemberDto;

public class MemberDaoImpl extends SqlMapConfig implements MemberDao{

	private String namespace = "member.";
	
	@Override
	public MemberDto login(String id, String pw) {
	
		MemberDto dto = new MemberDto();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto.setMem_id(id);
			dto.setMem_pw(pw);
			dto.setMem_drop("y");
			
			dto = session.selectOne(namespace+"login",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}

		return dto;
	}
	@Override
	public List<MemberDto> apiEmailChk(String api_id) {  //아이디받아서 이메일 리턴조회
		MemberDto dto = new MemberDto();
		SqlSession session = null;
		List<MemberDto>list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlSessionFactory().openSession();

			System.out.println("api_id"+api_id);
			dto = session.selectOne(namespace+"apiEmailChk",api_id);
			//System.out.println("dto.getId()"+dto.getMem_id());
			if(dto!=null) {
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(list.size()+"*******");
		return list;
	}
	 @Override
	public List<MemberDto> searchId(MemberDto info) {
		 System.out.println("daoimpl들어왔다.");
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		List<MemberDto>list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlSessionFactory().openSession();	
			dto = session.selectOne(namespace+"searchId",info);
			System.out.println("*******"+dto.getMem_id()+"************");
			
			list.add(dto);
			
			System.out.println("daolist : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(list.size()+"다오임플 리턴 밑 리스트 사이즈");
		return list;
		
	}
	
	@Override
	public List<MemberDto> searchPw(MemberDto info) {
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		List<MemberDto>list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlSessionFactory().openSession();	
			dto = session.selectOne(namespace+"searchPw",info);
			//System.out.println(dto.getPw()+"쿼리문에서 뽑은 pw");
			
			list.add(dto);
			
			System.out.println("daolist사이즈다 : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int temporarypw(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"tempPw",dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public MemberDto selectAll(String mem_id) {
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectAll",mem_id);
			//System.out.println(dto.getMem_grade()+"::네이버로그인시 grade 1나와야됨!!!!!!!!! ");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	@Override
	public MemberDto idChk(String mem_id) {

		MemberDto dto = null;
		SqlSession session = null;
		//LoginDto dto = new LoginDto(); 이면 controller에서 다른 방법으로 if문을 사용해야 한다.
		//String sql = " SELECT * FROM TB_MEMBER WHERE MEM_ID = ? ";
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"idChk", mem_id);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}

	@Override
	public MemberDto emailJunbokCh(String mem_email) {
		MemberDto dto = null;
		SqlSession session = null;
		//LoginDto dto = new LoginDto(); 이면 controller에서 다른 방법으로 if문을 사용해야 한다.
		//String sql = " SELECT * FROM TB_MEMBER WHERE MEM_ID = ? ";
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"emailJunbokCh", mem_email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}

	@Override
	public int signup(MemberDto dto) {
		//MemberDto dto = new MemberDto();
				SqlSession session = null;
				int res = 0;  
				
				try {
					session = getSqlSessionFactory().openSession(false);	
					res =session.insert(namespace+"signup",dto);
					if(res > 0) {
						session.commit();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}
				return res;
	}
	@Override
	public int signupapi(MemberDto dto) {
		//MemberDto dto = new MemberDto();
				SqlSession session = null;
				int res = 0;  
				
				try {
					session = getSqlSessionFactory().openSession(false);
					res =session.insert(namespace+"signupapi",dto);
					if(res > 0) {
						session.commit();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}
				return res;
	}
	


}
