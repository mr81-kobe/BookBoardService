package com.toy.biz.board.book;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString	
public class BookVO {
	
	private long no;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private String img_url;
	private String description;
	private String isbn;
	private int good;
	public BookVO() {
		// TODO Auto-generated constructor stub
	}

}
