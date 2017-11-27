package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BookDAO;
import com.model.BookDTO;

@WebServlet("/Rental")
public class RentalService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String book_num = request.getParameter("book_num");
		HttpSession session = request.getSession();
		String nick = (String)session.getAttribute("nick");
		
		BookDAO b_dao = BookDAO.getInstance();
		String moveURL = "";
		try {
			
			int cnt = b_dao.rentalBook(book_num);
			
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
