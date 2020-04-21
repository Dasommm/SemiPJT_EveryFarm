package com.everyfarm.farmer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.farmer.farm.biz.FarmBiz;
import com.everyfarm.farmer.farm.biz.FarmBizImpl;
import com.everyfarm.farmer.farm.dto.FarmDto;
import com.everyfarm.farmer.fund.dto.PagingDto;
import com.everyfarm.member.dto.MemberDto;


@WebServlet("/supervisefarm.do")
public class FarmDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FarmDetailController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		if(command.equals("farmdetaillist")) {
			FarmBiz biz = new FarmBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			HttpSession session = request.getSession();
			
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);
			pagingdto.setColumn(6);
			pagingdto.setUnderpagescale(5);
			System.out.println(mem_id+":멤버아이디 farmer뽑혀야함");
			pagingdto.setTotalpage(biz.myFarmListPage(pagingdto.getColumn(), mem_id));
			System.out.println(pagingdto.getTotalpage()+":getTotalpage");
			
			List<FarmDto> list = new ArrayList<FarmDto>();
			list = biz.myFarmList(pagingdto, mem_id);
			session.setAttribute("supervisepaging", pagingdto);
			session.setAttribute("supervisefarmlist", list);
			
			response.sendRedirect("farmerpage/supervisefarm.jsp");
		} else if(command.equals("choosefarm")) {
			FarmBiz biz = new FarmBizImpl();
			int wfarm_key = Integer.parseInt(request.getParameter("wfarm_key"));
			//System.out.println("서블릿에 wfarmkey 들어옴 : "+ wfarm_key);
			HttpSession session = request.getSession();
			
			List<FarmDto> list = new ArrayList<FarmDto>();
			list = biz.sendFarmDetail(wfarm_key);
			session.setAttribute("sendfarmdetail", list);
			
			response.sendRedirect("farmerpage/sendfarmdetail.jsp");
		} else if(command.equals("registform")) {
			response.sendRedirect("farmerpage/registfarm.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}

}
