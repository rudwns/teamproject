package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class analysisDAO {

	private String url;
	private String db_Id;
	private String db_Pw;
	private String className;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private String sql;
	private weatherDTO vo;

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

	public ArrayList<analysisDTO> report_view() throws Exception {

		getConnection();

		ArrayList<analysisDTO> report_List = new ArrayList<analysisDTO>();

		sql = "select * from report";
		pst = conn.prepareStatement(sql);
		rs = pst.executeQuery();

		while (rs.next()) {
			report_List.add(new analysisDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			
		}

		close();
		return report_List;
	}
}
