package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.http.HttpSession;


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

	
//public int uploadFile(String id String file) throws Exception {
//		
//		getConnection();
//			
//		// sql 작성
//		pst = conn.prepareStatement("insert into fileboard values(file_num.nextval,?,?,to_char(sysdate,'YYYY-MM-DD'))");
//		pst.setString(1,id)
//		pst.setString(2, file);
//		
//		cnt = pst.executeUpdate();
//
//		close();
//
//		return cnt;
//	}
//	
	
}
