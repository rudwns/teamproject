package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BookDAO;
import com.model.BookDTO;

@WebServlet("/Return")
public class ReturnService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String book_num = request.getParameter("book_num");
		
		BookDAO b_dao = BookDAO.getInstance();
		String moveURL = "";
		try {
			
			int cnt = b_dao.returnBook(book_num);
			
			if(cnt>0) {
				moveURL = "main.jsp";
			}else {
				moveURL = "search.jsp";
			}
			
			response.sendRedirect(moveURL);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
