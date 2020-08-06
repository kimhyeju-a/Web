package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.qna.vo.QnaVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * 계좌업무와 관련된 기능을 하는 클래스
 * 
 * @author kimhyeju
 *
 */
public class AccountDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";

	/**
	 * 새로운 계좌 등록
	 * 
	 * @param account 등록할 계좌
	 * @return 성공시 1을 리턴한다.
	 */
	public int newAccountNumber(AccountVO account) {
		StringBuilder sql = new StringBuilder();
		sql.append(
				"insert into a_account(account_no, user_no, account_number, account_pw, bank_name, balance, alias ) ");
		sql.append(" values(seq_a_account_no.nextval, ?, ?, ?, ?, ?, ? ) ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, account.getUserNo());
			pstmt.setString(2, account.getAccountNumber());
			pstmt.setString(3, account.getAccountPw());
			pstmt.setString(4, account.getBankName());
			pstmt.setInt(5, account.getBalance());
			pstmt.setString(6, account.getAlias());

			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 전체 계좌 조회
	 * 
	 * @return
	 */
	public List<AccountVO> selectAccountList(int userNo) {
		List<AccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(
				"select account_no, user_no, account_number, account_pw, bank_name, balance, alias, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("   from a_account ");
		sql.append(" order by reg_date ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccountNo(rs.getInt("account_no"));
				account.setUserNo(rs.getInt("user_no"));
				account.setAccountNumber(rs.getString("account_number"));
				account.setAccountPw(rs.getString("account_pw"));
				account.setBankName(rs.getString("bank_name"));
				account.setBalance(rs.getInt("balance"));
				account.setAlias(rs.getString("alias"));
				account.setRegDate(rs.getString("reg_date"));

				list.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 계좌정보가져옴
	 * 
	 * @param no
	 * @return account 정보
	 */
	public AccountVO selectByNo(int no) {
		AccountVO account = new AccountVO();
		StringBuilder sql = new StringBuilder();
		sql.append(
				"select account_no, user_no, account_number, account_pw, bank_name, balance, alias, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("   from a_account ");
		sql.append(" where account_no = ? ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				account.setAccountNo(rs.getInt("account_no"));
				account.setUserNo(rs.getInt("user_no"));
				account.setAccountNumber(rs.getString("account_number"));
				account.setAccountPw(rs.getString("account_pw"));
				account.setBankName(rs.getString("bank_name"));
				account.setBalance(rs.getInt("balance"));
				account.setAlias(rs.getString("alias"));
				account.setRegDate(rs.getString("reg_date"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}

	/**
	 * 별명 수정
	 * 
	 * @param alias     수정할 별명
	 * @param accountNo 수정할 계좌의 no
	 */
	public void updateAlias(String alias, int accountNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("update a_account");
		sql.append(" set alias = ? ");
		sql.append(" where account_no = ? ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, alias);
			pstmt.setInt(2, accountNo);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 계좌가 있는지 없는 지 확인
	 * 
	 * @param bankName
	 * @param accountNumber
	 * @return 있으면 accountNo 없으면 0
	 */
	public int checkAccountNumber(String bankName, String accountNumber) {
		StringBuilder sql = new StringBuilder();
		System.out.println("bankName : " + bankName + "accountNumber" + accountNumber);
		sql.append("select account_no ");
		sql.append("   from a_account ");
		sql.append(" where account_number = ? and bank_name = ? ");
		try (Connection conn = new ConnectionFactory().getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, accountNumber);
			pstmt.setString(2, bankName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int accountNo = rs.getInt("account_no");
				return accountNo;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 입금
	 * 
	 * @param accountNo : 계좌의 번호
	 * @param money     : 입금액
	 * @return : 성공실패
	 */
	public boolean deposit(int accountNo, int money) {
		boolean bool = false;
		StringBuilder sql = new StringBuilder();
		sql.append("update a_account ");
		sql.append("   set balance = balance + ? ");
		sql.append(" where account_no = ? ");
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql.toString());
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, money);
			pstmt.setInt(2, accountNo);
			System.out.println("deposit");
			pstmt.executeUpdate();
			conn.commit();
			bool = true;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return bool;
	}

	/**
	 * 출금 서비스
	 * 
	 * @param accountNo 출금할 계좌의 no
	 * @param money     출금액
	 * @param account   출금할 계좌의 정보
	 * @return 0 - 실패 / 1 - 성공 / 2 - 잔액부족
	 */
	public int withdraw(int accountNo, int money, AccountVO account) {
		int bool = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			int balance = account.getBalance();
			if (balance - money < 0) {
				return 2;
			}
			conn = new ConnectionFactory().getConnection();
			conn.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("update a_account ");
			sql.append("   set balance = balance - ? ");
			sql.append(" where account_no = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, money);
			pstmt.setInt(2, accountNo);

			pstmt.executeUpdate();
			conn.commit();
			bool = 1;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
				System.out.println("\t업무가 취소되었습니다. 다시시도해주세요.");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return bool;
	}

	/**
	 * 계좌이체 서비스
	 * @param fromAccount
	 * @param toAccount
	 * @param money
	 * @param account
	 * @return
	 */
	public boolean acivateTransFer(int fromAccount, int toAccount, int money, AccountVO account) {
		boolean bool = false;
		if(withdraw(fromAccount,money,account)==1) {
			if(deposit(toAccount, money)) {
				bool = true;
			}else {
				bool = false;
			}
		}
		
		return bool;
	}
}