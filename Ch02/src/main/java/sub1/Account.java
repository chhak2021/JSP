package sub1;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String id;
	private String name;
	private int balance;
	
	public Account(String bank, String id, String name, int balance) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.balance = balance;
	}
	
	public void deposit(int money) {
		this.balance += money;
	}
	
	public void withdraw(int money) {
		this.balance -= money;
	}
	
	public void show(JspWriter out) throws IOException {
		out.println("<p>");
		out.println("은행명 : "+bank+"<br/>");
		out.println("계좌번호 : "+id+"<br/>");
		out.println("입금주 : "+name+"<br/>");
		out.println("현재잔액 : "+balance+"<br/>");		
		out.println("</p>");		
	}
	
}
