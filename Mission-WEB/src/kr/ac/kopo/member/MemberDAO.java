package kr.ac.kopo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * t_member와 관련된 회원등록, 수정, 삭제, 조회 기능 클래스
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
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_member(id,name,password,email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr, type) ");
			sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? ) ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getEmailId());
			pstmt.setString(5, member.getEmailDomain());
			pstmt.setString(6, member.getTel1());
			pstmt.setString(7, member.getTel2());
			pstmt.setString(8, member.getTel3());
			pstmt.setString(9, member.getPost());
			pstmt.setString(10, member.getBasicAddr());
			pstmt.setString(11, member.getDetailAddr());
			pstmt.setString(12, member.getType());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(conn, pstmt);
		}
	}
	
	/**
	 * 모든 회원 조회
	 * @return 모든회원리스트
	 */
	public List<MemberVO> selectAllMember(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			sql.append("select id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr, type, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("  from t_member ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basicAddr = rs.getString("basic_addr");
				String detailAddr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
				
				MemberVO member = new MemberVO(id, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr, detailAddr, type, regDate );
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return list;
	}
	
	public MemberVO selectById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberVO member = null;
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			sql.append("select id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr, type, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("  from t_member ");
			sql.append(" where id = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String memberId = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basicAddr = rs.getString("basic_addr");
				String detailAddr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
				
				member = new MemberVO(memberId, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr, detailAddr, type, regDate );
			}
		} catch (Exception e) {
			
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return member;
	}
	

	/**
	 * 회원 탈퇴 서비스 
	 * @param id 탈퇴할 회원 아이디
	 */
	public void deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			
			StringBuilder sql = new StringBuilder();
			sql.append("delete t_member ");
			sql.append(" where id = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
	}
}
