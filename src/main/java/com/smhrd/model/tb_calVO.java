package com.smhrd.model;

public class tb_calVO {
	
	private String user_id;
	private int groupid;
	private String title;
	private String writer;
	private String content;
	private String start1;
	private String end1;
	private int allday;
	private String textcolor;
	private String backgroundcolor;
	private String bordercolor;
	
	
	@Override
	public String toString() {
		return "tb_calVO [user_id=" + user_id + ", groupid=" + groupid + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", start1=" + start1 + ", end1=" + end1 + ", allday=" + allday
				+ ", textcolor=" + textcolor + ", backgroundcolor=" + backgroundcolor + ", bordercolor=" + bordercolor
				+ "]";
	}
	
	
		
	public tb_calVO(String user_id, String content, String start1, String end1) {
		super();
		this.user_id = user_id;
		this.content = content;
		this.start1 = start1;
		this.end1 = end1;
	}





	public tb_calVO() {
		super();
	}
	
	
	
	public tb_calVO(String user_id, int groupid, String title, String writer, String content, String start1,
			String end1, int allday, String textcolor, String backgroundcolor, String bordercolor) {
		super();
		this.user_id = user_id;
		this.groupid = groupid;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.start1 = start1;
		this.end1 = end1;
		this.allday = allday;
		this.textcolor = textcolor;
		this.backgroundcolor = backgroundcolor;
		this.bordercolor = bordercolor;
	}
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart1() {
		return start1;
	}
	public void setStart1(String start1) {
		this.start1 = start1;
	}
	public String getEnd1() {
		return end1;
	}
	public void setEnd1(String end1) {
		this.end1 = end1;
	}
	public int getAllday() {
		return allday;
	}
	public void setAllday(int allday) {
		this.allday = allday;
	}
	public String getTextcolor() {
		return textcolor;
	}
	public void setTextcolor(String textcolor) {
		this.textcolor = textcolor;
	}
	public String getBackgroundcolor() {
		return backgroundcolor;
	}
	public void setBackgroundcolor(String backgroundcolor) {
		this.backgroundcolor = backgroundcolor;
	}
	public String getBordercolor() {
		return bordercolor;
	}
	public void setBordercolor(String bordercolor) {
		this.bordercolor = bordercolor;
	}
	
	
	
	
	
	
	

}
