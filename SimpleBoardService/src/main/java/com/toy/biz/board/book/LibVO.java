package com.toy.biz.board.book;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class LibVO {
	private int no;
	private String name ;
	private String we;
	private String kung;
	private String address;
	private String type;
	private String phone;
	private String url;
	
	private String rest;
	private int books;
	private int information;
	private double ration;
	private int good;
	public LibVO() {
		// TODO Auto-generated constructor stub
	}

}
