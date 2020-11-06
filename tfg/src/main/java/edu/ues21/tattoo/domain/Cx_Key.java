package edu.ues21.tattoo.domain;

public enum Cx_Key {

	OLOF_ACCOUNT("", ""),
	TATTOO_ACCOUNT("", ""), 
	PERSONAL_ACCOUNT("", "");
	
	private String cx;
	private String apiKey;
	
	private Cx_Key(String cx, String apiKey) {
		this.cx = cx;
		this.apiKey = apiKey;
	}

	public String getCx() {
		return cx;
	}

	public String getApiKey() {
		return apiKey;
	}

}