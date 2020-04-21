package com.everyfarm.home.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.homeletters.biz.HomeLettersBiz;
import com.everyfarm.homeletters.biz.HomeLettersBizImpl;
import com.everyfarm.letters.dto.LettersDto;


@WebServlet("/home.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public HomeController() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		
		if(command.equals("home")) {
			response.sendRedirect("home/section.jsp");
		}else if(command.equals("siteintroduce")) {
			response.sendRedirect("siteintroduce/siteintroduce.jsp");
		}else if(command.equals("auction")) {
			response.sendRedirect("auction/auctionlist.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("liveTimeLetters")) {
			System.out.println("홈 컨트롤러 에이작스 들어왔다.");
			String mem_id = request.getParameter("mem_id");
			
			System.out.println(mem_id+"::mem_id home컨트롤러로 들어왔다.");
			HomeLettersBiz biz = new HomeLettersBizImpl();
			LettersDto lettersdto = new LettersDto();
			
			lettersdto.setMem_id(mem_id);
			lettersdto.setLetter_status(0);
			
			int res = biz.LettersCnt(lettersdto);
			
			System.out.println(res);
			HttpSession session = request.getSession();
			session.setAttribute("homelettersCnt", res);
			
			response.sendRedirect("home/headerletterajax.jsp");
		}
		
		
		doGet(request, response);
	}

}
