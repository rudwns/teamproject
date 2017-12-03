package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FileDAO;
import com.model.FileVO;

@WebServlet("/FileSelectOne")
public class FileSelectOne extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		FileDAO dao = FileDAO.getInstance();
		String moveURL = "";

		try {
			FileVO vo = dao.selectOne(id);

			if (vo != null) {
				request.setAttribute("vo", vo);
				// vo가 null이 아닐 때 request 영역에 vo 객체 저장!
				moveURL = "analysis.jsp";
			}

			RequestDispatcher dispatacher = request.getRequestDispatcher("report_analysis.jsp");
			dispatacher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
