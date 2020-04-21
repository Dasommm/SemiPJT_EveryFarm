package com.everyfarm.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everyfarm.member.biz.MemberBiz;
import com.everyfarm.member.biz.MemberBizImpl;
import com.everyfarm.member.dto.MemberDto;


@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		
		if(command.equals("login")) {
			System.out.println("컨트롤러 들어옴");
			response.sendRedirect("login/loginform.jsp");
		}else if(command.equals("searchaccount")) {
			System.out.println("서치어카운트");
			response.sendRedirect("login/searchaccount.jsp");
		}
		
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		MemberBiz biz = new MemberBizImpl();
		
		if(command.equals("loginres")) {         //로그인 결과
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
		
			MemberDto dto = biz.login(mem_id, mem_pw);
	
			if(dto!=null) {
				if(dto.getMem_grade()!=0) {
					HttpSession session = request.getSession();
					session.setAttribute("dto", dto);
					//session.setAttribute("mem_grade", dto.getMem_grade());
					session.setMaxInactiveInterval(10*60);
					
					if(dto.getMem_grade()==1||dto.getMem_grade()==2||dto.getMem_grade()==3) {
						//dispatch("home/section.jsp",request,response);
						//System.out.println(session.getAttribute("dto")+"********세션저장된 dto");
						response.sendRedirect("home/section.jsp");
					}
			
				}
			}else{
				jsResponse("로그인 정보를 확인해 주십시오","login.do?command=login",response);			   
			}
			//////////////
			
		}else if(command.equals("searchId")) {    // 아이디 찾기
			String mem_name = request.getParameter("mem_name");
			String mem_email = request.getParameter("mem_email");
			String mem_phone = request.getParameter("mem_phone");
			MemberDto dto = new MemberDto();
			dto.setMem_name(mem_name);
			dto.setMem_email(mem_email);
			dto.setMem_phone(mem_phone);
			
			List<MemberDto>list = biz.searchId(dto);
			System.out.println(list+"리스트:"+"사이즈"+list.size());
			if(list.size()<1) {   //이메일이 없으면
				jsResponse("정보를 확인해 주십시오.","login/searchaccount.jsp",response);
			}else {   //이메일이 있으면 이메일로 아이디를 보내는 조건문
				String mem_id = list.get(0).getMem_id();
				System.out.println(mem_id+"쿼리문에서 뽑은 아이디");
			try {
				String mail_from = "<" + mem_email + ">";  //보내는 사람
				String mail_to = mem_email;   //받는 사람
				String title =      "EveryFarm에서 보낸 메일 입니다. "; //제목
	            String contents =   "보낸 사람 : EveryFarm ";
	            
	            System.out.println("222");
	            mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
	            mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
	 
	            Properties props = new Properties();
	            props.put("mail.transport.protocol", "smtp");
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "465");
	            props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.socketFactory.port", "465");
	            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.socketFactory.fallback", "false");
	            props.put("mail.smtp.auth", "true");
	 
	            Authenticator auth = new SMTPAuthenticator();  //보내는 사람 클래스 객체생성
	 
	            Session sess = Session.getDefaultInstance(props, auth);
	 
	            MimeMessage msg = new MimeMessage(sess);
	 
	            msg.setFrom(new InternetAddress(mail_from));
	            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
	            msg.setSubject(title, "UTF-8");
	            msg.setContent(contents, "text/html; charset=UTF-8");
	            msg.setText(new StringBuffer().append("<fieldset style='text-align:center; height: 1100px;'>")
	            			.append("<legend><h1>EveryFarm에서 전송한 아이디 입니다.</h1></legend><br/>")
	            			.append("<img alt='png01;' src='https://kr.seaicons.com/wp-content/uploads/2015/09/Mail-icon1.png' />")
	            			.append("<p style='font-weight:bold; font-size:12px; '>이 메일은 EveryFarm에서 보낸 메일로 아이디 요청의 건에 따른 메일입니다.</p><br/>")
	            			.append("<p style='font-weight:bold; font-size:12px; color:blue;'>아이디 : ["+mem_id+"]</p><br/>")
	            			.append("<p style='font-weight:bold; font-size:12px; '>아래 버튼 클릭한 후 로그인 해 주세요.</p><br/><hr/><br/>")
	            			.append("<button style=\"color:white; background:black; font-weight:bold; width:150px; height:40px; font-size:18px; border-radius:10px;\"><a style=\"color:white; text-decoration: none;\" href=\"http://localhost:8787/EveryFarm/login/loginform.jsp\">Click</a></button>")
	            			.append("</fieldset>").toString()
	            		);
	            msg.setHeader("Content-type", "text/html; charset=UTF-8");
	 
	            Transport.send(msg);
	            System.out.println("이메일 전송 성공****************");
	            jsResponse("이메일로 아이디가 전송되었습니다.","login/loginform.jsp",response);
	        
	        } catch (Exception e) {
	        	e.printStackTrace();
	        	System.out.println("[ERROR]:전송에러");
	            response.sendRedirect("signup.do/signupform.jsp");
	        } finally {
	 
	         }

			}
			
		}else if(command.equals("searchPw")) {    //비밀번호 찾기
			String mem_id = request.getParameter("mem_id");
			String mem_name = request.getParameter("mem_name");
			String mem_email = request.getParameter("mem_email");
			String mem_phone = request.getParameter("mem_phone");
			MemberDto dto = new MemberDto();
			dto.setMem_id(mem_id);
			dto.setMem_name(mem_name);
			dto.setMem_email(mem_email);
			dto.setMem_phone(mem_phone);
	
			List<MemberDto>list = biz.searchPw(dto);
			System.out.println(list.size()+"**********");
			//System.out.println(list.get(0));
			if(list.size()==0) {   //쿼리문 결과가 null이면
				jsResponse("정보를 확인해 주십시오.","login/SearchAccount.jsp",response);
			}else {          //쿼리문 결과가 있으면
				String temppw = getRandomPassword(7);    //임시 비밀번호 발급
				dto.setMem_id(mem_id);
				dto.setMem_pw(temppw);
				
				int res = biz.temporarypw(dto);
				if(res > 0) {
					try {
						String mail_from = "<" + mem_email + ">";  //보내는 사람
						String mail_to = mem_email;   //받는 사람
						String title =      "EveryFarm에서 보낸 메일 입니다. "; //제목
			            String contents =   "보낸 사람 : EveryFarm ";
			            
			            System.out.println("222");
			            mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
			            mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
			 
			            Properties props = new Properties();
			            props.put("mail.transport.protocol", "smtp");
			            props.put("mail.smtp.host", "smtp.gmail.com");
			            props.put("mail.smtp.port", "465");
			            props.put("mail.smtp.starttls.enable", "true");
			            props.put("mail.smtp.socketFactory.port", "465");
			            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			            props.put("mail.smtp.socketFactory.fallback", "false");
			            props.put("mail.smtp.auth", "true");
			 
			            Authenticator auth = new SMTPAuthenticator();  //보내는 사람 클래스 객체생성
			 
			            Session sess = Session.getDefaultInstance(props, auth);
			 
			            MimeMessage msg = new MimeMessage(sess);
			 
			            msg.setFrom(new InternetAddress(mail_from));
			            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
			            msg.setSubject(title, "UTF-8");
			            msg.setContent(contents, "text/html; charset=UTF-8");
			            msg.setText(new StringBuffer().append("<fieldset style='text-align:center; height: 1100px;'>")
			            			.append("<legend><h1>EveryFarm에서 전송한 임시비밀번호 입니다.</h1></legend><br/>")
			            			.append("<img alt='png01;' src='https://kr.seaicons.com/wp-content/uploads/2015/09/Mail-icon1.png' />")
			            			.append("<p style='font-weight:bold; font-size:12px; '>이 메일은 EveryFarm에서 보낸 메일로 비밀번호 요청의 건에 따른 메일입니다.</p><br/>")
			            			.append("<p style='font-weight:bold; font-size:12px; '>로그인 후 비밀번호를 변경 해 주십시오.</p><br/>")
			            			.append("<p style='font-weight:bold; font-size:12px; color:blue;'>임시비밀번호 : ["+temppw+"]</p><br/>")
			            			.append("<p style='font-weight:bold; font-size:12px; '>아래 버튼 클릭한 후 로그인 해 주세요.</p><br/><hr/><br/>")
			            			.append("<button style=\"color:white; background:black; font-weight:bold; width:150px; height:40px; font-size:18px; border-radius:10px;\"><a style=\"color:white; text-decoration: none;\" href=\"http://localhost:8787/EveryFarm/login/loginform.jsp\">Click</a></button>")
			            			.append("</fieldset>").toString()
			            		);
			            msg.setHeader("Content-type", "text/html; charset=UTF-8");
			 
			            Transport.send(msg);
			            System.out.println("이메일 전송 성공****************");
			            jsResponse("이메일로 임시비밀번호가 전송되었습니다.","login/loginform.jsp",response);
			        
			        } catch (Exception e) {
			        	e.printStackTrace();
			        	System.out.println("[ERROR]:전송에러");
			            response.sendRedirect("signup/signupform.jsp");
			        } finally {
			 
			         }
					
				}else {
					 jsResponse("정보를 확인해 주십시오.","login/searchaccount.jsp",response);
				}
				System.out.println(temppw+"임시발급받은 패스워드");
	
			}
			
		}else if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect("home/section.jsp");
		}
	}
	
	public static String getRandomPassword(int len) {   //임시비밀번호 생성 함수
	  	  char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
	  			'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
	  			'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
	  			'U', 'V', 'W', 'X', 'Y', 'Z' };

	  	  int idx = 0;
	  	  StringBuffer sb = new StringBuffer();
	  	  
	  	  System.out.println("charSet.length :::: "+charSet.length);
	  	  
	  	  for (int i = 0; i < len; i++) {
	  		
	  		  idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를  Int로 추출 (소숫점제거)
	  		  System.out.println("idx :::: "+idx);
	  		  sb.append(charSet[idx]);
	  	  }

	  	  return sb.toString();
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
