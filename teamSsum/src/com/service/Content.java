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


@WebServlet("/Content")
public class Content extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("넘겨받은 번호>> " + num);
		
		BoardDAO dao = BoardDAO.getInstance();
		String moveUrl = "";
		try {
			dao.updateHit(num);
			BoardDTO dto = dao.selectBoardOne(num);
			
/*			System.out.println("번호: "+dto.getNum());
			System.out.println("제목: "+dto.getTitle());
			System.out.println("닉네임: "+dto.getNick());
			System.out.println("내용: "+dto.getContent());
			System.out.println("날짜: "+dto.getDay());
			System.out.println("조회: "+dto.getHit());*/
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				moveUrl = "content.jsp";
			}else {
				moveUrl = "board.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(moveUrl);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
