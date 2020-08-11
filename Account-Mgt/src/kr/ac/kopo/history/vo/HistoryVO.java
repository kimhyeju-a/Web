package kr.ac.kopo.history.vo;

public class HistoryVO {
	private int accountNo;
	private String accountNumber;
	private int deposit;
	private int withdraw;
	private int sender;
	private int balance;
	private String senderName;
	private String senderId;
	private String sentDate;
	
	
	public HistoryVO() {
		super();
	}
	
	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	
	
}
