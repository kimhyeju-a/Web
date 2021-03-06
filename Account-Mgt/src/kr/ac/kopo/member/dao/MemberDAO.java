package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * a_member 와 관련된 회원등록, 수정, 삭제, 조회 기능을 하는 클래스
 * 
 * @author kimhyeju
 *
 */
public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";

	/**
	 * 새로운 멤버 등록
	 * 
	 * @param member 등록할 멤버
	 */
	public void insertMember(MemberVO member) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_member(member_no, id, password, name, jumin, email, phone_no ) ");
		sql.append(" values(seq_a_member_no.nextval, ?, ?, ?, ?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhoneNo());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * Login관련 DAO
	 * @param loginVO(id,password)
	 * @return 값이 있으면 userVO , 없으면 null
	 */
	public MemberVO login(MemberVO loginVO) {

		MemberVO userVO = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select id, type, name, member_no, phone_no, email ");
		sql.append(" from a_member ");
		sql.append(" where id = ? and password = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());

			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setType(rs.getString("type"));
				userVO.setName(rs.getString("name"));
				userVO.setMemberNo(rs.getInt("member_no"));
				userVO.setPhoneNo(rs.getString("phone_no"));
				userVO.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userVO;
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

			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return false;
	}
	
	/**
	 * 글 수정, 삭제를 했을 때 패스워드가 맞는지 확인 - qna와 관련된 클래스
	 * @param password 입력한 패스워드
	 * @return true-패스워드가 맞음, false-패스워드가 틀림
	 */
	public boolean passwordCheck(String password, int memberNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id ");
		sql.append(" from a_member ");
		sql.append(" where password = ? and member_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, password);
			pstmt.setInt(2, memberNo);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 주민번호는 unique이므로 중복이 안됨. 중복검사
	 * @param jumin 입력한 주민
	 * @return true- 있음, false- 없음
	 */
	public boolean juminCheck(String jumin) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id ");
		sql.append("  from a_member ");
		sql.append(" where jumin = ? ");
		System.out.println("jumin : " + jumin);
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, jumin);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("주민있음");
				return true;
			}else {
				System.out.println("주민없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean modifyMember(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("update a_member ");
		sql.append(" set name = ?, email = ? , phone_no = ? ");
		sql.append(" where member_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			System.out.println("modifyMember : " + member.getName());
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhoneNo());
			pstmt.setInt(4, member.getMemberNo());
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * memberNo 로 select
	 */
	public MemberVO selectOneMebmer(int memberNo) {

		MemberVO userVO = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select id, type, name, member_no, phone_no, email ");
		sql.append(" from a_member ");
		sql.append(" where member_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, memberNo);

			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setType(rs.getString("type"));
				userVO.setName(rs.getString("name"));
				userVO.setMemberNo(rs.getInt("member_no"));
				userVO.setPhoneNo(rs.getString("phone_no"));
				userVO.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userVO;
	}
	
	/**
	 * 회원탈퇴
	 * @param member 탈퇴할 회원
	 * @return
	 */
	public boolean deleteMember(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete ");
		sql.append(" from a_member ");
		sql.append(" where member_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, member.getMemberNo());
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
