package com.everyfarm.eventboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.eventboard.biz.EventBoardBiz;
import com.everyfarm.eventboard.biz.EventBoardBizImpl;
import com.everyfarm.eventboard.dto.EventBoardDto;
import com.everyfarm.eventboard.dto.EventPagingDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/eventboard.do")
public class EventBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String savePath = "C:\\git_branchTwo\\EveryFarm\\EveryFarm\\WebContent\\resources\\images\\eventstorage";
	
    public EventBoardController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("eventboardlist")) {
			
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			System.out.println(currentpage+"::이벤트 currentpage");
			EventBoardBiz biz= new EventBoardBizImpl();
			EventBoardDto dto = new EventBoardDto();
			EventPagingDto pagingdto = new EventPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(5);   //게시글은 5개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn()));  //마지막 페이지 번호     (1)
			List<EventBoardDto>list = new ArrayList<EventBoardDto>();
			
			list = biz.eventlist(pagingdto);
			System.out.println(list.size()+"::이벤트 컨트로러 리스트사이즈");
			HttpSession session = request.getSession();
			session.setAttribute("eventpagingdto", pagingdto);
			session.setAttribute("eventlist", list);
			
			response.sendRedirect("eventboard/eventboardlist.jsp");
		
		}else if(command.equals("writeboard")) {
			response.sendRedirect("eventboard/eventwrite.jsp");
		}else if(command.equals("eventdetail")) {
			int eve_seq = Integer.parseInt(request.getParameter("eve_seq"));
			System.out.println(eve_seq+"::들어왓따");
			EventBoardBiz biz= new EventBoardBizImpl();
			EventBoardDto dto = new EventBoardDto();
			
			dto = biz.eventdetail(eve_seq);
			//조회수 업데이트
			int res = 0;
			dto.setEve_seq(eve_seq);
			dto.setEve_count(dto.getEve_count()+1);
			res = biz.updatecount(dto);
			
			if(res > 0) {
				System.out.println("업데이트 성공");
			}else {
				System.out.println("업데이트 실패");
			}
			////////////
			HttpSession session = request.getSession();
			session.setAttribute("eventdetaillist", dto);
			
			response.sendRedirect("eventboard/eventdetail.jsp");
		}else if(command.equals("multidelete")) {
			String[] seqs = request.getParameterValues("chkVal");
			//System.out.println(Arrays.toString(seqs)+"::체크된 값");
			//System.out.println(seqs[1]);
			EventBoardBiz biz = new EventBoardBizImpl();
			int res = biz.multidelete(seqs);
			
			if(res > 0) {
				jsResponse("선택된 글이 삭제되었습니다", "eventboard.do?command=eventboardlist&currentpage=1", response);
			}else {
				jsResponse("글삭제를 실패하였습니다.", "eventboard.do?command=eventboardlist&currentpage=1", response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MultipartRequest multi = new MultipartRequest(
				request, savePath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		
		String command = multi.getParameter("command");
		
		if(command.equals("eventwriteres")) {
			
			String writer = multi.getParameter("writer");
			String title = multi.getParameter("title");
			String image01 = "resources\\images\\eventstorage\\" + multi.getFilesystemName("image01")+"/";
			String image02 = "resources\\images\\eventstorage\\" + multi.getFilesystemName("image02")+"/";
			String image03 = "resources\\images\\eventstorage\\" + multi.getFilesystemName("image03")+"/";
			String eve_content = multi.getParameter("content01")+"/"+
								multi.getParameter("content02")+"/"+
								multi.getParameter("content03");
			String eve_zonecode = multi.getParameter("eve_zonecode");
			String eve_addr = multi.getParameter("eve_addr");
			String eve_addretc = multi.getParameter("eve_addretc");
			
			System.out.println(writer);
			
			EventBoardDto dto = new EventBoardDto();
			EventBoardBiz biz = new EventBoardBizImpl();
			dto.setEve_writer(writer);
			dto.setEve_title(title);
			dto.setEve_img(image01+image02+image03);
			dto.setEve_content(eve_content);
			dto.setEve_addr(eve_zonecode+" "+eve_addr+" "+eve_addretc);
			
			int res = biz.insertboard(dto);
			
			if(res > 0) {
				System.out.println("인서트 성공");
				jsResponse("이벤트 게시글이 등록되었습니다.", "eventboard.do?command=eventboardlist&currentpage=1", response);
				
			}else{
				jsResponse("이벤트 게시글 등록을 실패하였습니다.", "eventboard/eventwrite.jsp", response);
			}
		
		}
		
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
