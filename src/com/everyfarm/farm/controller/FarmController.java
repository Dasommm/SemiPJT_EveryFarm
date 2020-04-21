package com.everyfarm.farm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.farm.biz.FarmBiz;
import com.everyfarm.farm.biz.FarmBizImpl;
import com.everyfarm.farm.dto.FarmDto;
import com.everyfarm.farm.dto.FarmPagingDto;
import com.everyfarm.member.dto.MemberDto;
import com.everyfarm.product.biz.ProductBiz;
import com.everyfarm.product.biz.ProductBizImpl;
import com.everyfarm.product.dto.PagingDto;
import com.everyfarm.product.dto.ProductDto;


@WebServlet("/farm.do")
public class FarmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FarmController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		FarmBiz biz = new FarmBizImpl();
		
		if(command.equals("farmmain")) {
			System.out.println("주말농장 컨트롤러 들어왓따");
			response.sendRedirect("farm/farmmain.jsp");
			
		}else if(command.equals("farmlist")) {      //주말농장 리스트
			//파람url href="../farm.do?command=farmlist&paramFarmList=<%=farmlist %>&currentpage=<%=pagenum %>"
			
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			FarmPagingDto pagingdto = new FarmPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(16);   //게시글은 16개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn()));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			List<FarmDto>farmlist = new ArrayList<FarmDto>();
			
			farmlist = biz.farmlist(pagingdto);
			
			HttpSession session = request.getSession();
			session.setAttribute("listGubun", "farmlist"); //By추가
			session.setAttribute("farmpagingdto", pagingdto);
			session.setAttribute("farmlist", farmlist);
			
			response.sendRedirect("farm/farmlist.jsp");
			
		}else if(command.equals("searchArea")) {
			String paramtype = request.getParameter("paramtype"); //입력받은 지역명
System.out.println(paramtype+"::컨트롤러 입력된 지역명");
			FarmDto dto = new FarmDto();
			dto.setWfarm_addr(paramtype);  //이걸로 지역 불러올거
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			FarmPagingDto pagingdto = new FarmPagingDto();
			pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
			pagingdto.setColumn(16);   //게시글은 16개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			pagingdto.setTotalpage(biz.searchAreatotalPage(pagingdto.getColumn(),paramtype));  //마지막 페이지 번호     (1)
			System.out.println(pagingdto.getTotalpage()+"::getTotalpage");
			List<FarmDto>farmlist = new ArrayList<FarmDto>();
			
			farmlist = biz.searchlist(pagingdto,dto);
			
			System.out.println(pagingdto.getTotalpage()+"::토탈페이지");
			HttpSession session = request.getSession();	
			
			session.setAttribute("listGubun", "searchArea");//by추가
			session.setAttribute("backParamtype",paramtype); //BY추가
			
			session.setAttribute("farmpagingdto", pagingdto);
			session.setAttribute("farmlist", farmlist);
			response.sendRedirect("farm/farmlist.jsp");
			
		}else if(command.equals("farmdetail")) {
			int wfarm_key = Integer.parseInt(request.getParameter("wfarm_key"));
			System.out.println("wfarm_key::"+wfarm_key);
			
			FarmDto farmdto = biz.farmdetail(wfarm_key);
			//////////////////////////////////////////////
			
			//////////////////////////////////////////////
			HttpSession session = request.getSession();
			session.setAttribute("farmdto", farmdto);
			response.sendRedirect("farm/farmdetail.jsp");
		}else if(command.equals("insertRentFarm")) {  //결제 후 디비에 insert 함수
			String mem_id = request.getParameter("mem_id");
			int wfarm_key = Integer.parseInt(request.getParameter("wfarm_key"));
			String mf_area = request.getParameter("mf_area");  //배열객체(String->int예정)
			
			System.out.println("***일단 결제후 데이터 잘 넘어왔다***");
			System.out.println(mem_id+"::회원아이디");
			System.out.println(wfarm_key+"::주말농장 PK");
			System.out.println(mf_area+":: 임대받은 땅 위치(배열객체)");
			
			String[] splitarray = mf_area.split(",");
			int array = 0;
			int res = 0;
			
			for(int i = 0 ; i < splitarray.length; i++) {    //선택된 땅의 length만큼 반복
				array = Integer.parseInt(splitarray[i]);
				 res += biz.insertSelectedFarm(mem_id,wfarm_key,array);
				System.out.println("if문 위에 res::"+res);
				
				if(res < splitarray.length+1) {
					System.out.println("인서트 성공::"+splitarray[i]);
				}else {
					System.out.println("인서트 실패::"+splitarray[i]);
				}
			}
			if(res==splitarray.length) {
				//MEMFARM테이블에 인서트 성공 시 (총 평수,땅위치 총Cnt select후)만약 Cnt가 같으면 status변경 
				int wfarm_totalArea = biz.selectTotalSize(wfarm_key);
				System.out.println(wfarm_totalArea+"::결제 후 총평수 뽑혔따");
				int selectedCnt = biz.alreadySelectedCnt(wfarm_key);
				System.out.println(selectedCnt+"::이미 결제된 땅위치의 총 카운트");
				
				if(wfarm_totalArea==selectedCnt) {  //총평수==해당 PK의 땅위치갯수 -> status변경
					String wfarm_status = "3";
					int updateres = biz.updateStatus(wfarm_status,wfarm_key);
					if(updateres > 0) {
						jsResponse("마지막으로 땅을 빌리셨습니다.", "farm.do?command=farmlist&currentpage=1", response);
					}else {
						jsResponse("(오류)고객센터로 문의주십시오.", "farm.do?command=farmlist&currentpage=1", response);
					}
				}else {  //같지 않다면
					jsResponse("홈페이지로 이동합니다.", "farm/farmdetail.jsp" , response);
				}
			}else {
				jsResponse("(오류)고객센터로 문의 주십시오.", "farm/farmdetail.jsp" , response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("buyrentfarm")) {  //주말농장 결제영역
			System.out.println("주말농장 결제영역 들어왔다");
			FarmBiz biz = new FarmBizImpl();
			String mem_id = request.getParameter("mem_id");
			int wfarm_key = Integer.parseInt(request.getParameter("wfarm_key"));
			String mf_area = request.getParameter("mf_area"); //배열객체(String->int예정)
			int totalprice = Integer.parseInt(request.getParameter("totalprice"));
			String wfarm_image = request.getParameter("wfarm_image");
			String wfarm_title = request.getParameter("wfarm_title");
			int wfarm_price = Integer.parseInt(request.getParameter("wfarm_price"));
			int selectedCnt = Integer.parseInt(request.getParameter("selectedCnt"));
			
			System.out.println(mem_id+"::회원아이디************");
			System.out.println(wfarm_key+"::주말농장키*************");
			System.out.println(mf_area+"::분양받은 위치**************");
			System.out.println(totalprice+"::총 금액");
			FarmDto farmdto = new FarmDto();
			
			farmdto = biz.selectMemInfo(mem_id);			
			
			farmdto.setWfarm_key(wfarm_key);
			farmdto.setMf_area(mf_area);
			farmdto.setTotalprice(totalprice);
			farmdto.setWfarm_image(wfarm_image);
			farmdto.setWfarm_title(wfarm_title);
			farmdto.setSelectedCnt(selectedCnt);
			farmdto.setWfarm_price(wfarm_price);
			
			System.out.println(wfarm_image+"::썸네일 이미지");
			System.out.println(wfarm_title+"::농장 타이틀");
			System.out.println(selectedCnt+"::선택된 땅의 수");
			HttpSession session = request.getSession();
			session.setAttribute("farmMemInfo", farmdto);
			
			jsResponse("결제 페이지로 이동합니다.", "farm/farmpay.jsp", response);
		
			
	
			
		}else if(command.equals("sendmessage")) {      //쪽지보내기
	    	  String letter_sender = request.getParameter("letter_sender");
	    	  String mem_id = request.getParameter("mem_id");
	    	  String letter_title = request.getParameter("letter_title");
	    	  String letter_content = request.getParameter("letter_content");
	    	  FarmDto letterdto = new FarmDto();
	    	  FarmBiz biz = new FarmBizImpl();
	    	  
	    	  System.out.println(letter_sender+"::컨트롤러의 발신자");
	    	  System.out.println(mem_id+"::컨트롤러의 수신자");
	    	  
	    	  letterdto.setLetter_sender(letter_sender);
	    	  letterdto.setMem_id(mem_id);
	    	  letterdto.setLetter_title(letter_title);
	    	  letterdto.setLetter_content(letter_content);
	    	  
	    	  int res = biz.sendletter(letterdto);
	    	  
	    	  if(res > 0) {
	    		 jsResponse("쪽지가 전송되었습니다.","farm/messageclose.jsp",response);
	    	  }else{
	    		 jsResponse("쪽지전송을 실패하였습니다.","farm/message.jsp",response);
	    	  }
	    	  
	    /********************에이작스영역**********************/	  
	      }else if(command.equals("Farm_selected")) {  
	    	  System.out.println("실시간 에이작스 돌고있다.");
	    	  int wfarm_key = Integer.parseInt(request.getParameter("wfarm_key"));
	    	  FarmBiz biz = new FarmBizImpl();
				System.out.println("wfarm_key::"+wfarm_key);
				
				FarmDto farmdto = biz.farmdetail(wfarm_key);
				
				int sendWfarm_key = farmdto.getWfarm_key();
				List<FarmDto>selectedArea = biz.selectMf_Area(sendWfarm_key);
				
				String readyToSendVal = "";
				  
				  for(int i = 0; i < selectedArea.size(); i++){ //사이즈 만큼 돔 
					 if(i==(selectedArea.size()-1)){
						 readyToSendVal += selectedArea.get(i).getMf_area();
					 }else{
						 readyToSendVal += selectedArea.get(i).getMf_area() +","; 
					 }
				  }
				  
				HttpSession session = request.getSession();
				session.setAttribute("farmdto", farmdto);
				session.setAttribute("selectedArea", readyToSendVal); //이미 선택된 땅 세션저장
				response.sendRedirect("farm/detailajax.jsp");
	      
	      }
		 /********************에이작스영역**********************/
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
