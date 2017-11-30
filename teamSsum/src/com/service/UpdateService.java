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


@WebServlet("/Update")
public class UpdateService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		String moveURL ="";
		
		String id=request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String personnumber = request.getParameter("personnumber");
		String gender = request.getParameter("gender");
		
		/*if(pw.equals("") || nick.equals("") || email.equals("") || tel.equals("")) {
			System.out.println("비었음");
			moveURL = "main.jsp";
		}else {*/
			
			MemberDAO m_dao = MemberDAO.getInstance();
		
			try {
				MemberDTO dto = new MemberDTO(id, pw, nick, personnumber, gender);
				int cnt = m_dao.update(dto);
				
				if(cnt>0) {
					System.out.println("수정완료");
					session.setAttribute("nick", nick);
					moveURL = "main.jsp";
				}else{
					System.out.println("수정실패");
					moveURL = "main.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		/*}*/
		response.sendRedirect(moveURL);
	
	}

}
