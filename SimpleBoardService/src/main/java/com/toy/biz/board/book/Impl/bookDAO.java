package com.toy.biz.board.book.Impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toy.biz.board.LibCommentVo;
import com.toy.biz.board.book.BookPageing;
import com.toy.biz.board.book.BookVO;
import com.toy.biz.board.book.LibVO;
import com.toy.biz.board.book.LikeVO;
import com.toy.biz.util.Page;
@Repository
public class bookDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public bookDAO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public List<BookVO> getBookList(Page<BookVO> page){
		
		return mybatis.selectList("bookDAO.getBookList", page);
		
		
	}
	
	public BookVO getBook(String title){
		
		return  mybatis.selectOne("bookDAO.getBook", title);
		
	}
	
	
	public int getBookCount(Map<String,String> map){
		return mybatis.selectOne("bookDAO.getBookCount",map);
	}
	public List<LibVO> getLib(Page<LibVO> book){
		
		return mybatis.selectList("bookDAO.getLib",book);
		
		
	}

	public int getCount(String addr){
		return mybatis.selectOne("bookDAO.getCount",addr);
	}

	//
	public int getCommentCount(int no){
		
		
		return mybatis.selectOne("bookDAO.getCountComment",no); 
		
	}
	public List<LibCommentVo> getCommentList(BookPageing<LibCommentVo> page){
		
		return mybatis.selectList("bookDAO.getCommentList",page);
	}
	public void insertComment(LibCommentVo vo){
		
		mybatis.insert("bookDAO.insertComment",vo); 
		
		
	}
	
	public LibVO getLibrary(String no)
	{
		
		
		return mybatis.selectOne("bookDAO.getLibrary",Integer.parseInt(no));
	}
	
	public double getAVG(int no){
		
		return mybatis.selectOne("bookDAO.getAVG",no);
		
	}
	public void setRation(Map<String,Object> map){
		mybatis.update("bookDAO.setRation",map);
	}
	
	public void updateComment(Map<String,String> map){
		
		mybatis.update("bookDAO.updateComment",map);
		
	}
	
	public List<LibVO> bestLib(){
		
		return mybatis.selectList("bookDAO.bestLib");
	}
	public void bookLike(LikeVO vo){
		
		mybatis.insert("bookDAO.bookLike",vo);
	}
	public void bookDisLike(LikeVO vo){
		mybatis.delete("bookDAO.bookDisLike", vo);
		
	}
	public void updateLike(Map<String ,Object> map){
		mybatis.update("bookDAO.updateLike",map);
	}
	public int getLikeCount(int no){
		return mybatis.selectOne("bookDAO.getLikeCount", no);
	}
	public LikeVO dCheck(Map<String,String> map){
		
		return mybatis.selectOne("bookDAO.dCheck",map);
		
	}
	public BookVO selectBook(int no){
		 return mybatis.selectOne("bookDAO.selectBook", no);
		
	}
	public void updateBook(BookVO vo){
		
		 mybatis.update("bookDAO.updateBook", vo);
	}
	public void insertBook(BookVO vo){
		
		mybatis.insert("bookDAO.insertBook", vo);
	}

	public void updateLib(LibVO vo){
		mybatis.update("bookDAO.updateLib",vo);
		
	}
	public void insertLib(LibVO vo){
		mybatis.insert("bookDAO.insertLib",vo);
		
	}
	
	public List<LibVO> getLibList(Page<LibVO> page){
		return mybatis.selectList("bookDAO.getLibList",page);
	}
}
