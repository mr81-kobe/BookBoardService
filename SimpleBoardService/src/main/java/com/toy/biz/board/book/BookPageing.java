package com.toy.biz.board.book;

import java.util.List;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class BookPageing <T>{

	
	
	private String wholePage;
	private int prePage =1;
	private String startPage;
	private String endPage; 
	private int cntPage =5;
	private int wholeComment;
	
	private int block;
	private int numstart;
	private int numend;
	private List<T> list;
	private int lbNo;
	private String search;
	private String option;
	public static final int start=1;
	public static final int end=5;
	public BookPageing(String wholeComment,String prePage ,String option,String search) {
		// TODO Auto-generated constructor stub
		
		this.wholeComment = Integer.parseInt(wholeComment);
		if(prePage!=null){
		this.prePage=Integer.parseInt(prePage);
		}
		this.option=option;
		this.search = search;
		setBlock();
		setWholePage();
		setStartPage();
		setEndPage();
		setContet();
	
	}
	public BookPageing(String wholeComment,String prePage ,int libNo) {
		// TODO Auto-generated constructor stub
		
		this.wholeComment = Integer.parseInt(wholeComment);
		if(prePage!=null){
		this.prePage=Integer.parseInt(prePage);
		}
		this.lbNo=libNo;
		
		setBlock();
		setWholePage();
		setStartPage();
		setEndPage();
		setContet();
	
	}
	
	public void setBlock(){
		if(this.prePage%this.cntPage!=0){
		this.block=this.prePage/this.cntPage;
		}else{
			this.block=(this.prePage/this.cntPage)-1;
		}
	}
	public void setWholePage(){
		this.wholePage= String.valueOf((this.wholeComment/10)+1);
	}
	public void setStartPage(){
		 this.startPage=String.valueOf(start+(5*this.block));
	}
	public void setEndPage(){
		
		
		
		
		this.endPage=String.valueOf(end+(this.block*5));
		if(  Integer.valueOf(this.endPage)>Integer.valueOf(wholePage)){
			this.endPage=this.wholePage;
		}
		if(Integer.parseInt(this.wholePage)  < Integer.parseInt(this.endPage) || Integer.parseInt(this.wholePage) < 5){
			this.endPage=this.wholePage;
		}
	}
	
	public void setContet(){
		this.numstart=(start+(this.prePage-1)*5);
		this.numend=(this.numstart+9);
	}
	
}
