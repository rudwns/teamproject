package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;


@WebServlet("/UpdateContent")
public class UpdateContent extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl ="";
		try {
			
			int cnt = dao.updateContent(num,title,content);
			
			if(cnt>0) {
				System.out.println("성공");
				moveUrl ="board.jsp";
			}else {
				System.out.println("실패");
				moveUrl ="content.jsp";
			}

			response.sendRedirect(moveUrl);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
