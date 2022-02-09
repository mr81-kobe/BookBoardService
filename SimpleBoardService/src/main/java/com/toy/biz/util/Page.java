package com.toy.biz.util;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Page <T>{

	public Page() {
		// TODO Auto-generated constructor stub
	}

	private int wholePage;
	private int prePage =1;
	private String startPage;
	private String endPage; 
	private int wholeContent;
	private int block;
	private int numstart;
	private int numend;
	private List<T> list;
	private String search;
	private String option;
	
	
	
	public Page(int wholeContent,String prePage ,String option,String search) {
		// TODO Auto-generated constructor stub
		
		this.wholeContent = wholeContent; //db 에서 조회
		if(prePage!=null){
		this.prePage=Integer.parseInt(prePage);
		}//prePage 값은 페이지에서 파라미터로 받고 
		this.option=option; //있으면 쓰고 파라미터로 받고
		this.search = search;//있으면 사용 파라미터로 받고
		this.wholePage=this.wholeContent/15;
		if(this.wholeContent%15>1){
		this.wholePage=(this.wholeContent/15)+1;
		
		}
		SetBlock();
		SetPage();
		setConent();
	
	}
	public Page(String wholeComment,String prePage ,int libNo) {
		// TODO Auto-generated constructor stub
		
		this.wholeContent = Integer.parseInt(wholeComment);
		if(prePage!=null){
		this.prePage=Integer.parseInt(prePage);
		}
		
		
	}
	//1 block 1~5 까지고  2 block은 2~10 startnum 은 prePage 값에 따라 틀려지겠지 
	//prePage 값이 5 이상 즉 /5 했을 때 1보다 크면 2 block 2보다 크면 3블락 이런식의 알고리즘 으로 하자고 
	//그럼 총 블락을 구해놓을 수 있나? 총 코멘트를 /15 하면 PageAcount  32나오면 그걸 5로 나누면 블락 크기가 나오겠네 
	
	
	//프리페이지 값을 받아 블락 값 설정
	public void SetBlock(){
		
		this.block=(int) Math.ceil((this.prePage/5.0));
		System.out.println("block:"+ this.block);
	}
	//블락에 따른 페이지 인덱싱 시작값과 끝값 설정
	public void SetPage(){
		
		
		
		this.endPage = String.valueOf(5*block); 
		this.startPage= String.valueOf((5*block)-4);
		
			if(this.wholePage<Integer.parseInt(endPage)){
		
				this.endPage=String.valueOf(this.wholePage); 
				
					
		}
		
	}
	//prePage에 따른 db startnum endnum에 들어가는 값 설정 
	
	public void setConent()
	{
		
		this.numend = this.prePage*15;
		this.numstart=this.numend-14;
	}
	
	
	
}
