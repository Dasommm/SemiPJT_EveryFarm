package com.everyfarm.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.product.biz.ProductBiz;
import com.everyfarm.product.biz.ProductBizImpl;
import com.everyfarm.product.dto.ProductDto;
import com.everyfarm.product.dto.*;


@WebServlet("/product.do")
public class ProductController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public ProductController() {
     
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      ProductBiz biz = new ProductBizImpl();
      String command = request.getParameter("command");
      
      if(command.equals("auction")){    //경매페이지로 이동
         int currentpage = Integer.parseInt(request.getParameter("currentpage"));
         System.out.println(currentpage+"커랜트 페이지");
         PagingDto pagingdto = new PagingDto();
         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
         pagingdto.setColumn(16);   //게시글은 16개씩
         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
         pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn()));  //마지막 페이지 번호     (1)
         
         List<ProductDto>productlist = new ArrayList<ProductDto>(); //일반 경매상품 리스트
         List<ProductDto>bestlist = new ArrayList<ProductDto>(); //best경매상품(4개)
         
         productlist = biz.productlist(pagingdto);    //일반경매리스트
         bestlist = biz.bestlist();        //best경매리스트
         //System.out.println(bestlist.get(2).getStock_image()+"********");
         
         HttpSession session = request.getSession();
         
         session.setAttribute("dto", session.getAttribute("dto"));
         
         session.setAttribute("pagingdto", pagingdto);
         session.setAttribute("productlist", productlist);
         session.setAttribute("bestlist", bestlist);
         session.setAttribute("listGubun", "auction");/////////////////
         session.setAttribute("paramtype", null);
         
         
     	List<ProductDto>normalListTime = new ArrayList<ProductDto>();

       	normalListTime = biz.normalListProduct(pagingdto);
         	
         	//normalListTime.add(normalListDto);
         	
         
         System.out.println(normalListTime+"::리스트로 뽑은 시간들(일반상품)");
         session.setAttribute("normalListTime", normalListTime);
         
         //남은시간 종료되면 status(2)->(3)으로 변경
         int statusUpRes = biz.updateAucStatus();
         	
         //
         if(statusUpRes>0) {
        	 System.out.println("statusUpRes변경됨 "+statusUpRes);
         }else {
        	 System.out.println("statusUpRes변경 실패");
         }
         response.sendRedirect("auction/auctionlist.jsp");
         
      }else if(command.equals("auctiondetail")) {
         System.out.println("ajax타자");
         int auc_no = Integer.parseInt(request.getParameter("auc_no"));
         ProductDto dto = new ProductDto();
      
         ProductDto productdto = biz.bestauctiondetail(auc_no);

         HttpSession session = request.getSession();
         session.setAttribute("productdto", productdto);
         response.sendRedirect("auction/auctiondetail.jsp");
      }
      /*
      else if(command.equals("searchtype")) {   //품목별로 search
      int paramtype = Integer.parseInt(request.getParameter("paramtype"));
      System.out.println(paramtype+"::써치타입");
      ProductDto dto = new ProductDto();
      dto.setStock_kind(paramtype);
      
      int currentpage = Integer.parseInt(request.getParameter("currentpage"));
      System.out.println(currentpage+"커랜트 페이지");
      PagingDto pagingdto = new PagingDto();
      pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
      pagingdto.setColumn(16);   //게시글은 16개씩
      pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
      pagingdto.setTotalpage(biz.searchTypetotalPage(pagingdto.getColumn(),paramtype));  //마지막 페이지 번호     (1)
      
      List<ProductDto>searchtypelist = new ArrayList<ProductDto>(); //일반 경매상품 리스트
      List<ProductDto>bestlist = new ArrayList<ProductDto>(); //best경매상품(4개)
   
      searchtypelist = biz.searchtypelist(pagingdto,dto);
      bestlist = biz.bestlist();
      //System.out.println(bestlist.get(2).getStock_image()+"********");
      HttpSession session = request.getSession();
      session.setAttribute("pagingdto", pagingdto);
      session.setAttribute("productlist", searchtypelist);
      session.setAttribute("bestlist", bestlist);
      session.setAttribute("paramtype", paramtype);
      session.setAttribute("listGubun", "searchtype");////////////
      response.sendRedirect("auction/auctionlist.jsp");
   }else if(command.equals("searchArea")) {         //지역별로 Search
         String paramtype = request.getParameter("paramtype");   //지역 값
         System.out.println(paramtype+"::입력된 지역명");
         ProductDto dto = new ProductDto();
         dto.setStock_location(paramtype);
         int currentpage = Integer.parseInt(request.getParameter("currentpage"));
         System.out.println(currentpage+"커랜트 페이지");
         PagingDto pagingdto = new PagingDto();
         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
         pagingdto.setColumn(16);   //게시글은 16개씩
         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
         pagingdto.setTotalpage(biz.searchAreatotalPage(pagingdto.getColumn(),paramtype));  //마지막 페이지 번호     (1)
         
         List<ProductDto>searchlist = new ArrayList<ProductDto>(); //일반 경매상품 리스트
         List<ProductDto>bestlist = new ArrayList<ProductDto>(); //best경매상품(4개)
         
         searchlist = biz.searchlist(pagingdto,dto);
         bestlist = biz.bestlist();
         //System.out.println(bestlist.get(2).getStock_image()+"********");
         HttpSession session = request.getSession();
         session.setAttribute("pagingdto", pagingdto);
         session.setAttribute("productlist", searchlist);
         session.setAttribute("bestlist", bestlist);
         session.setAttribute("paramtype", paramtype);
         session.setAttribute("listGubun", "searchArea");//////////////
         response.sendRedirect("auction/auctionlist.jsp");
         
      }
   */
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      String command = request.getParameter("command");
      
      if(command.equals("purchaseProduct")) {
         int auc_no = Integer.parseInt(request.getParameter("auc_no"));
         int insertprice = Integer.parseInt(request.getParameter("insertprice"));
         String mem_id = request.getParameter("mem_id");
         int mem_grade = Integer.parseInt(request.getParameter("mem_grade"));
         ProductDto dto  = new ProductDto();
         ProductBiz biz = new ProductBizImpl();
         
         System.out.println(auc_no+"::경매번호");
         System.out.println(insertprice+"::입력받은 경매가");
         System.out.println(mem_id+"::현재 입찰하려는 회원아이디");
         
         
         ProductDto productdto = biz.bestauctiondetail(auc_no);    //경매 테이블 update 전 selectOne
         productdto.setAuc_nowPrice(insertprice);    //입력받은값 setter
         int auc_join = productdto.getAuc_join();        //기존참여회원에 +1 후, setter
         productdto.setAuc_join(auc_join+1);
         productdto.setAuc_no(auc_no);              //경매번호 setter
         System.out.println(productdto.getAuc_join()+"::참여회원");
         System.out.println(productdto.getAuc_nowPrice()+"::현재경매최고가");
         System.out.println(productdto.getAuc_no()+"::현재경매번호");
         
         int resOne = biz.updateAuctioninfo(productdto);      //경매 테이블 update
         
         int resTwo = biz.insertmemjoin(mem_id,productdto);    //참여회원 테이블 insert
         
         if(resOne > 0&&resTwo > 0) {
            System.out.println("107번 업데이트 완료");

            HttpSession session = request.getSession();
            session.setAttribute("productdto", productdto);

            jsResponse("입찰에 성공하였습니다.","auction/auctionlist.jsp",response);
         }else {
            System.out.println("업데이트 실패");
            jsResponse("입찰에 실패하였습니다.","auction/auctionlist.jsp",response);
         }
         
       //*************************경매리스트 best 에이작스********************************   
      }else if(command.equals("livetimeajax")){    //실시간 Ajax 베스트들 
         ProductBiz biz = new ProductBizImpl();
         List<ProductDto>bestlist = new ArrayList<ProductDto>(); //best경매상품(4개)
         
         bestlist = biz.bestlist();        //best경매리스트
         //System.out.println(bestlist.get(2).getStock_image()+"********");
         HttpSession session = request.getSession();
         session.setAttribute("LiveBestlist", bestlist);
       
         
     	List<ProductDto>bestListTime = new ArrayList<ProductDto>();

       	bestListTime = biz.BestListProduct();  //시간계산
         
         session.setAttribute("BestListTime", bestListTime);
         
         response.sendRedirect("auction/ajaxBestList.jsp");
         
    //*************************경매리스트 best 에이작스********************************  
       
    //*************************경매리스트 일반 에이작스********************************        
      }else if(command.equals("liveProductAjax")){    //실시간 Ajax 상품들
         System.out.println("실시간Ajax들어옴");
         int currentpage = Integer.parseInt(request.getParameter("currentpage"));
         System.out.println(currentpage+"커랜트 페이지");
         PagingDto pagingdto = new PagingDto();
         ProductBiz biz = new ProductBizImpl();
         pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
         pagingdto.setColumn(16);   //게시글은 16개씩
         pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
         pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn()));  //마지막 페이지 번호     (1)
         
         List<ProductDto>productlist = new ArrayList<ProductDto>(); //일반 경매상품 리스트
         
         productlist = biz.productlist(pagingdto);    //일반경매리스트
       
         HttpSession session = request.getSession();
         
         //세션초기화작업
         session.removeAttribute("pagingdto");
         session.removeAttribute("LiveProductlist");
         session.removeAttribute("listGubun");
         session.removeAttribute("paramtype");
         ///
         
         session.setAttribute("pagingdto", pagingdto);
         session.setAttribute("LiveProductlist", productlist);
         session.setAttribute("listGubun", "auction");/////////////////
         session.setAttribute("paramtype", null);
         
         if(request.getParameter("chk") != null) {
       	  
	 		  response.sendRedirect("auction/ajaxPagingList.jsp"); 
	   	  }else {
	   		
	   		  response.sendRedirect("auction/ajaxProducList.jsp"); 
	   	  }
//*************************경매리스트 일반 지역검색 에이작스********************************   
      }else if(command.equals("searchArea")) {         //지역별로 Search
    	 
          String paramtype = request.getParameter("paramtype");   //지역 값
          System.out.println(paramtype+"::입력된 지역명*******************");
          
          ProductDto dto = new ProductDto();
          dto.setStock_location(paramtype);
          ProductBiz biz = new ProductBizImpl();
          
          int currentpage = Integer.parseInt(request.getParameter("currentpage"));
          System.out.println(currentpage+"커랜트 페이지*******************");
          
          PagingDto pagingdto = new PagingDto();
          pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
          pagingdto.setColumn(16);   //게시글은 16개씩
          pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
          pagingdto.setTotalpage(biz.searchAreatotalPage(pagingdto.getColumn(),paramtype));  //마지막 페이지 번호     (1)
          
          List<ProductDto>searchlist = new ArrayList<ProductDto>(); //일반 경매상품 리스트
       
          searchlist = biz.searchlist(pagingdto,dto);
          
          //
          System.out.println(searchlist.size()+"searchlist.size()사이즈******************");
          //
          
          HttpSession session = request.getSession();
          
          //세션초기화작업
          session.removeAttribute("pagingdto");
          session.removeAttribute("LiveProductlist");
          session.removeAttribute("listGubun");
          session.removeAttribute("paramtype");
          ///
          
          session.setAttribute("pagingdto", pagingdto);
          session.setAttribute("LiveProductlist", searchlist);
          session.setAttribute("paramtype", paramtype);
          session.setAttribute("listGubun", "searchArea");/////////////
          
          /////////////////////////////////////////////////////
          List<ProductDto>searchAreaListTime = new ArrayList<ProductDto>();

          searchAreaListTime = biz.searchAreaListProduct(pagingdto,dto);  //시간계산
         
         System.out.println(searchAreaListTime+"::리스트로 뽑은 시간들(일반상품)");
         session.setAttribute("normalListTime", searchAreaListTime);
         /////////////////////////////////////////////////////////////
          
          if(request.getParameter("chk") != null) {
        	 
	 		  response.sendRedirect("auction/ajaxPagingList.jsp"); 
    	  }else {
    		
    		  response.sendRedirect("auction/ajaxProducList.jsp"); 
    	  }
          
//*************************경매리스트 일반 상품타입검색 에이작스********************************  
       }else if(command.equals("searchtype")) {   //품목별로 search
    	  System.out.println("상품타입으로 와야된다!");
    	   int paramtype = Integer.parseInt(request.getParameter("paramtype"));
          System.out.println(paramtype+"::써치타입*******************");
          ProductDto dto = new ProductDto();
          ProductBiz biz = new ProductBizImpl();
          dto.setStock_kind(paramtype);
          
          int currentpage = Integer.parseInt(request.getParameter("currentpage"));
          System.out.println(currentpage+"커랜트 페이지*******************");
          PagingDto pagingdto = new PagingDto();
          pagingdto.setCurrentpage(currentpage);   //현재페이지 (초기값 1)
          pagingdto.setColumn(16);   //게시글은 16개씩
          pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
          pagingdto.setTotalpage(biz.searchTypetotalPage(pagingdto.getColumn(),paramtype));  //마지막 페이지 번호     (1)
          
          List<ProductDto>searchtypelist = new ArrayList<ProductDto>(); //일반 경매상품 리스트

          searchtypelist = biz.searchtypelist(pagingdto,dto);
          //System.out.println(bestlist.get(2).getStock_image()+"********");
          HttpSession session = request.getSession();
          //세션초기화작업
          session.removeAttribute("pagingdto");
          session.removeAttribute("LiveProductlist");
          session.removeAttribute("listGubun");
          session.removeAttribute("paramtype");
          ///
          
          session.setAttribute("pagingdto", pagingdto);
          session.setAttribute("LiveProductlist", searchtypelist);
          session.setAttribute("paramtype", paramtype);
          session.setAttribute("listGubun", "searchtype");////////////
         
          List<ProductDto>searchTypeListTime = new ArrayList<ProductDto>();

          searchTypeListTime = biz.searchTypeListProduct(pagingdto,dto);  //시간계산
         
         System.out.println(searchTypeListTime+"::리스트로 뽑은 시간들(일반상품)");
         session.setAttribute("normalListTime", searchTypeListTime);
          
          
          if(request.getParameter("chk") != null) {
        	
	 		  response.sendRedirect("auction/ajaxPagingList.jsp"); 
    	  }else {
    		 
    		  response.sendRedirect("auction/ajaxProducList.jsp"); 
    	  }
         
   //*************************경매detail 에이작스********************************        
      }else if(command.equals("liveTimeAuc")){   //auctiondetail 실시간 남은시간 에이작스 영역
    	 int auc_no = Integer.parseInt(request.getParameter("auc_no"));
         ProductBiz biz = new ProductBizImpl();
       	 
         //시간 꺼내는 함수
         ProductDto dto = biz.liveTimeAjax(auc_no);
         //localtime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
 
         System.out.println("실시간 시간 에이작스 돌고있다***********");
         HttpSession session = request.getSession();
         session.setAttribute("ajax01dto", dto);
         
         response.sendRedirect("auction/detailajax01.jsp");
         
      }else if(command.equals("Auc_nowPrice")) {  //auctiondetail 최고가 에이작스 영역
         System.out.println("최고가ajax탔다");
         int auc_no = Integer.parseInt(request.getParameter("auc_no"));
         ProductDto dto = new ProductDto();
         ProductBiz biz = new ProductBizImpl();
      
         ProductDto productdto = biz.bestauctiondetail(auc_no);

         HttpSession session = request.getSession();
         session.setAttribute("auc_nowPrice", productdto);
         response.sendRedirect("auction/detailajax02.jsp");
         
      }else if (command.equals("Auc_join")) {    //auctiondetail 참여인원 에이작스 영역
         System.out.println("참여인원ajax탔다");
         int auc_no = Integer.parseInt(request.getParameter("auc_no"));
         ProductDto dto = new ProductDto();
         ProductBiz biz = new ProductBizImpl();
      
         ProductDto productdto = biz.bestauctiondetail(auc_no);
         
         HttpSession session = request.getSession();
         session.setAttribute("getAuc_join", productdto);
         response.sendRedirect("auction/detailajax03.jsp");
         
      }else if(command.equals("sendmessage")) {      //쪽지보내기
    	  String letter_sender = request.getParameter("letter_sender");
    	  String mem_id = request.getParameter("mem_id");
    	  String letter_title = request.getParameter("letter_title");
    	  String letter_content = request.getParameter("letter_content");
    	  ProductDto letterdto = new ProductDto();
    	  ProductBiz biz = new ProductBizImpl();
    	  
    	  System.out.println(letter_sender+"::컨트롤러의 발신자");
    	  System.out.println(mem_id+"::컨트롤러의 수신자");
    	  
    	  letterdto.setLetter_sender(letter_sender);
    	  letterdto.setMem_id(mem_id);
    	  letterdto.setLetter_title(letter_title);
    	  letterdto.setLetter_content(letter_content);
    	  
    	  int res = biz.sendletter(letterdto);
    	  
    	  if(res > 0) {
    		 jsResponse("쪽지가 전송되었습니다.","auction/messageclose.jsp",response);
    	  }else{
    		 jsResponse("쪽지전송을 실패하였습니다.","auction/message.jsp",response);
    	  }
    //*************************경매detail 에이작스********************************	  
    //*************************sectiontwo BestRank 에이작스**********************
      }else if(command.equals("curBestRank")) {
    	  ProductDto productdto = new ProductDto();
    	  ProductBiz biz = new ProductBizImpl();
    	  System.out.println("홈화면 BestRank에이작스 돌고있따*******");
    	  productdto = biz.curBestRank();
    	  
    	  HttpSession session = request.getSession();
    	  session.setAttribute("curBestRank", productdto);
    	  response.sendRedirect("home/sectionajax.jsp");
    	  
      }
        
      doGet(request,response);
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