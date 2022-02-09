

package com.toy.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.toy.biz.board.BoardVO;
import com.toy.biz.board.CommentPageing;
import com.toy.biz.board.CommentVO;
import com.toy.biz.util.Page;


@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	@Transactional
	public int insertBoard(BoardVO vo){
		
		mybatis.insert("boardDAO.insertBoard",vo);
		
		return 0;
	} 
	@Transactional
	public int updateBoard(BoardVO vo){
		
		mybatis.update("boardDAO.updateBoard", vo);
		return 0;
		
	}
	@Transactional
	public int deleteBoard(int no){
		mybatis.delete("boardDAO.deleteBoard", no);
		return 0;
	}
	public List<BoardVO> getBoardList(Page<BoardVO> page){
		
		return mybatis.selectList("boardDAO.pageBoard",page);
		
	}
	public  BoardVO getBoard(int no){
		
		mybatis.update("boardDAO.countUp",no);
		return mybatis.selectOne("boardDAO.getBoard",no);
	} 
	
	
	public int getAmount(){
		
		int pageAmount = mybatis.selectOne("boardDAO.boardAmount");
		
		
		return pageAmount;
		
	}
	public void insertComment(CommentVO vo){
		
		mybatis.insert("boardDAO.insertComment",vo);
		
	}
	
	public int commentCount(){
		
		return mybatis.selectOne("boardDAO.commentCount");
		
		
	}
	
	public List<CommentVO> selectComment(CommentPageing vo){
		return mybatis.selectList("boardDAO.selectComment",vo);
	}

	public void updateComment(CommentVO vo){
		mybatis.update("boardDAO.updateComment", vo);
		
	}
	public void deleteComment(int no){
		System.out.println("이게 실행되니?");
		mybatis.delete("boardDAO.deleteComment",no);
		
	}


	public List<BoardVO> hotBoard(){
		
		return mybatis.selectList("boardDAO.hotBoard");
	}



}
