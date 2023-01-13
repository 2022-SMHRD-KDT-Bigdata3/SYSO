package com.smhrd.model;

public class tb_mysrVO {
	
	private int sr_num;
	private String user_id;
	private String sr_name;
	private String sr_joindate;
	private String sr_outdate;
	private String sb_num;


	public tb_mysrVO() {
		super();
	}

	





	public tb_mysrVO(int sr_num, String user_id) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
	}







	public tb_mysrVO(int sr_num, String user_id, String sr_name, String sb_num) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
		this.sr_name = sr_name;
		this.sb_num = sb_num;
	}



	public tb_mysrVO(int sr_num, String user_id, String sr_name, String joindate, String outdate, String sb_num) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
		this.sr_name = sr_name;
		this.sr_joindate = joindate;
		this.sr_outdate = outdate;
		this.sb_num = sb_num;
	}



	public tb_mysrVO(int sr_num, String user_id, String sr_name) {
		super();
		this.sr_num = sr_num;
		this.user_id = user_id;
		this.sr_name = sr_name;
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



	


	public String getSr_joindate() {
		return sr_joindate;
	}



	public void setSr_joindate(String sr_joindate) {
		this.sr_joindate = sr_joindate;
	}



	public String getSr_outdate() {
		return sr_outdate;
	}



	public void setSr_outdate(String sr_outdate) {
		this.sr_outdate = sr_outdate;
	}



	public String getSb_num() {
		return sb_num;
	}



	public void setSb_num(String sb_num) {
		this.sb_num = sb_num;
	}



	@Override
	public String toString() {
		return "tb_mysrVO [sr_num=" + sr_num + ", user_id=" + user_id + ", sr_name=" + sr_name + ", sr_joindate="
				+ sr_joindate + ", sr_outdate=" + sr_outdate + ", sb_num=" + sb_num + "]";
	}



	
	
	
}
