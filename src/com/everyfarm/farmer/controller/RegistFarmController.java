package com.everyfarm.farmer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.registfarm.biz.FarmBiz;
import com.everyfarm.registfarm.biz.FarmBizImpl;
import com.everyfarm.registfarm.dto.FarmDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;


@WebServlet("/farmer.do")
public class RegistFarmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String savePath = "C:\\Git_semifinal\\EveryFarm\\EveryFarm\\WebContent\\resources\\images\\farmimage";
	
    
    public RegistFarmController() {
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
				request, savePath, 15*1024*1024 , "UTF-8", new DefaultFileRenamePolicy());
		
		String command = multi.getParameter("command");
		FarmBiz biz = new FarmBizImpl();

		
		if(command.equals("registform")){
			System.out.println("들어왔다!!!");
			
			String mem_id = multi.getParameter("mem_id");
			String wfarm_title = multi.getParameter("wfarm_title");
			String image01 = "resources\\images\\farmimage\\" + multi.getFilesystemName("wfarm_image_01")+"/";
			String image02 = "resources\\images\\farmimage\\" + multi.getFilesystemName("wfarm_image_02")+"/";
			String image03 = "resources\\images\\farmimage\\" + multi.getFilesystemName("wfarm_image_03")+"/";
			String image04 = "resources\\images\\farmimage\\" + multi.getFilesystemName("wfarm_image_04");
			String wfarm_zoneCode = multi.getParameter("wfarm_zoneCode");
			String wfarm_addr = multi.getParameter("wfarm_addr");
			int wfarm_totalArea = Integer.parseInt(multi.getParameter("wfarm_totalArea"));
			int wfarm_price = Integer.parseInt(multi.getParameter("wfarm_price"));
			String wfarm_content = multi.getParameter("wfarm_content");
			
			FarmDto dto = new FarmDto();
			dto.setMem_id(mem_id);
			dto.setWfarm_title(wfarm_title);
			dto.setWfarm_zoneCode(wfarm_zoneCode);
			dto.setWfarm_addr(wfarm_addr);
			dto.setWfarm_totalArea(wfarm_totalArea);
			dto.setWfarm_price(wfarm_price);
			dto.setWfarm_status("1");
			dto.setWfarm_image(image01 + image02 + image03 + image04);
			dto.setWfarm_content(wfarm_content);
			
			int res = biz.insertFarm(dto);
			if(res>0) {
				jsResponse("농장 등록이 신청되었습니다!", "index.jsp" ,response);
			} else {
				jsResponse("농장 등록 실패", "farmer.do?command=registform", response);
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
