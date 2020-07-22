package kr.ac.kopo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * Database t_board와 관련된 게시판 등록, 수정, 삭제, 조회 기능 클래스
 * 
 * @author HP
 *
 */
public class BoardDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";

	/**
	 * 게시물 번호에 해당 게시물 조회 서비스
	 * 
	 * @param no 조회할 번호
	 * @return 해당 게시물
	 */
	public BoardVO selectByNo(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;
		SimpleDateFormat allFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH시mm분ss초");
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = dayFormat.format(date);
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd hh:mi:ss') as reg_date ");
			sql.append("   from t_board ");
			sql.append(" where no = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Date check = allFormat.parse(rs.getString("reg_date"));
				String dbDay = dayFormat.format(check);
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = "";
				if(today.compareTo(dbDay) == 0) {
					regDate = timeFormat.format(check);
				}else {
					regDate = dbDay;
				}

				board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);

				// board = new BoardVO();
				/*
				 * board.setNo(boardNo); board.setTitle(title); board.setWriter(writer);
				 * board.setContent(content); board.setViewCnt(viewCnt);
				 * board.setRegDate(regDate);
				 */
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return board;
	}

	public List<BoardVO> selectAllBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<BoardVO> list = new ArrayList<>();
	
		SimpleDateFormat allFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH시mm분ss초");
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = dayFormat.format(date);
		try {
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd hh:mi:ss') as reg_date ");
			sql.append("   from t_board ");
			sql.append(" order by no ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				/* String regDate = rs.getString("reg_date"); */
				//오늘 등록한 게시물 시간으로 변환
				String regDate = "";
				Date check = allFormat.parse(rs.getString("reg_date"));
				String dbDay = dayFormat.format(check);
				if(today.compareTo(dbDay) == 0) {
					regDate = timeFormat.format(check);
				}else {
					regDate = dbDay;
				}
				
				BoardVO board = new BoardVO(no, title, writer, regDate);
				list.add(board);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return list;
	}
	
	/**
	 * 새로운 게시물 등록서비스
	 */
	public void insertBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no,title,writer,content) ");
			sql.append(" values(seq_t_board_no.nextval, ?, ?, ? ) ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
	}
	

	/**
	 * 게시판 삭제 서비스 
	 * @param no 삭제할 게시물 번호
	 */
	public void deleteBoard(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			
			StringBuilder sql = new StringBuilder();
			sql.append("delete t_board ");
			sql.append(" where no = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
	}
	
}
