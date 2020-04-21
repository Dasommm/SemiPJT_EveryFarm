package com.everyfarm.farmer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.registfund.biz.RegistFundBiz;
import com.everyfarm.registfund.biz.RegistFundBizImpl;
import com.everyfarm.registfund.dto.RegistFundDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/registfund.do")
public class RegistFundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String savePath = "C:\\Git_semifinal\\EveryFarm\\EveryFarm\\WebContent\\resources\\images\\productstorage";
    
    public RegistFundController() {
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
		
		RegistFundBiz biz = new RegistFundBizImpl();
		
		if(command.equals("newfund")) {
			System.out.println("servlet 들어왔다!");
			String imagePath = "resources\\images\\productstorage\\";
			String mem_id = multi.getParameter("mem_id");
			String stock_name = multi.getParameter("stock_name");
			String stock_detail_1 = multi.getParameter("stock_detail_01")+"/";
			String stock_detail_2 = multi.getParameter("stock_detail_02")+"/";
			String stock_detail_3 = multi.getParameter("stock_detail_03")+"/";
			String stock_detail_4 = multi.getParameter("stock_detail_04");
			int stock_kg = Integer.parseInt(multi.getParameter("stock_kg"));
			int stock_price = Integer.parseInt(multi.getParameter("stock_price"));
			int fund_price = Integer.parseInt(multi.getParameter("fund_price"));
			String stock_image_01 = imagePath + multi.getFilesystemName("stock_image_01")+"/";
			String stock_image_02 = imagePath + multi.getFilesystemName("stock_image_02")+"/";
			String stock_image_03 = imagePath + multi.getFilesystemName("stock_image_03")+"/";
			String stock_image_04 = imagePath + multi.getFilesystemName("stock_image_04");
			String stock_location = multi.getParameter("stock_location");
			int stock_kind = Integer.parseInt(multi.getParameter("stock_kind"));
			Date fund_endDate = Date.valueOf(multi.getParameter("fund_endDate"));
			
			RegistFundDto dto = new RegistFundDto();
			dto.setMem_id(mem_id);
			dto.setStock_name(stock_name);
			dto.setStock_detail(stock_detail_1+stock_detail_2+stock_detail_3+stock_detail_4);
			dto.setStock_kg(stock_kg);
			dto.setStock_price(stock_price);
			dto.setStock_image(stock_image_01+stock_image_02+stock_image_03+stock_image_04);
			dto.setStock_kind(stock_kind);
			dto.setFund_endDate(fund_endDate);
			dto.setStock_location(stock_location);
			dto.setFund_price(fund_price);
			int res1 = biz.registStock(dto);
			int res2 = biz.registFund(dto);
			
			if(res1>0 && res2>0) {
				jsResponse("펀드 등록 완료", "farmermain.jsp", response);
			} else {
				jsResponse("펀드 등록 실패ㅠㅠ", "registfund.do?command=newfund", response);
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
