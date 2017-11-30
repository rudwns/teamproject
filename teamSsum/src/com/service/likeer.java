package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.BoardDTO;


@WebServlet("/likeer")
public class likeer extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("넘겨받은 번호>> " + num);
		int check = 1;
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl = "";
		try {
			dao.likeer(num);
			BoardDTO dto = dao.selectBoardOne(num);
			
			if (dto != null) {
				request.setAttribute("1", check);
				request.setAttribute("dto", dto);
				System.out.println("성공");
				System.out.println(check);
				moveUrl = "greenright.jsp";
			}else {
				System.out.println("실패");
				moveUrl = "content.jsp";
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(moveUrl);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
