package com.toy.biz.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentPageing {
	
	private String wholePage;
	private int prePage;
	private String startPage;
	private String endPage; 
	private int cntPage =5;
	private int wholeComment;
	private int boardNo;
	private int block;
	private int numstart;
	private int numend;
	private List<CommentVO> list ;
	public static final int start=1;
	public static final int end=5;
	public CommentPageing(String boardNo,String wholeComment,String prePage ) {
		// TODO Auto-generated constructor stub
		this.boardNo=Integer.parseInt(boardNo);
		this.wholeComment = Integer.parseInt(wholeComment);
		this.prePage=Integer.parseInt(prePage);
		setBlock();
		setWholePage();
		setStartPage();
		setEndPage();
		setContet();
	}
	public void setBlock(){
		this.block=this.prePage/cntPage;
	}
	public void setWholePage(){
		this.wholePage= String.valueOf((this.wholeComment/cntPage)+1);
	}
	public void setStartPage(){
		 this.startPage=String.valueOf(start+(5*this.block));
	}
	public void setEndPage(){
		
		
		
		
		this.endPage=String.valueOf(end+(this.block*5));
		if(  Integer.valueOf(this.endPage)>Integer.valueOf(wholePage)){
			this.endPage=this.wholePage;
		}
		if(Integer.parseInt(this.wholePage)  < Integer.parseInt(this.endPage)){
			this.endPage=this.wholePage;
		}
	}
	
	public void setContet(){
		this.numstart=(start+(this.prePage-1)*5);
		this.numend=(this.numstart+5);
	}
	
}
