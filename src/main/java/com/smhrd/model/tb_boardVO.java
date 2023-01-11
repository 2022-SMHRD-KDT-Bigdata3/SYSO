package com.smhrd.model;

public class tb_boardVO {
	
	private int b_num; //pk 
	private int sr_num;
	private String b_title;
	private String b_contents;
	private String b_ymd;
	private String user_id; //fk
	
	
	public tb_boardVO(int b_num, int sr_num, String b_title, String b_contents, String b_ymd, String user_id) {
		super();
		this.b_num = b_num;
		this.sr_num = sr_num;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_ymd = b_ymd;
		this.user_id = user_id;
	}


	public tb_boardVO() {
		super();
	}


	@Override
	public String toString() {
		return "tb_boardVO [b_num=" + b_num + ", sr_num=" + sr_num + ", b_title=" + b_title + ", b_contents="
				+ b_contents + ", b_ymd=" + b_ymd + ", user_id=" + user_id + "]";
	}


	public int getB_num() {
		return b_num;
	}


	public void setB_num(int b_num) {
		this.b_num = b_num;
	}


	public int getSr_num() {
		return sr_num;
	}


	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}


	public String getB_title() {
		return b_title;
	}


	public void setB_title(String b_title) {
		this.b_title = b_title;
	}


	public String getB_contents() {
		return b_contents;
	}


	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}


	public String getB_ymd() {
		return b_ymd;
	}


	public void setB_ymd(String b_ymd) {
		this.b_ymd = b_ymd;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	

}
