package com.service;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.model.FileDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileuploadService")
public class FileuploadService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	boolean isMulti = ServletFileUpload.isMultipartContent(request);
	// ���� ���� form ���� üũ���ִ� �޼ҵ�
	
	ServletContext context = getServletContext();
	// ���� ���� ������ �˾ƿ��� ���� ��ü context ����� 
	String saveDir = context.getRealPath("FileSavedFolder"); // ������Ʈ�� FileSavedFolder �������� ������ ������
	System.out.println(saveDir); // ��� �Ǵµ� Ȯ����..
	
	
	int max = 10*1024*1024; // ���ϴ� �ִ� ũ�� 10MB
	String encoding = "euc-kr";
	
	MultipartRequest multi = null; 
	
	if (isMulti){
		 multi = new MultipartRequest(request, saveDir, max, encoding);
		// request ��ü, ������ ����� ���丮, �ø� �� �ִ� �����ִ�뷮, ���� ���ڵ�, ���ϸ� �ߺ�ȸ�� ��ü
		FileDAO dao = FileDAO.getInstance();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String writer = id;
		String you = multi.getParameter("you");
		String file = multi.getFilesystemName("file");
		
		try {
			int cnt = dao.uploadFile(writer, you, file);
			String moveURL = "";
			
			
			if (cnt>0){
				System.out.println("����Ϸ�");
				moveURL = "FileSelectOne";
				
			}else{
				System.out.println("�������");
				moveURL = "report_fail.jsp";
			}
			
			response.sendRedirect(moveURL);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("�������� form�Դϴ�.");// ��� �Ǵµ� Ȯ����..
		
	}else{
		System.out.println("�Ϲ����� form�Դϴ�.");//��� �Ǵµ� Ȯ����..
	}
	
	
	}
}
