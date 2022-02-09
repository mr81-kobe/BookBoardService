package com.toy.biz.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	private String title;
	private int no; 
	private String writer; 
	private String content;
	private int cnt; 
	private String tag; 
	private Date date;
	private String fileName;
	private int LibNo;
	
	
}
