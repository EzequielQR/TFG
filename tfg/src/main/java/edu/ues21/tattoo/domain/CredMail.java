package edu.ues21.tattoo.domain;

public enum CredMail {

	ACCOUNT("noreply.tatuaje@gmail.com", 
			"tfg108811");
	
	private String mail;
	private String password;
	
	private CredMail(String mail, String password) {
		this.mail = mail;
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public String getPassword() {
		return password;
	}
	
}
