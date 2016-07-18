package com.hb.mybatis;

public class Book_rankVO {
	private  String b_subject , ISBN ,dense_rank ;

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getDense_rank() {
		return dense_rank;
	}

	public void setDense_rank(String dense_rank) {
		this.dense_rank = dense_rank;
	}

	

	
}
