<%@page import="kr.ac.kopo.board.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveFolder = "C:/Lecture/web-workspace/Mission-WEB/WebContent/upload";
	MultipartRequest multi = new MultipartRequest(request, 
												saveFolder, 
												1024 * 1024 * 3, 
												"utf-8", 
												new KopoFileNamePolicy()
												);
	// 1단계 : 게시물 저장(t_board)
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	
	BoardDAO dao = new BoardDAO();

	//게시물 번호 추출(seq_t_board_no)
	int boardNo = dao.selectBoardNo();
	
	BoardVO board = new BoardVO();
	board.setNo(boardNo);
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	dao.insertBoard(board);
	
	
	// 2단계 : 첨부파일 저장(t_board_file)
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()){
		String fileName = files.nextElement();
		File f = multi.getFile(fileName);
		if(f != null) { // attachfile1 이나 attachfile2에 첨부된 파일이 있다면
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			
			int fileSize = (int)f.length(); // long형이기 때문에 묵시적 형변환을 해준다.
			
			BoardFileVO fileVO =new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo); 	//외래키에 해당 게시물번호
			
			dao.insertFile(fileVO);
		}
	}
	
/* 
	//1단계
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	//String writer = ((LoginVO)session.getAttribute("userVO")).getId();

	String content = request.getParameter("content");
	
	//2단계
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);
 */
%>
<%-- 3단계 --%>
<script>
	alert('게시판에 등록되었습니다.');
	location.href="list.jsp";
</script>