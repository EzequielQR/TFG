package edu.ues21.tattoo.domain;

public enum CredGoogleCustomSearch {

	OLOF_ACCOUNT("", ""),
	TATTOO_ACCOUNT("", ""), 
	PERSONAL_ACCOUNT("", "");
	
	private String cx;
	private String apiKey;
	
	private CredGoogleCustomSearch(String cx, String apiKey) {
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