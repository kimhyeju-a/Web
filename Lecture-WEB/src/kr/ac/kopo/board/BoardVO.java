package kr.ac.kopo.board;

public class BoardVO {

	private int no;
	private String title;
	private int viewCnt;
	
	public BoardVO () {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewCnt() {
//		return viewCnt;
		return 365;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
}
