package com.everyfarm.memberMyPage.controller;

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

import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.memberMyPage.biz.MemberMyPageBiz;
import com.everyfarm.memberMyPage.biz.MemberMyPageBizImpl;
import com.everyfarm.memberMyPage.dao.MemberMyPageDao;
import com.everyfarm.memberMyPage.dao.MemberMyPageDaoImpl;
import com.everyfarm.memberMyPage.dto.MyFarmListDto;
import com.everyfarm.memberMyPage.dto.MyPaymentDto;
import com.everyfarm.memberMyPage.dto.MyPurchaseListDto;
import com.everyfarm.memberMyPage.dto.PagingDto;

@WebServlet("/memberMyPage.do")
public class memberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public memberMyPageController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		MemberMyPageDao dao = new MemberMyPageDaoImpl();
		MemberMyPageBiz biz = new MemberMyPageBizImpl();
		HttpSession session = request.getSession();
		
		if(command.equals("mypage")) {	//마이페이지
			String mem_id = request.getParameter("mem_id");
			List<MyFarmListDto> farmlist = new ArrayList<MyFarmListDto>();
			farmlist = dao.selectMyFarmList(mem_id);
			List<MyPurchaseListDto> fundlist = new ArrayList<MyPurchaseListDto>();
			fundlist = dao.selectMyFundList(mem_id);
			List<MyPurchaseListDto> auctionlist = new ArrayList<MyPurchaseListDto>();
			auctionlist = dao.selectMyAuctionList(mem_id);
			session = request.getSession();
			session.setAttribute("myfarmlist", farmlist);
			session.setAttribute("myfundlist", fundlist);
			session.setAttribute("myauctionlist", auctionlist);
			response.sendRedirect("memberMyPage/membermypage.jsp");
			
			
		} else if(command.equals("myinfo")) {	//내정보 조회
			String mem_id = request.getParameter("mem_id");
			MemberDto dto = dao.selectMyInfo(mem_id);
			request.setAttribute("dto", dto);
			response.sendRedirect("memberMyPage/myinformation.jsp");
			
		} else if(command.equals("myinfoupdate")) {		//내정보 수정
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			String mem_phone = request.getParameter("mem_phone");
			String mem_email = request.getParameter("mem_email");
			String mem_zonecode = request.getParameter("mem_zonecode");
			String mem_addr = request.getParameter("mem_addr");
			String mem_addretc = request.getParameter("mem_addretc");
			MemberDto dto = new MemberDto(mem_id, mem_pw, "", mem_phone, mem_zonecode, mem_addr, 
					                      mem_addretc, mem_email, 0, "0", "");
			int res = dao.updateMyInfo(dto);
			if(res>0) {
				jsResponse("회원정보가 수정되었습니다", "memberMyPage/myinformation.jsp", response);
			} else {
				jsResponse("회원정보 수정에 실패하였습니다", "memberMyPage/myinformation.jsp", response);
			}
			
		} else if(command.equals("memberdelete")) {		//회원탈퇴 페이지 이동
			response.sendRedirect("memberMyPage/memberdelete.jsp");
			
		} else if(command.equals("memberdeleteres")) {	//회원탈퇴 결과
			String mem_id = request.getParameter("mem_id");
			int res = dao.memberDelete(mem_id);
			if(res>0) {
				session = request.getSession();
				session.invalidate();
				jsResponse("탈퇴되었습니다", "home/section.jsp", response);
			} else {
				jsResponse("탈퇴에 실패하였습니다", "memberMyPage/membermypage.jsp", response);
			}
		} else if(command.equals("grade")) {	//내 등급조회
			String mem_id = request.getParameter("mem_id");
			MemberDto dto = dao.selectGrade(mem_id);
			session = request.getSession();
			session.setAttribute("mem", dto);
			response.sendRedirect("memberMyPage/gradeup.jsp");
			
		} else if(command.equals("gradeup")) {		//농부로 등업신청
			String mem_id = request.getParameter("mem_id");
			int res = dao.applyGradeUp(mem_id);
			if(res>0) {
				jsResponse("신청되었습니다", "memberMyPage/gradeup.jsp", response);
			} else {
				jsResponse("신청 실패하였습니다", "memberMyPage/gradeup.jsp", response);
			}
			
		} else if(command.equals("myfundlist")) {	//내 펀드내역 조회
			
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			String mem_id = request.getParameter("mem_id");
	         System.out.println(currentpage+"커랜트 페이지");
	         PagingDto pagingdto = new PagingDto();
	         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
	         pagingdto.setColumn(10);   //게시글은 10개씩
	         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
	         pagingdto.setTotalpage(dao.fundTotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호     (1)
	         
			
			List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
			list = biz.pagingMyFundList(pagingdto, mem_id);
			session = request.getSession();
			session.setAttribute("myfundlist", list);
			session.setAttribute("pagingdto", pagingdto);
			
			response.sendRedirect("memberMyPage/myfundlist.jsp");
			
		} else if(command.equals("myweekendfarmlist")) {	//나의 주말농장 조회
			String mem_id = request.getParameter("mem_id");
			List<MyFarmListDto> list = new ArrayList<MyFarmListDto>();
			list = dao.selectMyFarmList(mem_id);
			 session = request.getSession();
			session.setAttribute("myfarmlist", list);
			response.sendRedirect("memberMyPage/myweekendfarmlist.jsp");
		
		} else if(command.equals("myauctionlist")) {	//내 경매내역 조회
			 
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			String mem_id = request.getParameter("mem_id");
	         System.out.println(currentpage+"커랜트 페이지");
	         PagingDto pagingdto = new PagingDto();
	         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
	         pagingdto.setColumn(10);   //게시글은 10개씩
	         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
	         pagingdto.setTotalpage(dao.auctionTotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호
	         
			List<MyPurchaseListDto> list = new ArrayList<MyPurchaseListDto>();
			list = biz.pagingMyAuctionList(pagingdto, mem_id);
			session = request.getSession();
			session.setAttribute("myauctionlist", list);
			session.setAttribute("pagingdto", pagingdto);
			response.sendRedirect("memberMyPage/myauctionlist.jsp");
			
		} else if(command.equals("refund")) {	//펀드 취소하기
			int order_no = Integer.parseInt(request.getParameter("order_no"));
			int res = dao.refund(order_no);
			if(res>0) {
				jsResponse("취소요청이 완료되었습니다", "memberMyPage/myfundlist.jsp", response);
			} else {
				jsResponse("취소요청에 실패하였습니다", "memberMyPage/myfundlist.jsp", response);
			}
		
		} else if(command.equals("mypayment")) {	//내 결제/배송내역 조회
			
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			String mem_id = request.getParameter("mem_id");
	         System.out.println(currentpage+"커랜트 페이지");
	         PagingDto pagingdto = new PagingDto();
	         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
	         pagingdto.setColumn(10);   //게시글은 10개씩
	         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
	         pagingdto.setTotalpage(dao.auctionTotalPage(pagingdto.getColumn(),mem_id));  //마지막 페이지 번호
	         
			List<MyPaymentDto> list = new ArrayList<MyPaymentDto>();
			list = biz.pagingMyPaymentList(pagingdto, mem_id);
			session = request.getSession();
			session.setAttribute("mypaymentlist", list);
			session.setAttribute("pagingdto", pagingdto);
			response.sendRedirect("memberMyPage/mypaymentlist.jsp");
			
		} else if(command.equals("order")) {	//경매 주문페이지
		
			if(session.getAttribute("dto")==null) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 후 이용 가능합니다')");
				out.println("location.href='login/loginform.jsp'");
				out.println("</script>");
			}else{
				String mem_id = request.getParameter("mem_id");
				int stock_no = Integer.parseInt(request.getParameter("stock_no"));
				int stock_kg = Integer.parseInt(request.getParameter("stock_kg"));
				MyPaymentDto stockinfo = dao.orderAuction(stock_no);
				MemberDto myinfo = dao.selectMyInfo(mem_id);
				
				//주문테이블과 주문상세 테이블에 데이터 insert
				MyPaymentDto order_no = dao.orderInput(stock_no, mem_id, stock_kg);
				
				session.setAttribute("myaucdetail", stockinfo);
				session.setAttribute("myinfo", myinfo);
				session.setAttribute("orderNumber", order_no);
				response.sendRedirect("memberMyPage/auctionpay.jsp");
			}
			
		} else if(command.equals("paySuccess")) {	//결제하기
			
			MyPaymentDto payRes = (MyPaymentDto) session.getAttribute("myaucdetail");
			MyPaymentDto payRes2 = (MyPaymentDto) session.getAttribute("orderNumber");
			int order_no = payRes2.getOrder_no();
			int pay_price = payRes.getAuc_nowPrice();
			int stock_kg = payRes.getStock_kg();
			int inputSuccess = dao.payInput(order_no, pay_price, stock_kg);
			
			System.out.println("결제가 완료되었습니다.");
			if(inputSuccess>0) {
				response.sendRedirect("memberMyPage/myauctionlist.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>"
					+"alert('"+msg+"');"
					+ "location.href='"+url+"';"
					+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);
	}
	
}
