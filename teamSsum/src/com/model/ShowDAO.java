package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ShowDAO {
	
	private String url;
	private String db_Id;
	private String db_Pw;
	private String className;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private String sql;
	private BoardDTO b_dto;
	
	public void getConnection() throws Exception {
		url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		db_Id = "system";
		db_Pw = "oracle";
		className = "oracle.jdbc.driver.OracleDriver";

		Class.forName(className);
		conn = DriverManager.getConnection(url, db_Id, db_Pw);
	}
	
	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}
	
public ArrayList<ShowDTO> selectShopAll() throws Exception{
		
		getConnection();
		
		ArrayList<ShowDTO> tmpshowList = new ArrayList<ShowDTO>();
		
		sql = "select * from Show";
		pst = conn.prepareStatement(sql);
		rs = pst.executeQuery();
		
		while(rs.next()) {
			tmpshowList.add(new ShowDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			
/*			System.out.println("번호: "+rs.getInt(1));
			System.out.println("제목: "+rs.getString(2));
			System.out.println("닉네임: "+rs.getString(3));
			System.out.println("내용: "+rs.getString(4));
			System.out.println("날짜: "+rs.getString(5));
			System.out.println("조회: "+rs.getString(6));*/
		}
		
		close();
		return tmpshowList; 
	}
	
	
	

}
