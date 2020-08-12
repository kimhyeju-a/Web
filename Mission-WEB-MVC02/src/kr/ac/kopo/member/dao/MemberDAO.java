package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	public MemberVO login(MemberVO memberVO) {
		
		MemberVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, type ");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, memberVO.getId());
			pstmt.setString(2, memberVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setType(rs.getString("type"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}
