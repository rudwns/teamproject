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
	// 파일 전송 form 인지 체크해주는 메소드
	
	ServletContext context = getServletContext();
	// 서버 저장 절대경로 알아오기 위한 객체 context 만들고 
	String saveDir = context.getRealPath("FileSavedFolder"); // 웹콘텐트에 FileSavedFolder 폴더만들어서 절대경로 구해줌
	System.out.println(saveDir); // 없어도 되는데 확인차..
	
	
	int max = 10*1024*1024; // 파일당 최대 크기 10MB
	String encoding = "euc-kr";
	
	MultipartRequest multi = null; 
	
	if (isMulti){
		 multi = new MultipartRequest(request, saveDir, max, encoding);
		// request 객체, 파일이 저장될 디렉토리, 올릴 수 있는 파일최대용량, 제목 인코딩, 파일명 중복회피 객체
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
				System.out.println("저장완료");
				moveURL = "FileSelectOne";
				
			}else{
				System.out.println("저장실패");
				moveURL = "report_fail.jsp";
			}
			
			response.sendRedirect(moveURL);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("파일전송 form입니다.");// 없어도 되는데 확인차..
		
	}else{
		System.out.println("일반전송 form입니다.");//없어도 되는데 확인차..
	}
	
	
	}
}
