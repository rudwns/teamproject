package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

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
		if(rs!=null)rs.close();
		if(pst!=null)pst.close();
		if(conn!=null)conn.close();
	}	
	
	public MemberDTO selectMember(String nick) throws Exception{
		
		getConnection();
		
		sql = "select * from ssum_member where nickname=?";
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
		
		System.out.println(dto.getId()+"/"+dto.getPw()+"/"+dto.getNick()+"/"+dto.getPersonnumber()+"/"+dto.getSex());
		sql = "update ssum_member set pw=?,nickname=?,personnumber=?,sex=? where id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setString(1, dto.getPw());
		pst.setString(2, dto.getNick());
		pst.setString(3, dto.getPersonnumber());
		pst.setString(4, dto.getSex());
		pst.setString(5, dto.getId());
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt;
	}
	
	public MemberDTO login(String id, String pw) throws Exception{
		getConnection();
		
		sql = "select * from ssum_member where id=?";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);

		rs = pst.executeQuery();
		
		if(rs.next()) {
			m_dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3));
		}
		
		close();
		
		return m_dto;
	}	
	
	public int join(String id, String pw, String nick, String personnumber, String sex) throws Exception{
		getConnection();
		
		sql = "insert into ssum_member values(?,?,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, nick);
		pst.setString(4, personnumber);
		pst.setString(5, sex);
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt;
	}

	public int delete(String id) throws Exception{
		getConnection();
		pst = conn.prepareStatement("delete from ssum_member where id=?");
		pst.setString(1, id);
		int cnt = pst.executeUpdate();
		return cnt;
	}

	
	
}
