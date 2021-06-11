package sample2.service.member;

import java.sql.Connection;

import sample2.bean.Member;
import sample2.dao.BoardDao;
import sample2.dao.CommentDao;
import sample2.dao.MemberDao;
import sample2.util.DBConnection;

public class MemberService {
	private BoardDao bdao;
	private MemberDao mdao;
	private CommentDao cdao;
	
	public MemberService() {
		this.bdao = new BoardDao();
		this.mdao = new MemberDao();
		this.cdao = new CommentDao();
	}
	
	// 메소드 
	public Member getMember(String id) {
	
		Connection con = null; //커넥션 객체 만들기
		
		try {
			con = DBConnection.getConnection(); //커넥션 객체를 얻어오기
			Member member = this.mdao.getMember(id, con); // 멤버다오에게 작성자 아이디 기준으로 멤버 가져오도록 시킴
			int numBoard = this.bdao.getNumberOfBoard(id, con); // 보드다오에게 작성자 아이디 기준으로 글 갯수 가져오도록 시킴
			int numComment = this.cdao.getNumberOfComment(id, con); // 코멘트 다오에게 작성자 아이디 기준으로 코멘트 작성자 수를 가져오도록 시킴 
			//서비스한테 일 시킬 때, 서비스가 얻어온 커넥션을 각 다오에게 건네주기로 했으니 마지막 파라미터에 넣어줘야 함
			
			member.setNumberOfBoard(numBoard);
			member.setNumberOfComment(numComment);
			
			return member;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(con);
		}
		
		return null;
		
	}

	public void remove(String id) {

		Connection con = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);

			// 게시물 먼저 지우기
			this.bdao.removeByMember(id, con);
			// 회원 정보 지우기
			this.mdao.remove(id, con);

			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			DBConnection.rollback(con);
		} finally {
			DBConnection.close(con);
		}
	}
}
