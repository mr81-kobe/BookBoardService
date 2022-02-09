package com.toy.biz.board.book;

import java.util.List;
import java.util.Map;

import com.toy.biz.board.LibCommentVo;
import com.toy.biz.util.Page;

public interface BookService {
	//����¡ ���� �Լ��� ����
	public List<BookVO> getBookList(Page page);
	
	public int getBookCount( Map<String,String> map); 
	
	public BookVO getBook(String title);
	//��
	public List<LibVO> getLib(Page page);
	public int getCount(String addr);
	
	// getLib ������ ���� �ϳ� �������� 
	public LibVO getLiv(String title);
	
	
	//��� ī��Ʈ 
	public int getCountComment(int no);
	
	//��� ����
	public List<LibCommentVo> getCommentList(BookPageing<LibCommentVo> page);

	
	public void insertComment(LibCommentVo vo);
	//���� ��� ���
	
	public double getAVG(int no);
	public void setRation(Map<String,Object> map);
	public void updateComment(Map<String,String> map);
	public List<LibVO> bestLib();
	public void bookLike(LikeVO vo);
	public void bookDisLike(LikeVO vo);
	public void updateLike(Map<String ,Object> map);
	public int getLikeCount(int no);
	public LikeVO dCheck(Map<String,String> map);

	
	//admin
	
	public BookVO selectBook(int no);
	
	public void updateBook(BookVO vo);
	public void insertBook(BookVO vo);
	//admin Lib
	public void updateLib(LibVO vo);
	public void insertLib(LibVO vo);
	public List<LibVO> getLibList(Page<LibVO> page);
}
