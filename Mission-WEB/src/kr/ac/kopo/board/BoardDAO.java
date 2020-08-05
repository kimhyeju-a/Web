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
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') ");
			sql.append("			  		then to_char(reg_date, 'hh24:mi:ss') ");
			sql.append("					else to_char(reg_date, 'yyyy-mm-dd') ");
			sql.append("		 end as reg_date ");
			sql.append("   from t_board ");
			sql.append(" where no = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

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
	
		try {
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') ");
			sql.append("			  		then to_char(reg_date, 'hh24:mi:ss') ");
			sql.append("					else to_char(reg_date, 'yyyy-mm-dd') ");
			sql.append("		 end as reg_date ");
			sql.append("   from t_board ");
			sql.append(" order by no ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
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
			sql.append(" values(?, ?, ?, ? ) ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
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
	
	
	/**
	 * seq_t_board_no 생성하는 기능
	 * @return seq_t_board_no 반환
	 */
	public int selectBoardNo() {
		
		String sql = "select seq_t_board_no.nextval from dual";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 조회수 증가 서비스
	 * @param no
	 */
	public void incrementViewCnt(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append("   set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//////////////////////////////////////////////////////////////////
	//					첨부파일 crud									//
	//////////////////////////////////////////////////////////////////
	
	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file(no, board_no, file_ori_name, file_save_name, file_size) ");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, fileVO.getBoardNo());
			pstmt.setString(2, fileVO.getFileOriName());
			pstmt.setString(3, fileVO.getFileSaveName());
			pstmt.setInt(4, fileVO.getFileSize());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardFileVO> selectFileByNo(int boardNo){
		
		List<BoardFileVO> fileList = new ArrayList<BoardFileVO>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append(" from t_board_file ");
		sql.append(" where board_no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, boardNo);
			ResultSet rs =pstmt.executeQuery();
			
			while(rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setBoardNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				
				fileList.add(fileVO);
			}
			
		} catch (Exception e) {
		}
		
		return fileList;
	}
}
