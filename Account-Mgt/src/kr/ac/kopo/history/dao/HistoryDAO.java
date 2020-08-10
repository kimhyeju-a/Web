package kr.ac.kopo.history.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.util.ConnectionFactory;

public class HistoryDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	
	/**
	 * 그냥 입금을 통한 history
	 * @param history 입금을 한 계좌 정보
	 * @param money 입금액
	 */
	public void depositHistory(AccountVO history, int money) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_history(account_no, deposit, balance ) ");
		sql.append(" values(?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, history.getAccountNo());
			pstmt.setInt(2, money);
			pstmt.setInt(3, history.getBalance());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	/**
	 * 그냥 출금을 통한 history
	 * @param history 출금한 계좌정보
	 * @param money 출금액
	 */
	public void withdrawHistory(AccountVO history, int money) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_history(account_no, withdraw, balance ) ");
		sql.append(" values(?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, history.getAccountNo());
			pstmt.setInt(2, money);
			pstmt.setInt(3, history.getBalance());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}				
	}
	
	/**
	 * 계좌이체시 입금받는 쪽 history
	 * @param history
	 * @param money
	 * @param toAccountVO
	 */
	public void depositHistory(AccountVO history, int money, AccountVO fromAccountVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_history(account_no, deposit, balance, sender ) ");
		sql.append(" values(?, ?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, history.getAccountNo());
			pstmt.setInt(2, money);
			pstmt.setInt(3, history.getBalance());
			pstmt.setInt(4, fromAccountVO.getUserNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}				
	}
	
	/**
	 * 계좌이체시 출금하는 쪽 history
	 * @param history
	 * @param money
	 * @param toAccountVO
	 */
	public void withdrawHistory(AccountVO history, int money, AccountVO toAccountVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into a_history(account_no, withdraw, balance, sender ) ");
		sql.append(" values(?, ?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, history.getAccountNo());
			pstmt.setInt(2, money);
			pstmt.setInt(3, history.getBalance());
			pstmt.setInt(4, toAccountVO.getUserNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
}
