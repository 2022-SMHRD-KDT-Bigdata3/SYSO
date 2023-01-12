package com.smhrd.model;

public class tb_mysrVO {
	
	private int sr_num;
	private String user_id;
	private String sr_name;
	private String joindate;
	private String outdate;



	public tb_mysrVO(int sr_num, String user_id, String sr_name) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
		this.sr_name = sr_name;
	}

	public tb_mysrVO(int sr_num, String user_id, String sr_name, String joindate, String outdate) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
		this.sr_name = sr_name;
		this.joindate = joindate;
		this.outdate = outdate;
	}

	public tb_mysrVO() {
		super();
	}

	@Override
	public String toString() {
		return "tb_mysrVO [sr_num=" + sr_num + ", user_id=" + user_id + ", sr_name=" + sr_name + ", joindate="
				+ joindate + ", outdate=" + outdate + "]";
	}

	public int getSr_num() {
		return sr_num;
	}

	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSr_name() {
		return sr_name;
	}

	public void setSr_name(String sr_name) {
		this.sr_name = sr_name;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	
	
}
