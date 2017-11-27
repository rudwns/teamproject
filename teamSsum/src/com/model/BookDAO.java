package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {

	private String url;
	private String db_Id;
	private String db_Pw;
	private String className;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private String sql;
	private BookDTO b_dto;
	private static BookDAO instance = new BookDAO();

	public static BookDAO getInstance() {
		return instance;
	}

	public void getConnection() throws Exception {
		url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		db_Id = "system";
		db_Pw = "123";
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

	public ArrayList<BookDTO> selectBookAll(int num) throws Exception {
		getConnection();
		
		ArrayList<BookDTO> tmpList = new ArrayList<BookDTO>();

		if(num==0) {
			sql = "select * from book_info where possible = 0";
		}else {
			sql = "select * from book_info where possible = 1";
		}

		pst = conn.prepareStatement(sql);

		rs = pst.executeQuery();

		while (rs.next()) {
			tmpList.add(new BookDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
		}

		return tmpList;
	}
	
	public int returnBook(String book_num) throws Exception {
		getConnection();

		sql = "update book_info set possible=? where num=?";

		pst = conn.prepareStatement(sql);
		pst.setInt(1, 0);
		pst.setString(2, book_num);

		cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	public int rentalBook(String book_num) throws Exception {
		getConnection();

		sql = "update book_info set possible=? where num=?";

		pst = conn.prepareStatement(sql);
		pst.setInt(1, 1);
		pst.setString(2, book_num);

		cnt = pst.executeUpdate();

		close();

		return cnt;
	}

}
