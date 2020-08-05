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
		sql.append("select board_no, group_no, group_order, depth, title, writer, content, view_cnt, reg_date ");
		sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("                   then to_char(reg_date, 'hh24:mi:ss') ");
		sql.append("                   else to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("         end as reg_date_format ");
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
				qna.setFormatRegDate(rs.getString("reg_date_format"));
				list.add(qna);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 원글(부모글) insert
	 * 부모글은 depth가 1이고, group_order도 1이다.
	 * @param qna 삽입할 내용
	 */
	public void insertOriQna(QnaVO qna) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_qna(board_no, group_no, group_order, depth, title, writer, writer_id, content) ");
		sql.append(" values(seq_a_qna_no.nextval,seq_a_qna_no.currval, 1, 1, ?, ?, ?, ?) ");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, qna.getTitle());
			pstmt.setString(2, qna.getWriter());
			pstmt.setString(3, qna.getWriterId());
			pstmt.setString(4, qna.getContent());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 게시물 상세보기
	 * @param no 상세보기를 할 번호
	 * @return 상세보기 내용
	 */
	public QnaVO selectByNo(int no) {
		List<QnaVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select board_no, group_no, group_order, depth, title, writer, content, view_cnt, reg_date ");
		sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("                   then to_char(reg_date, 'hh24:mi:ss') ");
		sql.append("                   else to_char(reg_date, 'yyyy-mm-dd') ");
		sql.append("         end as reg_date_format ");
		sql.append("   from a_qna ");
		sql.append(" where board_no = ? ");
		QnaVO qna = new QnaVO();
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				qna.setBoardNo(rs.getInt("board_no"));
				qna.setGroupNo(rs.getInt("group_no"));
				qna.setGroupOrder(rs.getInt("group_order"));
				qna.setDepth(rs.getInt("depth"));
				qna.setTitle(rs.getString("title"));
				qna.setWriter(rs.getString("writer"));
				qna.setContent(rs.getString("content"));
				qna.setViewCnt(rs.getInt("view_cnt"));
				qna.setRegDate(rs.getString("reg_date"));
				qna.setFormatRegDate(rs.getString("reg_date_format"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return qna;
	}

	/**
	 * 조회수 증가
	 * @param no 증가할 게시판의 번호
	 */
	public void incrementViewCnt(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("update a_qna");
		sql.append(" set view_cnt = view_cnt + 1 ");
		sql.append(" where board_no = ? ");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 부모글의 depth와 Group_order를 구한다.
	 * @param no 부모글의 no
	 * @return depth와 grouporder
	 */
	public QnaVO selectDepthGroupOrder(int no) {
		List<QnaVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select depth, group_no, group_order ");
		sql.append("   from a_qna ");
		sql.append(" where board_no = ? ");
		QnaVO qna = new QnaVO();
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				qna.setDepth(rs.getInt("depth"));
				qna.setGroupNo(rs.getInt("group_no"));
				qna.setGroupOrder(rs.getInt("group_order"));
				list.add(qna);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return qna;
	}
	/**
	 * 부모글의 같은 그룹을 가지고 있는 게시물이고, group_order가 부모글보다 큰 것의
	 *  								groupOrder의 수를 증가한다.
	 * @param qna depth와 groupOrder, groupNo 를 가지고 있는 객체
	 */
	public void updateGroupOrder(QnaVO qna) {
		StringBuilder sql = new StringBuilder();
		sql.append("update a_qna");
		sql.append(" set group_order = group_order + 1 ");
		sql.append(" where group_no = ? and group_order > ?");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			System.out.println("updateGroupOrder : " + qna.getGroupNo());
			pstmt.setInt(1, qna.getGroupNo());
			pstmt.setInt(2, qna.getGroupOrder());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param qna reply insert할 게시물 내용
	 * @param parentQna 부모글의 depth와 group_no, group_order
	 */
	public void insertReplyQna(QnaVO qna, QnaVO parentQna) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_qna(board_no, group_no, group_order, depth, title, writer, content) ");
		sql.append(" values(seq_a_qna_no.nextval,?, ?, ?, ?, ?, ?) ");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, parentQna.getGroupNo());
			pstmt.setInt(2, parentQna.getGroupOrder()+1);
			pstmt.setInt(3, parentQna.getDepth()+1);
			pstmt.setString(4, qna.getTitle());
			pstmt.setString(5, qna.getWriter());
			pstmt.setString(6, qna.getContent());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 시퀀스의 current값을 가져오기 위한 함수
	 * @return
	 */
	public int selectSequenceNo() {
		int seqNo = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("select last_number from user_sequences where sequence_name = 'SEQ_A_QNA_NO' ");
		QnaVO qna = new QnaVO();
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				seqNo = rs.getInt("last_number");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return seqNo;
	}
}
