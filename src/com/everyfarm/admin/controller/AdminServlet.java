package com.everyfarm.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.admin.dao.AdminAccountDao;
import com.everyfarm.admin.dao.AdminBillListDao;
import com.everyfarm.admin.dao.AdminFundListDao;
import com.everyfarm.admin.dao.AdminWFDao;
import com.everyfarm.admin.dao.AuctionApprovalDao;
import com.everyfarm.admin.dao.UpgradeListDao;
import com.everyfarm.admin.dao.UserListDao;
import com.everyfarm.admin.dto.AdminAccountDto;
import com.everyfarm.admin.dto.AdminBillListDto;
import com.everyfarm.admin.dto.AdminFundListDto;
import com.everyfarm.admin.dto.AdminWFDto;
import com.everyfarm.admin.dto.AuctionApprovalDto;
import com.everyfarm.admin.dto.PagingDto;
import com.everyfarm.admin.dto.UpgradeListDto;
import com.everyfarm.admin.dto.UserListDto;

@WebServlet("/admin.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static int TOTAL_PAGE_ROW = 10;		// 한 페이지에 보여줄 글 수
	private static int PAGE_BLOCK_SIZE = 10; 	// 한 블록에 표시할 페이지 수

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		UpgradeListDao upgradeListDao = new UpgradeListDao();
		AuctionApprovalDao approvalDao = new AuctionApprovalDao();
		UserListDao userListDao = new UserListDao();
		AdminFundListDao fundListDao = new AdminFundListDao();
		AdminBillListDao billListDao = new AdminBillListDao(); 
		AdminWFDao wfDao = new AdminWFDao();
		AdminAccountDao accountDao = new AdminAccountDao();
		
		//------------- 메인화면 (admin main) -------------------
		if(command.equals("adminmain")) {
			AdminAccountDto accountDto = new AdminAccountDto();
			accountDto.setStock1_count(accountDao.stockKindCount(1));
			accountDto.setStock2_count(accountDao.stockKindCount(2));
			accountDto.setStock3_count(accountDao.stockKindCount(3));
			accountDto.setStock4_count(accountDao.stockKindCount(4));
			accountDto.setStock5_count(accountDao.stockKindCount(5));
			accountDto.setStock6_count(accountDao.stockKindCount(6));

			accountDto.setFundSumCurrentPrice(accountDao.fundSumCurrentPrice());
			accountDto.setAuctionSumCurrentPrice(accountDao.auctionSumCurrentPrice());
			accountDto.setFundCurrentMember(accountDao.fundCurrentMember());
			accountDto.setAuctionCurrentMember(accountDao.auctionCurrentMember());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminaccount_main", accountDto);
			
			List<UserListDto> userlist = userListDao.mainList();
			List<UserListDto> orderlist = billListDao.mainList();
			session.setAttribute("userlist_adminmain", userlist);
			session.setAttribute("orderlist_adminmain", orderlist);
			
			response.sendRedirect("admin/adminmain.jsp");
		}
		//------------- 등급관리 (upgradelist) -------------------
		else if(command.equals("upgradelist")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = upgradeListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<UpgradeListDto> list = upgradeListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("upgradelist_paging", paging);
			session.setAttribute("upgradelist", list);
			response.sendRedirect("admin/upgradelist.jsp");
		}
		else if(command.equals("upgraderes")) {
			String id = request.getParameter("id");
			int res = upgradeListDao.upgradeRes(id);
			if(res==0) {
				jsResponse("경매 등록 실패", response);
			} 
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = upgradeListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<UpgradeListDto> list = upgradeListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("upgradelist_paging", paging);
			session.setAttribute("upgradelist", list);
			response.sendRedirect("admin/upgradelist.jsp");
		}
		//------------- 경매관리 (auction approval) -------------------
		else if(command.equals("auctionapproval")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = approvalDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AuctionApprovalDto> list = approvalDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("approvallist_paging", paging);
			session.setAttribute("approvallist", list);
			response.sendRedirect("admin/auctionapproval.jsp");
		}
		else if(command.equals("approvalres")) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
			int res = approvalDao.approvalRes(no);
			if(res==0) {
				jsResponse("경매 등록 실패", response);
			} 
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = approvalDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AuctionApprovalDto> list = approvalDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("approvallist_paging", paging);
			session.setAttribute("approvallist", list);
			response.sendRedirect("admin/auctionapproval.jsp");

		}
		//------------- 실시간 현황 (realtimelist)-------------------
		else if(command.equals("realtimeauction")) {
			List<AuctionApprovalDto> list = approvalDao.selectList();
			
			HttpSession session =request.getSession();
			session.setAttribute("adminrealtime", list);
			response.sendRedirect("admin/realtimeauction.jsp");
		}
		//------------- 회원관리 (userlist) -------------------
		else if(command.equals("userlist")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = userListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<UserListDto> list = userListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("userlist_paging", paging);
			session.setAttribute("userlist_admin", list);
			response.sendRedirect("admin/userlist.jsp");
		}
		//------------- 펀드관리 (admin fund list) -------------------
		else if(command.equals("adminfundlist")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = fundListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminFundListDto> list = fundListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminfundlist_paging", paging);
			session.setAttribute("adminfundlist", list);
			response.sendRedirect("admin/adminfundlist.jsp");
		}
		else if(command.equals("adminfundres")) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
			int res = fundListDao.adminfundres(no);
			System.out.println("펀드 상태 변경: "+res);
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = fundListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminFundListDto> list = fundListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminfundlist_paging", paging);
			session.setAttribute("adminfundlist", list);
			response.sendRedirect("admin/adminfundlist.jsp");

		}
		
		//------------- 주문관리 (admin bill list) -------------------
		else if(command.equals("adminbilllist")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = billListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminBillListDto> list = billListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminbilllist_paging", paging);
			session.setAttribute("adminbilllist", list);
			response.sendRedirect("admin/adminbilllist.jsp");
		}
		else if(command.equals("adminbillres")) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
			int res = billListDao.adminbillres(no);
			System.out.println("주문 승인 완료 "+res);
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = fundListDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminBillListDto> list = billListDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminbilllist_paging", paging);
			session.setAttribute("adminbilllist", list);
			response.sendRedirect("admin/adminbilllist.jsp");
		}
		//------------- 농장관리 (admin wf) -------------------
		else if(command.equals("adminwf")) {
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = wfDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminWFDto> list = wfDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminwf_paging", paging);
			session.setAttribute("adminwf", list);
			response.sendRedirect("admin/adminwf.jsp");
		}
		else if(command.equals("adminwfres")) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
			int res = wfDao.adminwfres(no);
			System.out.println("농장 승인 완료 "+res);
			int currentpage = Integer.parseInt(request.getParameter("pageNumber"));
			PagingDto paging = null;
			int totalpage = wfDao.totalPage(TOTAL_PAGE_ROW);
			paging = pagingMethod(currentpage, totalpage);
			List<AdminWFDto> list = wfDao.selectList(paging.getFrom(), paging.getTo());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminwf_paging", paging);
			session.setAttribute("adminwf", list);
			response.sendRedirect("admin/adminwf.jsp");
		}
		//------------- 정산 (admin account) -------------------
		else if(command.equals("adminaccount")) {
			AdminAccountDto accountDto = new AdminAccountDto();
			accountDto.setStock1_count(accountDao.stockKindCount(1));
			accountDto.setStock2_count(accountDao.stockKindCount(2));
			accountDto.setStock3_count(accountDao.stockKindCount(3));
			accountDto.setStock4_count(accountDao.stockKindCount(4));
			accountDto.setStock5_count(accountDao.stockKindCount(5));
			accountDto.setStock6_count(accountDao.stockKindCount(6));

			accountDto.setFundSumCurrentPrice(accountDao.fundSumCurrentPrice());
			accountDto.setAuctionSumCurrentPrice(accountDao.auctionSumCurrentPrice());
			accountDto.setFundCurrentMember(accountDao.fundCurrentMember());
			accountDto.setAuctionCurrentMember(accountDao.auctionCurrentMember());
			
			HttpSession session =request.getSession();
			session.setAttribute("adminaccount", accountDto);
			response.sendRedirect("admin/adminaccount.jsp");
		}

		
	}
	
	private PagingDto pagingMethod(int currentpage, int totalpage) {
		PagingDto paging = new PagingDto();
		paging.setCurrentpage(currentpage);
		paging.setTotalrows(TOTAL_PAGE_ROW);
		paging.setPagescale(PAGE_BLOCK_SIZE);	
		paging.setTotalpage(totalpage);
		paging.setFrom(paging.getTotalrows() * (currentpage-1) +1);
		paging.setTo(paging.getTotalrows() * currentpage);
		return paging;
	}

	private void jsResponse(String msg, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("</script>");
	}	

}
