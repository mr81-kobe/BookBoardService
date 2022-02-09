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
		
		this.wholeContent = wholeContent; //db ���� ��ȸ
		if(prePage!=null){
		this.prePage=Integer.parseInt(prePage);
		}//prePage ���� ���������� �Ķ���ͷ� �ް� 
		this.option=option; //������ ���� �Ķ���ͷ� �ް�
		this.search = search;//������ ��� �Ķ���ͷ� �ް�
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
	//1 block 1~5 ������  2 block�� 2~10 startnum �� prePage ���� ���� Ʋ�������� 
	//prePage ���� 5 �̻� �� /5 ���� �� 1���� ũ�� 2 block 2���� ũ�� 3��� �̷����� �˰��� ���� ���ڰ� 
	//�׷� �� ����� ���س��� �� �ֳ�? �� �ڸ�Ʈ�� /15 �ϸ� PageAcount  32������ �װ� 5�� ������ ��� ũ�Ⱑ �����ڳ� 
	
	
	//���������� ���� �޾� ��� �� ����
	public void SetBlock(){
		
		this.block=(int) Math.ceil((this.prePage/5.0));
		System.out.println("block:"+ this.block);
	}
	//����� ���� ������ �ε��� ���۰��� ���� ����
	public void SetPage(){
		
		
		
		this.endPage = String.valueOf(5*block); 
		this.startPage= String.valueOf((5*block)-4);
		
			if(this.wholePage<Integer.parseInt(endPage)){
		
				this.endPage=String.valueOf(this.wholePage); 
				
					
		}
		
	}
	//prePage�� ���� db startnum endnum�� ���� �� ���� 
	
	public void setConent()
	{
		
		this.numend = this.prePage*15;
		this.numstart=this.numend-14;
	}
	
	
	
}
