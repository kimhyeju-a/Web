package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javafx.beans.binding.StringBinding;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * a_member 와 관련된 회원등록, 수정, 삭제, 조회 기능을 하는 클래스
 * @author kimhyeju
 *
 */
public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	

	/**
	 * 새로운 멤버 등록
	 * @param member 등록할 멤버
	 */
	public void insertMember(MemberVO member) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_member(member_no, id, password, name, jumin, email, phone_no ) ");
		sql.append(" values(seq_a_member_no.nextval, ?, ?, ?, ?, ?, ? ) ");
		try(
				Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhoneNo());
			
			pstmt.executeQuery();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 아이디 중복체크
	 * @param id
	 * @return true : 아이디 있음 , false : 아이디 없음
	 */
	public boolean idCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			
			StringBuilder sql = new StringBuilder();
			sql.append("select id ");
			sql.append("  from a_member ");
			sql.append(" where id = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return false;
	}
}
