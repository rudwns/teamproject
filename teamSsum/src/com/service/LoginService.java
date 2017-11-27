package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/Login")
public class LoginService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = MemberDAO.getInstance();
		String moveURL = "";
		try {
			MemberDTO dto = dao.login(id, pw);
			
			if(id.equals(dto.getId()) && pw.equals(dto.getPw())) {
				HttpSession session = request.getSession();
				session.setAttribute("nick", dto.getNick());
				
				System.out.println("로그인 성공!");
				moveURL = "main.jsp";
			}else {
				System.out.println("로그인 실패!");
				moveURL = "main.jsp";
			}
		
			response.sendRedirect(moveURL);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
