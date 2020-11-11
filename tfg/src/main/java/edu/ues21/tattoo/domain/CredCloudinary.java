package edu.ues21.tattoo.domain;

public enum CredCloudinary {

	ACCOUNT("", 
			"", 
			"");
	
	private String cloudName;
	private String apiKey;
	private String apiSecret;
	
	private CredCloudinary(String cloudName, String apiKey, String apiSecret) {
		this.cloudName = cloudName;
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
	}

	public String getCloudName() {
		return cloudName;
	}

	public String getApiKey() {
		return apiKey;
	}

	public String getApiSecret() {
		return apiSecret;
	}

}