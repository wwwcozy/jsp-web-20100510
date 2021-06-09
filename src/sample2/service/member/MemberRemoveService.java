package sample2.service.member;

import java.sql.Connection;

import sample2.dao.BoardDao;
import sample2.dao.MemberDao;
import sample2.util.DBConnection;

public class MemberRemoveService {
	private BoardDao bdao;
	private MemberDao mdao;

	public MemberRemoveService() {
		this.bdao = new BoardDao();
		this.mdao = new MemberDao();
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
