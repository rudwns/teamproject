//package com.service;
//
//import java.io.IOException;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
//
//import com.model.FileDAO;
////import com.oreilly.servlet.MultipartRequest;
////import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//
//@WebServlet("/FileuploadService")
//public class FileuploadService extends HttpServlet {
//	
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 - ���� ���ε� �ʿ��� ����
		 
		 */
	// ���� ���� form ���� üũ���ִ� �޼ҵ� : isMultipartContent()	
/*	boolean isMulti = ServletFileUpload.isMultipartContent(request);*/
	
//	String writer = request.getParameter("writer");
//	String title = request.getParameter("title");
//	String file = request.getParameter("file");
	
	// System.out.println(writer+"/"+title+"/"+file);
	
//	ServletContext context = getServletContext();
//	// ���� ���� ������ �˾ƿ��� ���� ��ü context ����� 
//	String saveDir = context.getRealPath("UpLoad");
//	 System.out.println(saveDir);
	// �̰� ������ �ּ� �˾Ƴ��Ű�, �� ������ ���� ���ϵ��� ����ɰž�.
	
//	int max = 10*1024*1024;
	// �̰� 10MB ǥ���� ��
//		String encoding = "euc-kr";
	
//	MultipartRequest multi = null; 
//	
//	if (isMulti){
//		 multi = new MultipartRequest(request, saveDir, max, encoding, new DefaultFileRenamePolicy());
//		// request ��ü, ������ ����� ���丮, �ø� �� �ִ� �����ִ�뷮, ���� ���ڵ�, ���ϸ� �ߺ�ȸ�� ��ü
//		FileDAO dao = FileDAO.getInstace();
//		
//		String writer = multi.getParameter("writer");
//		String title = multi.getParameter("title");
//		String file = multi.getFilesystemName("file");
//		
//		System.out.println(writer + title + file);
//		try {
//			int cnt = dao.uploadFile(writer, title, file);
//			String moveURL = "";
//			
//			
//			if (cnt>0){
//				System.out.println("����Ϸ�");
//				moveURL = "SelectService";
//				
//			}else{
//				System.out.println("�������");
//				moveURL = "ex01_Upload.html";
//			}
//			
//			response.sendRedirect(moveURL);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println("�������� form�Դϴ�.");
//	}else{
//		System.out.println("�Ϲ����� form�Դϴ�.");
//	}
//	
//	
//	}
//	}
//
//}
