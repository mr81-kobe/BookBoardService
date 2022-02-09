package com.toy.biz.board.book.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.biz.board.LibCommentVo;
import com.toy.biz.board.book.BookPageing;
import com.toy.biz.board.book.BookService;
import com.toy.biz.board.book.BookVO;
import com.toy.biz.board.book.LibVO;
import com.toy.biz.board.book.LikeVO;
import com.toy.biz.util.Page;
@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private bookDAO dao;
	public BookServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<BookVO> getBookList(Page page) {
		// TODO Auto-generated method stub
		return dao.getBookList(page);
	}

	@Override
	public int getBookCount( Map<String,String> map) {
		// TODO Auto-generated method stub
		
		return dao.getBookCount(map);
	}

	@Override
	public List<LibVO> getLib(Page book) {
		// TODO Auto-generated method stub
		return dao.getLib(book);
	}

	@Override
	public int getCount(String addr) {
		// TODO Auto-generated method stub
		
		
		return dao.getCount(addr);
	}

	@Override
	public BookVO getBook(String title) {
		// TODO Auto-generated method stub
		
		
		
		return dao.getBook(title);
	}

	@Override
	public int getCountComment(int no) {
		// TODO Auto-generated method stub
		
		return dao.getCommentCount(no);
	}

	@Override
	public LibVO getLiv(String no) {
		// TODO Auto-generated method stub
		return dao.getLibrary(no);
	}

	@Override
	public List<LibCommentVo> getCommentList(BookPageing<LibCommentVo> page) {
		// TODO Auto-generated method stub
		return dao.getCommentList(page);
	}

	@Override
	public void insertComment(LibCommentVo vo) {
		// TODO Auto-generated method stub
		
		dao.insertComment(vo);
		
	}

	@Override
	public double getAVG(int no) {
		// TODO Auto-generated method stub
		
		return dao.getAVG(no);
	}

	@Override
	public void setRation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.setRation(map);
	}

	@Override
	public void updateComment(Map<String, String> map) {
		// TODO Auto-generated method stub
		dao.updateComment(map);
	}

	@Override
	public List<LibVO> bestLib() {
		// TODO Auto-generated method stub
		return dao.bestLib();
	}

	@Override
	public void bookLike(LikeVO vo) {
		// TODO Auto-generated method stub
		dao.bookLike(vo);
	}

	@Override
	public void bookDisLike(LikeVO vo ) {
		// TODO Auto-generated method stub
		dao.bookDisLike(vo);
	}

	@Override
	public void updateLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.updateLike(map);
	}

	@Override
	public int getLikeCount(int no) {
		// TODO Auto-generated method stub
		return dao.getLikeCount(no);
	}

	@Override
	public LikeVO dCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.dCheck(map);
	}

	@Override
	public BookVO selectBook(int no) {
		// TODO Auto-generated method stub
		return dao.selectBook(no);
	}

	@Override
	public void updateBook(BookVO vo) {
		// TODO Auto-generated method stub
		dao.updateBook(vo);
	}

	@Override
	public void insertBook(BookVO vo) {
		// TODO Auto-generated method stub
		dao.insertBook(vo);
	}

	@Override
	public void updateLib(LibVO vo) {
		// TODO Auto-generated method stub
		dao.updateLib(vo);
	}

	@Override
	public void insertLib(LibVO vo) {
		// TODO Auto-generated method stub
		dao.insertLib(vo);
	}

	@Override
	public List<LibVO> getLibList(Page<LibVO> page) {
		// TODO Auto-generated method stub
		return dao.getLibList(page);
	}

}
