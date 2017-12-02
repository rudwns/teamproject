package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.ReviewDAO;


@WebServlet("/review")
public class review extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("euc-kr");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String nick = (String) session.getAttribute("nick");
		String content = request.getParameter("content");
		
		System.out.println("넘겨받은 번호:"+num);
		System.out.println("넘겨받은 닉네임 :"+nick);
		System.out.println("넘겨받은 컨텐츠 : "+content);
		
		String moveUrl = "";
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		try {
			cnt = dao.insert(num,nick,content);
			
			if (cnt > 0) {
				System.out.println("성공");
				response.sendRedirect("greenright.jsp");
				/*moveUrl = "greenright.jsp";*/
			}else {
				System.out.println("실패");
				moveUrl = "content.jsp";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
