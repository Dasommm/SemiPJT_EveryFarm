package com.everyfarm.farmer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.registauction.biz.AuctionBiz;
import com.everyfarm.registauction.biz.AuctionBizImpl;
import com.everyfarm.registauction.dto.AuctionDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/registauction.do")
public class RegistAuctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String savePath = "C:\\Git_semifinal\\EveryFarm\\EveryFarm\\WebContent\\resources\\images\\productstorage";
	
    
    public RegistAuctionController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MultipartRequest multi = new MultipartRequest(
				request, savePath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		
		String command = multi.getParameter("command");
		
		AuctionBiz biz = new AuctionBizImpl();
		
		if(command.equals("newauction")) {
			System.out.println("servlet 들어왔다!");
			
			String mem_id = multi.getParameter("mem_id");
			String stock_name = multi.getParameter("stock_name");
			String stock_detail = multi.getParameter("stock_detail_01")+"/"+
					multi.getParameter("stock_detail_02")+"/"+
					multi.getParameter("stock_detail_03")+"/"+
					multi.getParameter("stock_detail_04");
			String stock_image_01 = "resources\\images\\productstorage\\" + multi.getFilesystemName("stock_image_01")+"/";
			String stock_image_02 = "resources\\images\\productstorage\\" + multi.getFilesystemName("stock_image_02")+"/";
			String stock_image_03 = "resources\\images\\productstorage\\" + multi.getFilesystemName("stock_image_03")+"/";
			String stock_image_04 = "resources\\images\\productstorage\\" + multi.getFilesystemName("stock_image_04");
			String stock_location = multi.getParameter("stock_location");
			int stock_kind = Integer.parseInt(multi.getParameter("stock_kind"));
			int stock_kg = Integer.parseInt(multi.getParameter("stock_kg"));;
			int auc_startPrice = Integer.parseInt(multi.getParameter("auc_startPrice"));;
			Date auc_endDate = Date.valueOf(multi.getParameter("auc_endDate"));
			
			System.out.println(auc_endDate);
			System.out.println(stock_location);
			
			
			
			AuctionDto dto = new AuctionDto();
			dto.setMem_id(mem_id);
			dto.setStock_name(stock_name);
			dto.setStock_detail(stock_detail);
			dto.setStock_image(stock_image_01+stock_image_02+stock_image_03+stock_image_04);
			dto.setStock_kind(stock_kind);
			dto.setStock_kg(stock_kg);
			dto.setAuc_endDate(auc_endDate);
			dto.setAuc_startPrice(auc_startPrice);
			dto.setStock_location(stock_location);
			
			int res = biz.registStock(dto);
			int res2 = biz.registAuction(dto);
			
			if(res>0 && res2>0) {
				jsResponse("경매 등록이 신청되었습니다!", "index.jsp" ,response);
			} else {
				jsResponse("경매 등록에 실패하였습니다", "registauction.do?command=newauction", response);
			}
		}
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

















