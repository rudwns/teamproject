package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;

@WebServlet("/WriteService")
public class WriteService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		String title = request.getParameter("title");
		String writer= request.getParameter("nick");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl = "";
		System.out.println(content);
		int cnt = 0;
		try {
			
			if(title != null && writer != null && content != null) {
				
				cnt = dao.insertBoard(title, writer, content);
				
				if(cnt>0) {
					System.out.println("11");
					moveUrl = "greenright.jsp";
				}else {
					System.out.println("����");
					moveUrl = "main.jsp";
				}
				
			}else {
				System.out.println("����");
				moveUrl = "main.jsp";				
			}
			
			response.sendRedirect(moveUrl);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
