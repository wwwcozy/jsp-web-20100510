package sample2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sample2.bean.Member;

//기본값 설정
public class MemberDao {
	private String url;
	private String user;
	private String password;
	
	public MemberDao() {
		this.url = "jdbc:mysql://54.180.138.71/test2";
		this.user = "root";
		this.password = "wnddkdwjdqhcjfl1";
		
		//jdbc드라이버 로딩 - 데이터 베이스 연결 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} //한 번만 해주면 됨 (생성자에 저장)
	}
// 여기까지
	
// 회원등록
	public boolean insert(Member member) {
		String sql = "INSERT INTO Member "
				+ "(id, password, name, birth, inserted) "
				+ "VALUES "
				+ "(?, ?, ?, ?, NOW()) ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {//익셉션이 발생할 수 있는 코드 작성, 익셉션 발생시 다음 코드 실행하지 않고, 캐치문으로 이동 
			
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setDate(4, member.getBirth());
			
			int cnt = pstmt.executeUpdate();
			
			if (cnt == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//최종적으로 실행되는 코드 
			if (pstmt != null) {
				try {
					pstmt.close();  // 사용한 시스템 자원 반납코드
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close(); // 사용한 시스템 자원 반납코드
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}

//회원목록
	public List<Member> list() {
		List<Member> list = new ArrayList<>();
		
		String sql = "SELECT id, password, name, birth, inserted "
				+ "FROM Member";
		
		try (
				Connection con = DriverManager.getConnection(url, user, password); // 커넥션 연결
				Statement stmt = con.createStatement(); // 쿼리 실행을 위한 stmt 객체 생성
				ResultSet rs = stmt.executeQuery(sql); // 쿼리 실행
					) {
				
				while (rs.next()) { //rs.next() : 다음 행이 존재하면 true 리턴, 다음행으로 커서이동 / 마지막행 이후 false 리턴
					
					// Member bean에 값 저장 (rs.데이터읽기메소드)
					Member member = new Member();
					member.setId(rs.getString(1));
					member.setPassword(rs.getString(2));
					member.setName(rs.getString(3));
					member.setBirth(rs.getDate(4));
					member.setInserted(rs.getTimestamp(5));
					
					list.add(member);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
		return list;
	}
//회원 정보 : 사용X
	public Member getMember(String id) {
		String sql = "SELECT id, password, name, birth, inserted "
				+ "FROM Member "
				+ "WHERE id = ?"; //pstmt라, 값은 ?로 임의 지정 나중에 값에 대한 내용 추가
		
		ResultSet rs = null;
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql); //stmt와 동일한 기능, 쿼리 틀 먼저 생성, 값 나중에 지정 
				) {
			pstmt.setString(1, id); // 값 지정 (순서, 값)
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getDate(4));
				member.setInserted(rs.getTimestamp(5));
				
				return member;
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
	//회원 정보 : 사용X - 게시물, 댓글 갯수 한 번에 가져올 때 사용하는 메소드
	public Member getMember2(String id) {
		String sql = "SELECT m.id,"
				+ "          m.password,"
				+ "          m.name,"
				+ "          m.birth,"
				+ "          m.inserted,"
				+ "          count(DISTINCT b.id) numberOfBoard,"
				+ "          count(DISTINCT c.id) numberOfComment "
				+ "FROM Member m LEFT JOIN Board b ON m.id = b.memberId "
				+ "     LEFT JOIN Comment c ON m.id = c.memberId "
				+ "WHERE m.id = ?"; //pstmt라, 값은 ?로 임의 지정 나중에 값에 대한 내용 추가
		
		ResultSet rs = null;
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql); //stmt와 동일한 기능, 쿼리 틀 먼저 생성, 값 나중에 지정 
				) {
			pstmt.setString(1, id); // 값 지정 (순서, 값)
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getDate(4));
				member.setNumberOfBoard(rs.getInt(6));
				member.setNumberOfComment(rs.getInt(7));
				
				return member;
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
	
	
	
//회원정보 수정
	public boolean update(Member member) {
		String sql = "UPDATE Member "
				+ "SET password = ?, "
				+ "    name = ?, "
				+ "    birth = ? "
				+ "WHERE id = ? ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setDate(3, member.getBirth());
			pstmt.setString(4, member.getId());
			
			int cnt = pstmt.executeUpdate();
			
			if (cnt > 0) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}
// 회원 탈퇴
	public void remove(String id, Connection con) {

		String sql = "DELETE FROM Member WHERE id = ?";
		
		try (
			
			PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
// 회원 아이디 중복여부
	public boolean existsId(String id) {
		String sql = "SELECT id FROM Member WHERE id = ?";
		
		ResultSet rs = null;
		try (
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}

	
	// 회원정보 : 사용O - 게시물, 댓글 갯수 각각 가져올 때 사용하는 메소드
	public Member getMember(String id, Connection con) {
		String sql = "SELECT id, password, name, birth, inserted "
				+ "FROM Member "
				+ "WHERE id = ?"; //pstmt라, 값은 ?로 임의 지정 나중에 값에 대한 내용 추가
		
		ResultSet rs = null;
		try ( //커넥션 삭제처리함, 서비스에서 제공
			PreparedStatement pstmt = con.prepareStatement(sql); //stmt와 동일한 기능, 쿼리 틀 먼저 생성, 값 나중에 지정 
				) {
			pstmt.setString(1, id); // 값 지정 (순서, 값)
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getDate(4));
				member.setInserted(rs.getTimestamp(5));
				
				return member;
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













