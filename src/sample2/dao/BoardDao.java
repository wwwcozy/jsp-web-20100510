package sample2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sample2.bean.Board;
import sample2.bean.BoardDto;

public class BoardDao {
	
	
	private String url;
	private String user;
	private String password;
	
	public BoardDao() {
		this.url = "jdbc:mysql://54.180.138.71/test2";
		this.user = "root";
		this.password = "wnddkdwjdqhcjfl1";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} //한 번만 해주면 됨 (생성자에 저장)
	}

	public boolean insert(Board board) {
		String sql = "INSERT INTO Board "
				+ "(title, body, memberId) "
				+ "VALUES "
				+ "(?, ?, ?) "; // id, inserted는 자동으로 들어가니 생략
		
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql);
				){
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBody());
			pstmt.setString(3, board.getMemberId());
			
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public List<Board> list() {
		List<Board> list = new ArrayList<>();
		
		String sql = "SELECT id, title, memberId, inserted "
				+ "FROM Board "
				+ "ORDER BY id DESC";
		
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
					) {
				
			while (rs.next()) {
				Board board = new Board();
				board.setId(rs.getInt(1)); // 타입 신경쓰기!
				board.setTitle(rs.getString(2));
				board.setMemberId(rs.getString(3));
				board.setInserted(rs.getTimestamp(4));
					
				list.add(board);
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	public List<BoardDto> list2() {
		List<BoardDto> list = new ArrayList<>();
		
		String sql = "SELECT b.id boardId, "
				+ "			 b.title title, "
				+ "			 m.name name,"
				+ "			 b.inserted "
				+ "FROM Board b "
				+ "JOIN Member m "
				+ "ON b.memberId = m.id "
				+ "ORDER BY boardId DESC";
		
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
					) {
				
			while (rs.next()) {
				BoardDto board = new BoardDto();
				board.setBoardId(rs.getInt(1)); // 타입 신경쓰기!
				board.setTitle(rs.getString(2));
				board.setMemberName(rs.getString(3));
				board.setInserted(rs.getTimestamp(4));
					
				list.add(board);
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

// 게시판 글 상세페이지로 들어가기
	public Board get(int id) {
		String sql = "SELECT id, title, body, memberId, inserted "
				+ "FROM Board "
				+ "WHERE id = ? ";
		
		ResultSet rs = null;
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql);
			
				) {
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Board board = new Board();
				board.setId(id);
				board.setTitle(rs.getString(2));
				board.setBody(rs.getString(3));
				board.setMemberId(rs.getString(4));
				board.setInserted(rs.getTimestamp(5));
				
				return board;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	// 게시판 글 상세페이지로 들어가기 (id -> 이름으로 노출)	
	public BoardDto get2(int id) {
		String sql = "SELECT b.id boardId, "
				+ "			 b.title title, "
				+ "			 b.body body, "
				+ "			 m.name memberName, "
				+ "			 b.inserted "
				+ "FROM Board b JOIN Member m "
				+ "ON b.memberId = m.id "
				+ "WHERE b.id = ? ";
		
		ResultSet rs = null;
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql);
			
				) {
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				BoardDto board = new BoardDto();
				board.setBoardId(id);
				board.setTitle(rs.getString(2));
				board.setBody(rs.getString(3));
				board.setMemberName(rs.getString(4));
				board.setInserted(rs.getTimestamp(5));
				
				return board;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
}