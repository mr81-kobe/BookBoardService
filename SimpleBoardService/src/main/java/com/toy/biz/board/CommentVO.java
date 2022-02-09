package com.toy.biz.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

	public CommentVO() {
		// TODO Auto-generated constructor stub
	}
	private int no;
	private int boardNo;
	private String writer;
	private String content;
	private Date time; 
}
