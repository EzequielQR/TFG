package edu.ues21.tattoo.domain;

public enum Color {
	BLUE("#0000FF"), RED("#FF0000"), FUCHSIA("#FF00FF"), GRAY("#808080"), CARMESI("#DC143C"), 
	GREEN_DARK("#128F63"), GREEN("#008000"), PINK("#FF9B9B"), GOLDEN_ROD("#DAA520"), DEEP_SKY_BLUE("#00BFFF"), 
	CHOCOLATE("#D2691E"), LIGHT_STEEL_BLUE("#B0C4DE");
	
	private String hexadecimal;
	
	private Color(String hexadecimal) {
		this.hexadecimal = hexadecimal;
	}

	public String getHexadecimal() {
		return hexadecimal;
	}
	
}