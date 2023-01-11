package com.smhrd.model;

public class tb_calVO {
	private int calendar_seq;
	private String user_id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start1;
	private String end1;
	private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	
	
	


	public tb_calVO(String user_id, String title, String start1, String end1) {
		super();
		this.user_id = user_id;
		this.title = title;
		this.start1 = start1;
		this.end1 = end1;
	}

	public tb_calVO(int calendar_seq, String user_id, String groupId, String title, String writer, String content,
			String start1, String end1, boolean allday, String textColor, String backgroundColor, String borderColor) {
		super();
		this.calendar_seq = calendar_seq;
		this.user_id = user_id;
		this.groupId = groupId;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.start1 = start1;
		this.end1 = end1;
		this.allday = allday;
		this.textColor = textColor;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
	}

	public tb_calVO() {
		super();
	}

	@Override
	public String toString() {
		return "tb_calVO [calendar_seq=" + calendar_seq + ", user_id=" + user_id + ", groupId=" + groupId + ", title="
				+ title + ", writer=" + writer + ", content=" + content + ", start1=" + start1 + ", end1=" + end1
				+ ", allday=" + allday + ", textColor=" + textColor + ", backgroundColor=" + backgroundColor
				+ ", borderColor=" + borderColor + "]";
	}

	public int getCalendar_seq() {
		return calendar_seq;
	}

	public void setCalendar_seq(int calendar_seq) {
		this.calendar_seq = calendar_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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

	public boolean isAllday() {
		return allday;
	}

	public void setAllday(boolean allday) {
		this.allday = allday;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	
	

	
}
