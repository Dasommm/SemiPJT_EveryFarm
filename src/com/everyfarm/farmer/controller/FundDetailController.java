package com.everyfarm.farmer.controller;

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

import com.everyfarm.farmer.fund.biz.FundDetailBiz;
import com.everyfarm.farmer.fund.biz.FundDetailBizImpl;
import com.everyfarm.farmer.fund.dto.FundDetailDto;
import com.everyfarm.farmer.fund.dto.PagingDto;
import com.everyfarm.farmer.mypage.biz.FarmerMainBiz;
import com.everyfarm.farmer.mypage.biz.FarmerMainBizImpl;
import com.everyfarm.farmer.mypage.dto.FarmerMainDto;
import com.everyfarm.member.dto.MemberDto;


@WebServlet("/farmerfunddetail.do")
public class FundDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
    public FundDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("goFarmerMyPage")) {
			FarmerMainBiz biz = new FarmerMainBizImpl();
			List<FarmerMainDto> farmlist = new ArrayList<FarmerMainDto>();
			List<FarmerMainDto> recentorder = new ArrayList<FarmerMainDto>();
			List<FarmerMainDto> recentrefund = new ArrayList<FarmerMainDto>();
			HttpSession session = request.getSession();
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			
			FarmerMainDto dto = new FarmerMainDto();
			dto.setRunningfund(biz.runningFund(mem_id));
			dto.setStandbyfund(biz.standbyFund(mem_id));
			dto.setRunningauc(biz.runningAuc(mem_id));
			dto.setStandbyauc(biz.standbyAuc(mem_id));
			farmlist = biz.applyList(mem_id);
			recentorder = biz.recentOrderList(mem_id);
			recentrefund = biz.recentRefundList(mem_id);
			
			session.setAttribute("farmapplylist", farmlist);
			session.setAttribute("recentorderlist", recentorder);
			session.setAttribute("recentrefund", recentrefund);
			session.setAttribute("runstandby", dto);
			
			response.sendRedirect("farmerpage/farmermain.jsp");
			
			
		} else if(command.equals("cur_fundlist")) {
			System.out.println("펀드진행현황 컨트롤러 들어옴!");
			FundDetailBiz biz = new FundDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			System.out.println("currentpage : " + currentpage +"들어옴!");
			HttpSession session = request.getSession();
			
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);
			pagingdto.setColumn(10);
			pagingdto.setUnderpagescale(5);
			System.out.println(mem_id+":멤버아이디");
			pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn(), mem_id));
			System.out.println(pagingdto.getTotalpage()+":getTotalpage");
			
			List<FundDetailDto> list = new ArrayList<FundDetailDto>();
			list = biz.selectAllstatus(pagingdto, mem_id);
			
			session.setAttribute("fundpagingdto", pagingdto);
			session.setAttribute("fund_curstatus", list);
			
			response.sendRedirect("farmerpage/fund_current.jsp");
			
		} else if(command.equals("notyet")) {
			FundDetailBiz biz = new FundDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			HttpSession session = request.getSession();
			
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 16개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			System.out.println(logininfo.getMem_id()+"::멤버아이디farmer뽑혀야됨");
			pagingdto.setTotalpage(biz.notYetTotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<FundDetailDto>list = new ArrayList<FundDetailDto>();
			list = biz.selectNotYetStatus(pagingdto,mem_id);
			
		
			session.setAttribute("fundpagingdto", pagingdto);
			session.setAttribute("fund_curstatus", list);
			
			response.sendRedirect("farmerpage/fund_current.jsp");
		} else if(command.equals("end_fundlist")) {
			System.out.println("펀드종료 리스트 들어왔다.");
			FundDetailBiz biz = new FundDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			
			HttpSession session = request.getSession();
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 10개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			int totalpage = biz.endStatustotalPage(pagingdto.getColumn(),mem_id);
			pagingdto.setTotalpage(totalpage);  //마지막 페이지 번호     (1)
			//System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<FundDetailDto>list = new ArrayList<FundDetailDto>();
			list = biz.selectEndstatus(pagingdto,mem_id);
			
			session.setAttribute("Endtotalpaging", pagingdto);
			session.setAttribute("fund_Endstatus", list);
			
			response.sendRedirect("farmerpage/fund_finish.jsp");
		} else if(command.equals("sendproduct")) {
			System.out.println("배송하기 controller들어옴");
			FundDetailBiz biz = new FundDetailBizImpl();
			int fund_no = Integer.parseInt(request.getParameter("fund_no"));
			
			HttpSession session = request.getSession();
			
		} else if(command.equals("fundrefundlist")) {
			System.out.println("펀드환불리스트 controller 들어옴");
			FundDetailBiz biz = new FundDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			
			HttpSession session = request.getSession();
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			System.out.println(mem_id);
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 10개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			int totalpage = biz.refundPage(pagingdto.getColumn(),mem_id);
			pagingdto.setTotalpage(totalpage);  //마지막 페이지 번호     (1)
			//System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<FundDetailDto>list = new ArrayList<FundDetailDto>();
			list = biz.selectRefund(pagingdto,mem_id);
			
			session.setAttribute("fundrefundpaging", pagingdto);
			session.setAttribute("fundrefundlist", list);
			
			response.sendRedirect("farmerpage/fund_refund.jsp");
			
		} else if(command.equals("acceptrefund")) {
			System.out.println("펀드 환불 요청 수락 controller 들어옴!");
			int order_no = Integer.parseInt(request.getParameter("order_no"));
			System.out.println(order_no + ": order_no");
			FundDetailBiz biz = new FundDetailBizImpl();
			
			HttpSession session = request.getSession();
			
			int res = biz.acceptrefund(order_no);
			
			if(res>0) {
				jsResponse("환불 요청이 수락되었습니다", "farmerfunddetail.do?command=fundrefundlist&currentpage=1", response);
			} else {
				jsResponse("환불 요청 수락 실패", "farmerfunddetail.do?command=fundrefundlist&currentpage=1", response);
			}
			
		}
		
		
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		
		if(command.equals("applyfund")) {
			System.out.println("controller 들어옴!!");
			response.sendRedirect("farmerpage/registfund.jsp");
		} else if(command.equals("applyfarm")) {
			response.sendRedirect("farmerpage/registfarm.jsp");
		} else if(command.equals("applyauction")) {
			response.sendRedirect("farmerpage/registauction.jsp");
		} 
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}
	
	

}
