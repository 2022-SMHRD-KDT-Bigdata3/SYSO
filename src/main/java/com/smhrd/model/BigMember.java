package com.smhrd.model;

public class BigMember {
	private String id;
	private String pw;
	private String nick;
	
	public BigMember(String id, String pw, String nick) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}

	public BigMember() {
		super();
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getNick() {
		return nick;
	}

	@Override
	public String toString() {
		return "BigMember [id=" + id + ", pw=" + pw + ", nick=" + nick + "]";
	}
	
	
}
