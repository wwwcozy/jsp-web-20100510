package CH14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JDBC05Servlet
 */
@WebServlet("/JDBC05Servlet")
public class JDBC05Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC05Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		executeJDBC();
		
		response.getWriter().print("<h1>jdbc05</h1>");
	}

	private void executeJDBC() {
		
		String sql = "SELECT DISTINCT City FROM Customers ORDER BY City";
				
		
		String url = "jdbc:mysql://54.180.138.71/test"; //본인 ip
		String user = "root";
		String password = "wnddkdwjdqhcjfl1";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		try {
			// 클래스 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 연결 (연결을 돕는 클래스 : 드라이버매니저)
			con = DriverManager.getConnection(url, user, password);
			
			// statement 생성
			stmt = con.createStatement();
			
			// 쿼리 실행, 결과(ResulSet) 리턴
			rs = stmt.executeQuery(sql);
			
			// 결과 탐색 (여러번 실행할 때)
			while (rs.next()) {
				String city = rs.getString(1);
			
				System.out.println(city);
			
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		
			// 연결 닫기
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}		
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
