package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import com.model.FileVO;


public class FileDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private static FileDAO instance = new FileDAO();
	
	public static FileDAO getInstance(){ // 싱글톤패턴
		return instance;
	}
	
	public void getConnection() throws Exception { //db연결 메소드
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		conn = DriverManager.getConnection(url, dbid, dbpw);
	}
	
	
	public void close() throws Exception { // db 연결 끊는 메소듯
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}

	
public int uploadFile(String writer, String you, String file) throws Exception {
	//파일 업로드 메소듯
		
		getConnection();
			
		// sql 작성
		pst = conn.prepareStatement("insert into fileboard values(file_num.nextval,?,?,?,to_char(sysdate,'YYYY-MM-DD'))");
		pst.setString(1,writer);
		pst.setString(2, you);
		pst.setString(3, file);
		
		cnt = pst.executeUpdate();

		close();

		return cnt;
	}

public FileVO selectOne(String id) throws Exception{
	
	getConnection();
	
	pst = conn.prepareStatement("select * from fileboard where writer = ?");
	pst.setString(1, id);
	rs = pst.executeQuery();
	
	FileVO vo = null;
	
	if(rs.next()){
		
	vo =  new FileVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
	//vo에 고유번호, 사용자아아디, 상대방,파일이름, 날짜 저장함
		
	}
	
	
	close();
	
	
	
	return vo;
}
	

}
