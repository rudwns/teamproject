package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;


@WebServlet("/Join")
public class JoinService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String personnumber = request.getParameter("personnumber");
		String sex = request.getParameter("gen");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		try {
			int cnt = dao.join(id, pw, nick, personnumber, sex);
			
			if(cnt>0) {
				response.sendRedirect("main.jsp");
			}else {
				response.sendRedirect("main.jsp");	
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	
	}

}
