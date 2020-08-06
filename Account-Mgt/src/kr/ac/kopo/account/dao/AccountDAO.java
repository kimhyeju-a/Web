package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.qna.vo.QnaVO;
import kr.ac.kopo.util.ConnectionFactory;

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
		sql.append("insert into a_account(account_no, user_no, account_number, account_pw, bank_name, balance, alias ) ");
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

	public List<AccountVO> selectAccountList(int userNo) {
		List<AccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select account_no, user_no, account_number, account_pw, bank_name, balance, alias, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("   from a_account ");
		sql.append(" order by reg_date ");
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
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
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 전체 계좌 조회
	 * @return
	 */
	

}
