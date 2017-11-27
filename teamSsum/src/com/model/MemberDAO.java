package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {

	private String url;
	private String db_Id;
	private String db_Pw;
	private String className;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private String sql;
	private MemberDTO m_dto;
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
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
		if(rs!=null)rs.close();
		if(pst!=null)pst.close();
		if(conn!=null)conn.close();
	}	
	
	public MemberDTO selectMember(String nick) throws Exception{
		
		getConnection();
		
		sql = "select * from book_member where nickname=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, nick);
		
		rs = pst.executeQuery();
		
		if(rs.next()) {
			//아이디, 닉네임, 이메일, 번호
			m_dto = new MemberDTO(rs.getString(1), rs.getString(3),rs.getString(4), rs.getString(5));
		}
		
		close();
		
		return m_dto;
	}
	
	public int update(MemberDTO dto) throws Exception{
		getConnection();
		
		System.out.println(dto.getId()+"/"+dto.getPw()+"/"+dto.getNick()+"/"+dto.getEmail()+"/"+dto.getTel());
		sql = "update book_member set pw=?,nickname=?,email=?,tel=? where id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setString(1, dto.getPw());
		pst.setString(2, dto.getNick());
		pst.setString(3, dto.getEmail());
		pst.setString(4, dto.getTel());
		pst.setString(5, dto.getId());
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt;
	}
	
	public MemberDTO login(String id, String pw) throws Exception{
		getConnection();
		
		sql = "select * from book_member where id=?";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);

		rs = pst.executeQuery();
		
		if(rs.next()) {
			m_dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3));
		}
		
		close();
		
		return m_dto;
	}	
	
	public int join(String id, String pw, String nick, String email, String tel) throws Exception{
		getConnection();
		
		sql = "insert into book_member values(?,?,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, nick);
		pst.setString(4, email);
		pst.setString(5, tel);
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt;
	}
	
}
