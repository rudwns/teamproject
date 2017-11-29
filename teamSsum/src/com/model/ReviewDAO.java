package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class ReviewDAO {


	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private String sql;
	private ReviewDTO b_dto;
	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}

	public void getConnection() throws Exception { // db연결 메소드
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		conn = DriverManager.getConnection(url, dbid, dbpw);
	}


	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}

	public int insert(int num, String nick, String content) throws Exception{
		getConnection();
		sql = "insert into review values(?,?,sysdate,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		pst.setString(2, nick);
		pst.setString(3, content);
		
		cnt = pst.executeUpdate();
		
		close();
		return cnt;
	}
	
	public ArrayList<ReviewDTO> selectBoardAll() throws Exception{
		
		getConnection();
		
		ArrayList<ReviewDTO> tmpList = new ArrayList<ReviewDTO>();
		
		sql = "select * from review";
		
		pst = conn.prepareStatement(sql);
		
		rs = pst.executeQuery();
		
		while(rs.next()) {
			tmpList.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			

		}
		
		close();
		return tmpList; 
	}
	
	
	
	
	
	
	
}
