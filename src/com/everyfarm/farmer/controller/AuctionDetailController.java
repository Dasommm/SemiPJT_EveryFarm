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

import com.everyfarm.farmer.auction.biz.AuctionDetailBiz;
import com.everyfarm.farmer.auction.biz.AuctionDetailBizImpl;
import com.everyfarm.farmer.auction.dto.ADPagingDto;
import com.everyfarm.farmer.auction.dto.AuctionDetailDto;
import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.product.biz.ProductBiz;
import com.everyfarm.product.biz.ProductBizImpl;
import com.everyfarm.product.dto.ProductDto;


@WebServlet("/farmerauctiondetail.do")
public class AuctionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AuctionDetailController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("cur_auclist")) {
			System.out.println("경매진행현황 컨트롤러 들어왔다.");
			AuctionDetailBiz biz = new AuctionDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			//System.out.println(currentpage+"currentpage 들어옴");
			HttpSession session = request.getSession();
			
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			ADPagingDto pagingdto = new ADPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 10개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			System.out.println(mem_id+"::멤버아이디farmer뽑혀야됨");
			pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<AuctionDetailDto>list = new ArrayList<AuctionDetailDto>();
			list = biz.selectAllstatus(pagingdto,mem_id);
			
		
			session.setAttribute("adpagingdto", pagingdto);
			session.setAttribute("auc_curstatus", list);
			
			response.sendRedirect("farmerpage/auction_current.jsp");
			
		}else if(command.equals("notyet")) {
			AuctionDetailBiz biz = new AuctionDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			HttpSession session = request.getSession();
			
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			ADPagingDto pagingdto = new ADPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 16개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			System.out.println(logininfo.getMem_id()+"::멤버아이디farmer뽑혀야됨");
			pagingdto.setTotalpage(biz.notYettotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<AuctionDetailDto>list = new ArrayList<AuctionDetailDto>();
			list = biz.selectNotYetstatus(pagingdto,mem_id);
			
		
			session.setAttribute("adpagingdto", pagingdto);
			session.setAttribute("auc_curstatus", list);
			
			response.sendRedirect("farmerpage/auction_current.jsp");
			
		}else if(command.equals("end_auclist")) {
			System.out.println("낙찰리스트 들어왔다.");
			AuctionDetailBiz biz = new AuctionDetailBizImpl();
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			
			HttpSession session = request.getSession();
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			
			ADPagingDto pagingdto = new ADPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 10개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			int totalpage = biz.endStatustotalPage(pagingdto.getColumn(),mem_id);
			pagingdto.setTotalpage(totalpage);  //마지막 페이지 번호     (1)
			//System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<AuctionDetailDto>list = new ArrayList<AuctionDetailDto>();
			list = biz.selectEndstatus(pagingdto,mem_id);
			
			session.setAttribute("Endtotalpaging", pagingdto);
			session.setAttribute("auc_Endstatus", list);
			
			response.sendRedirect("farmerpage/auction_finish.jsp");
			
		}else if(command.equals("sendproduct")) {
			int auc_no = Integer.parseInt(request.getParameter("auc_no"));
			System.out.println(auc_no+"::auc_no낙찰된거 update할거다");
			
			AuctionDetailBiz biz = new AuctionDetailBizImpl();
			
			int res = biz.updateStatus(auc_no);
			
			if(res > 0) {
				jsResponse("상품을 배송완료 하였습니다.", "farmerauctiondetail.do?command=end_auclist&currentpage=1", response);
			}else {
				jsResponse("상품을 배송을 실패 하였습니다.", "farmerpage/auction_finish.jsp", response);
			}
			
		}else if(command.equals("send_history")) {   //배송완료내역 조회 함수
			
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			AuctionDetailBiz biz = new AuctionDetailBizImpl();
			
			System.out.println("배송리스트 출력 커맨드 들어왔따.");
			
			HttpSession session = request.getSession();
			MemberDto logininfo = (MemberDto)session.getAttribute("dto");
			String mem_id = logininfo.getMem_id();
			
			ADPagingDto pagingdto = new ADPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(10);   //게시글은 16개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			pagingdto.setTotalpage(biz.sendListtotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			
			List<AuctionDetailDto>list = new ArrayList<AuctionDetailDto>();
			list = biz.selectSendList(pagingdto,mem_id);
			
			session.setAttribute("SendListPaging", pagingdto);
			session.setAttribute("SendListStatus", list);
			
			response.sendRedirect("farmerpage/auction_sendhistory.jsp");
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
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}


}
