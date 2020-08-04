package kr.ac.kopo.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.qna.vo.QnaVO;
import kr.ac.kopo.util.ConnectionFactory;

/**
 * Q&A 게시판과 관련된 기능을 하는 클래스 
 * @author HP
 *
 */
public class QnaDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	
	/**
	 * 목록출력
	 * @return 목록 
	 */
	public List<QnaVO> selectQna() {
		List<QnaVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select board_no, group_no, group_order, depth, title, writer, content, view_cnt ");
		sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("			  		then to_char(reg_date, 'hh24:mi:ss') ");
		sql.append("					else to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("		 end as reg_date ");
		sql.append("   from a_qna ");
		sql.append(" order by group_no, group_order ");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaVO qna = new QnaVO();
				qna.setBoardNo(rs.getInt("board_no"));
				qna.setGroupNo(rs.getInt("group_no"));
				qna.setGroupOrder(rs.getInt("group_order"));
				qna.setDepth(rs.getInt("depth"));
				qna.setTitle(rs.getString("title"));
				qna.setWriter(rs.getString("writer"));
				qna.setContent(rs.getString("content"));
				qna.setViewCnt(rs.getInt("view_cnt"));
				qna.setRegDate(rs.getString("reg_date"));
				list.add(qna);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
