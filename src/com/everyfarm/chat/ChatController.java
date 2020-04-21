package com.everyfarm.chat;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/chat.do")
public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ChatController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("gochat")) {
			response.sendRedirect("chatting/chat.jsp");
		}else if(command.equals("gofaq")) {
			response.sendRedirect("chatting/gofaq.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
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
