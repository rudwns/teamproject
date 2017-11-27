package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;

/**
 * Servlet implementation class RemoveContent
 */
@WebServlet("/RemoveContent")
public class RemoveContent extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl = "";
		try {
			int cnt = dao.deleteContent(num);
			
			if(cnt>0){
				System.out.println("삭제성공");
				moveUrl = "board.jsp";
			}else {
				System.out.println("삭제실패");
				moveUrl = "content.jsp";
			}
			
			response.sendRedirect(moveUrl);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
