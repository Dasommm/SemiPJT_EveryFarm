package com.everyfarm.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.member.biz.MemberBiz;
import com.everyfarm.member.biz.MemberBizImpl;
import com.everyfarm.member.dto.MemberDto;

/**
 * Servlet implementation class LoginAPIController
 */
@WebServlet("/apilogin.do")
public class LoginAPIController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAPIController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("login")) {  //네이버 아이디로 로그인 시
			String mem_email = request.getParameter("mem_email");
			String mem_name = request.getParameter("mem_name");
			String mem_id = request.getParameter("mem_id");
			System.out.println(mem_email+"/"+mem_name+"/"+mem_id);
			HttpSession session = request.getSession();
			session.setAttribute("mem_email", mem_email);
			session.setAttribute("mem_name", mem_name);
			session.setAttribute("mem_id", mem_id);
			System.out.println(mem_email+"/"+mem_name+"/"+mem_id+"두번째");
			response.sendRedirect("signup/additionalinfo.jsp"); //추가 정보 입력받는 곳으로
			//dispatch("additionalinfo.jsp",request,response);
			System.out.println(mem_email+"/"+mem_name+"/"+mem_id+"세번째");

		}else if(command.equals("alreadyused")) {
			System.out.println("아이디 이미 있음");
			String mem_id = request.getParameter("mem_id");
			
			MemberBiz biz = new MemberBizImpl();
			MemberDto dto = biz.selectAll(mem_id);
			
			HttpSession session = request.getSession();
			session.setAttribute("dto", dto);
			session.setMaxInactiveInterval(10*60);
			response.sendRedirect("home/section.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		
		String command = request.getParameter("command");
		MemberBiz biz = new MemberBizImpl();
		
		if(command.equals("inputinfores")) {
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			String mem_name =request.getParameter("mem_name");
			String mem_email = request.getParameter("mem_email");
			String mem_phone = request.getParameter("mem_phone");
			String mem_zonecode = request.getParameter("mem_zonecode");
			String mem_addr =request.getParameter("mem_addr");
			String mem_addretc = request.getParameter("mem_addretc");
		
			MemberDto dto = new MemberDto();
			dto.setMem_id(mem_id);
			dto.setMem_pw(mem_pw);
			dto.setMem_name(mem_name);
			dto.setMem_email(mem_email);
			dto.setMem_grade(1);
			dto.setMem_phone(mem_phone);
			dto.setMem_zonecode(mem_zonecode);
			dto.setMem_addr(mem_addr);
			dto.setMem_addretc(mem_addretc);
			
			//
			int res = biz.signupapi(dto);
		
			if(res > 0) {
				
				jsResponse("회원가입 성공","login/loginform.jsp",response);
			}else {
				jsResponse("회원가입 실패","signup/additionalinfo.jsp?mem_email="+mem_email+"&mem_name="+mem_name+"&mem_id="+mem_id,response);
			}
		}
	}	
	
	 private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatch = request.getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException { //스크립트 메시지를 편하게 사용하기 위한 메서드(out.println으로 사용해도 된다.)
			String res = "<script type='text/javascript'>"
					   + " alert('"+msg+"');"
					   + " location.href='"+url+"';"
					   + "</script>";
			PrintWriter out = response.getWriter();
			out.println(res);
		}

}
