package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;


@WebServlet("/likeer")
public class likeer extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("�Ѱܹ��� ��ȣ>> " + num);
		
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl = "";
		try {
			dao.likeer(num);
			BoardDTO dto = dao.selectBoardOne(num);
			
			if (dto != null) {
				request.setAttribute("dto", dto);
				System.out.println("����");
				moveUrl = "greenright.jsp";
			}else {
				System.out.println("����");
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
