package com.smhrd.model;

public class searchsrVO {
	private String search_name;
	private String search_gender;
	private int search_aog;
	private String search_lo;
	
	
	public searchsrVO() {
		super();
	}

	public searchsrVO(String search_name, String search_gender, int search_aog, String search_lo) {
		super();
		this.search_name = search_name;
		this.search_gender = search_gender;
		this.search_aog = search_aog;
		this.search_lo = search_lo;
	}

	@Override
	public String toString() {
		return "searchsrVO [search_name=" + search_name + ", search_gender=" + search_gender + ", search_aog="
				+ search_aog + ", search_lo=" + search_lo + "]";
	}

	public String getSearch_name() {
		return search_name;
	}

	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}

	public String getSearch_gender() {
		return search_gender;
	}

	public void setSearch_gender(String search_gender) {
		this.search_gender = search_gender;
	}

	public int getSearch_aog() {
		return search_aog;
	}

	public void setSearch_aog(int search_aog) {
		this.search_aog = search_aog;
	}

	public String getSearch_lo() {
		return search_lo;
	}

	public void setSearch_lo(String search_lo) {
		this.search_lo = search_lo;
	}
	
	
}
