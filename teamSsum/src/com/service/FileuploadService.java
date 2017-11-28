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
		 - 파일 업로드 필요한 정보
		 
		 */
	// 파일 전송 form 인지 체크해주는 메소드 : isMultipartContent()	
/*	boolean isMulti = ServletFileUpload.isMultipartContent(request);*/
	
//	String writer = request.getParameter("writer");
//	String title = request.getParameter("title");
//	String file = request.getParameter("file");
	
	// System.out.println(writer+"/"+title+"/"+file);
	
//	ServletContext context = getServletContext();
//	// 서버 저장 절대경로 알아오기 위한 객체 context 만들고 
//	String saveDir = context.getRealPath("UpLoad");
//	 System.out.println(saveDir);
	// 이게 절대경로 주소 알아낸거고, 그 폴더에 이제 파일들이 저장될거야.
	
//	int max = 10*1024*1024;
	// 이게 10MB 표현한 것
//		String encoding = "euc-kr";
	
//	MultipartRequest multi = null; 
//	
//	if (isMulti){
//		 multi = new MultipartRequest(request, saveDir, max, encoding, new DefaultFileRenamePolicy());
//		// request 객체, 파일이 저장될 디렉토리, 올릴 수 있는 파일최대용량, 제목 인코딩, 파일명 중복회피 객체
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
//				System.out.println("저장완료");
//				moveURL = "SelectService";
//				
//			}else{
//				System.out.println("저장실패");
//				moveURL = "ex01_Upload.html";
//			}
//			
//			response.sendRedirect(moveURL);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println("파일전송 form입니다.");
//	}else{
//		System.out.println("일반전송 form입니다.");
//	}
//	
//	
//	}
//	}
//
//}
