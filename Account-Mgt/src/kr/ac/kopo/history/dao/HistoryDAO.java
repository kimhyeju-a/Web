package kr.ac.kopo.history.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.history.vo.HistoryVO;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;
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
	public List<HistoryVO> selectHistoryList(int accountNo) {
		List<HistoryVO> list = new ArrayList<>();
		HistoryVO historyVO = null;
		AccountDAO dao = new AccountDAO();
		AccountVO accountVO = null;
		MemberDAO member = new MemberDAO();
		MemberVO memberVO =null;
		StringBuilder sql = new StringBuilder();
		sql.append("select account_no, deposit, withdraw, balance, sender, to_char(sent_date,'yyyy-mm-dd hh24:mi:ss') as sent_date ");
		sql.append(" from a_history ");
		sql.append(" where account_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, accountNo);

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				historyVO = new HistoryVO();
				historyVO.setAccountNo(rs.getInt("account_no"));
				accountVO = dao.selectByNo(rs.getInt("account_no"));
				historyVO.setAccountNumber(accountVO.getAccountNumber());
				historyVO.setDeposit(rs.getInt("deposit"));
				historyVO.setWithdraw(rs.getInt("withdraw"));
				historyVO.setBalance(rs.getInt("balance"));
				historyVO.setSender(rs.getInt("sender"));
				if(rs.getInt("sender") == 0) {
					historyVO.setSenderId("혜주은행atm");
					historyVO.setSenderName("혜주은행atm");
				}else {
					memberVO = member.selectOneMebmer(rs.getInt("sender"));
					historyVO.setSenderName(memberVO.getName());
					historyVO.setSenderId(memberVO.getId());
					historyVO.setSentDate(rs.getString("sender"));
				}
				historyVO.setSentDate(rs.getString("sent_date"));
				list.add(historyVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
}
