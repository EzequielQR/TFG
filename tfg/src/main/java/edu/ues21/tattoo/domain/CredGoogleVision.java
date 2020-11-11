package edu.ues21.tattoo.domain;

public enum CredGoogleVision {

	ACCOUNT("");
	
	private String cred;

	private CredGoogleVision(String cred) {
		this.cred = cred;
	}

	public String getCred() {
		return cred;
	}
	
}