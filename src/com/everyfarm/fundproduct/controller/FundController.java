package com.everyfarm.fundproduct.controller;

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

import com.everyfarm.fundproduct.biz.FundBiz;
import com.everyfarm.fundproduct.biz.FundBizImpl;
import com.everyfarm.fundproduct.dto.FundDto;
import com.everyfarm.fundproduct.dto.FundPagingDto;
import com.everyfarm.fundproduct.dto.FundPayDto;
import com.everyfarm.member.dto.MemberDto;


@WebServlet("/fund.do")
public class FundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FundController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		FundBiz biz = new FundBizImpl();
		HttpSession session = request.getSession();
		
		if(command.equals("fundlist")) { 
			//페이징
			int currentpage = Integer.parseInt(request.getParameter("page"));	//header에서 받아온 값
			
			FundPagingDto fundPaging = new FundPagingDto();
			fundPaging.setCurrentpage(currentpage);	//현재페이지
			fundPaging.setTotalrows(16); 		//페이지당 16개씩 출력
			fundPaging.setPagescale(5); 		//5개의 페이지씩 출력
			fundPaging.setTotalpage(biz.totalpage(fundPaging.getTotalrows())); 	// 2를 받아옴
			//리스트
			List<FundDto> allList = biz.fundAllList(fundPaging);	//위의 값을 담은 dto를 biz로
			
			session.setAttribute("allList", allList);	//받은 list를 allList로 jsp로 보내줌
			session.setAttribute("fundPaging", fundPaging);	//위의 fundPaging을  jsp로 보내줌
			
			List<FundDto> fundBestList = new ArrayList<FundDto>();
			fundBestList = biz.fundBestList();
			session.setAttribute("fundBestList", fundBestList);	//받은 list를 bestList로 jsp보내줌
			System.out.println(fundBestList.size());
			System.out.println(allList.size());
			response.sendRedirect("fund/fundlist.jsp");
			
		}if(command.equals("fundDetail")) {
			int stock_no = Integer.parseInt(request.getParameter("stock_no"));
			System.out.println("상품번호:"+stock_no);
			FundDto detailDto = new FundDto();			
			detailDto = biz.fundDetail(stock_no);	
		
			session.setAttribute("detailDto", detailDto); //stock, fund 정보 담음
			response.sendRedirect("fund/fundDetail.jsp");
			
		}else if(command.equals("fundPay")) {
			System.out.println("결제 들어옴");
			if(session.getAttribute("dto")==null) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 후 이용 가능합니다')");
				out.println("location.href='login/loginform.jsp'");
				out.println("</script>");
			}else{
				System.out.println("else들어옴");
				//상품 번호와 아이디, 결제 금액 받아온다
				int stock_no = Integer.parseInt(request.getParameter("stock_no"));
				int fund_no = Integer.parseInt(request.getParameter("fund_no"));
				System.out.println("상품번호 :"+stock_no);
				System.out.println("펀드번호  :"+fund_no);
				
				MemberDto dto = (MemberDto)session.getAttribute("dto");
				String mem_id = dto.getMem_id();
				System.out.println("아이디 : "+mem_id);
				
				int pay_price = Integer.parseInt(request.getParameter("pay_price"));
				System.out.println("주문금액 :"+pay_price);
				
				//주문테이블과 주문상세 테이블에 데이터 insert
				FundPayDto fundPayDto = biz.orderInput(stock_no, mem_id, pay_price, fund_no);

				//fundpay에 memeber, stock테이블, kg, 금액을 보내야한다 
				session.setAttribute("fundPayDto", fundPayDto);
				response.sendRedirect("fund/fundPay.jsp");						
				}	
			
		}else if(command.equals("paySuccess")) {
				//결제 완료되면 주문번호(FK), 결제금액을 pay 테이블에 insert
				FundPayDto payRes = (FundPayDto)session.getAttribute("fundPayDto");
				int pay_price = payRes.getPay_price();
				String mem_id = payRes.getMem_id();
				int order_no = payRes.getOrder_no();
				FundDto detailDto = (FundDto)session.getAttribute("detailDto");
				int fund_no = detailDto.getFund_no();
				int inputSuccess = biz.payInput(order_no, pay_price, fund_no, mem_id);
				//결재완료 후 pay table에 데이터 input, orderinfo table 구매완료로 업데이트
				
				//fund table 참여인원 update, memjoin table 
				
				System.out.println("페이 성공");
				if(inputSuccess>2) {
					response.sendRedirect("fund.do?command=fundlist&page=1");
				}else {
					System.out.println("insert실패");
				}

			}else if(command.equals("fundFinish")) {	//종료
				int currentpage = Integer.parseInt(request.getParameter("page"));

				FundPagingDto finishPaging = new FundPagingDto();
				finishPaging.setCurrentpage(currentpage);	//현재페이지
				finishPaging.setTotalrows(16); 		//페이지당 16개씩 출력
				finishPaging.setPagescale(5); 		//5개의 페이지씩 출력
				finishPaging.setTotalpage(biz.finish_totalpage(finishPaging.getTotalrows())); 	
				//리스트
				List<FundDto> finishList = biz.finishList(finishPaging);	//위의 값을 담은 dto를 biz로
				
				session.setAttribute("finishList", finishList);	//받은 list를 allList로 jsp로 보내줌
				session.setAttribute("finishPaging", finishPaging);	//위의 fundPaging을  jsp로 보내줌
				
				List<FundDto> fundBestList = new ArrayList<FundDto>();
				fundBestList = biz.fundBestList();
				session.setAttribute("fundBestList", fundBestList);	//받은 list를 bestList로 jsp보내줌
				System.out.println("컨트롤러"+fundBestList.size());
				System.out.println("컨트롤러 리스트"+finishList.size());
				response.sendRedirect("fund/fundListFinish.jsp");
				
			}
		}
		
	
	
	private void dispatcher(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		FundBiz biz = new FundBizImpl();
		HttpSession session = request.getSession();
		
		if(command.equals("deadLineFund")) {
			int fund_no = Integer.parseInt(request.getParameter("fund_no"));
			FundDto deadDto = biz.deadLineAjax(fund_no);
			System.out.println("ajax...");
			session.setAttribute("deadLineAjax", deadDto);
			
			response.sendRedirect("fund/fundDeadLineAjax.jsp");
			
		}else if(command.equals("fundJoinNum")) {
			int fund_no = Integer.parseInt(request.getParameter("fund_no"));
			FundDto fundJoin = biz.fundJoinAjax(fund_no);
			
			session.setAttribute("fundJoinAjax", fundJoin);
			response.sendRedirect("fund/fundJoinAjax.jsp");
		
		}else if(command.equals("fundPriceUpdate")) {
			int fund_no = Integer.parseInt(request.getParameter("fund_no"));
			FundDto priceUpdate = biz.priceUpdate(fund_no);
			
			session.setAttribute("fundPriceAjax", priceUpdate);
			response.sendRedirect("fund/fundPriceAjax.jsp");
		}else if(command.equals("fundJoinName")) {
			int fund_no = Integer.parseInt(request.getParameter("fund_no"));
			List<FundDto> joinMemName = biz.joinMemName(fund_no);
			
			session.setAttribute("joinMemName", joinMemName);
			response.sendRedirect("fund/fundJoinNameAjax.jsp");
		}
		
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
