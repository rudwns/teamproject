package com.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class BoardDAO {
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
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
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
	
	public int insertBoard(String title, String writer, String content) throws Exception{
		
		getConnection();
		
		sql = "insert into board values(board_num.nextval,?,?,?,sysdate,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, title);
		pst.setString(2, writer);
		pst.setString(3, content);
		pst.setInt(4, 0);
		pst.setInt(5, 0);
		pst.setInt(6, 0);
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt; 
	}
	
	
	
	public BoardDTO selectBoardOne(int num) throws Exception{
		
		getConnection();
		
		//글검색
		ArrayList<BoardDTO> tmpList = new ArrayList<BoardDTO>();
		
		sql = "select * from board where num=?";
		
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		rs = pst.executeQuery();
		
		if(rs.next()) {
			b_dto = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
			
/*			System.out.println("번호: "+rs.getInt(1));
			System.out.println("제목: "+rs.getString(2));
			System.out.println("닉네임: "+rs.getString(3));
			System.out.println("내용: "+rs.getString(4));
			System.out.println("날짜: "+rs.getString(5));
			System.out.println("조회: "+rs.getString(6));*/
		}
		
		close();
		return b_dto; 
	}
	
	public ArrayList<BoardDTO> selectBoardAll() throws Exception{
		
		getConnection();
		
		ArrayList<BoardDTO> tmpList = new ArrayList<BoardDTO>();
		
		sql = "select * from board";
		
		pst = conn.prepareStatement(sql);
		
		rs = pst.executeQuery();
		
		while(rs.next()) {
			tmpList.add(new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
			
/*			System.out.println("번호: "+rs.getInt(1));
			System.out.println("제목: "+rs.getString(2));
			System.out.println("닉네임: "+rs.getString(3));
			System.out.println("내용: "+rs.getString(4));
			System.out.println("날짜: "+rs.getString(5));
			System.out.println("조회: "+rs.getString(6));*/
		}
		
		close();
		return tmpList; 
	}

	public int updateContent(int num, String title, String content) throws Exception {

		getConnection();
		
		sql = "update board set title=?, content=? where num=?";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, title);
		pst.setString(2, content);
		pst.setInt(3, num);
		
		cnt = pst.executeUpdate();
		
		close();
		
		return cnt;
	}

	public int deleteContent(int num)  throws Exception{

		getConnection();
		
		sql = "delete from board where num=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		cnt = pst.executeUpdate();
		
		close();
		return cnt;
	}
	
	public void updateHit(int num) throws Exception {
		
		getConnection();
		//조회수 증가
		sql = "update board set hit=hit+1 where num=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		cnt = pst.executeUpdate();
		close();
		
	}
	public void likeer(int num) throws Exception{
		getConnection();
		//좋아요 증가
		sql = "update board set likeer=likeer+1 where num=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		cnt = pst.executeUpdate();
		close();
		
		
	}

	public void hate(int num) throws Exception{
		getConnection();
		//싫어요 증가
		sql = "update board set hate=hate+1 where num=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		cnt = pst.executeUpdate();
		close();
		
		
	}

}
