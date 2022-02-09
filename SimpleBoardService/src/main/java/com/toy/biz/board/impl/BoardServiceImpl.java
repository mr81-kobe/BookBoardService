package com.toy.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.biz.board.BoardService;
import com.toy.biz.board.BoardVO;
import com.toy.biz.board.CommentPageing;
import com.toy.biz.board.CommentVO;
import com.toy.biz.util.Page;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO dao ;
	public BoardServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.insertBoard(vo);
		
		return 0;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
		
		return 0;
	}

	@Override
	public int deleteBoard(int vo) {
		// TODO Auto-generated method stub
		dao.deleteBoard(vo);
		
		return 0;
	}

	@Override
	public List<BoardVO> getBoardList(Page<BoardVO> page) {
		// TODO Auto-generated method stub
		
		
		
		
		return dao.getBoardList(page);
	}

	@Override
	public BoardVO getBoard( int no) {
		// TODO Auto-generated method stub
		
		
		return dao.getBoard(no);
	}

	@Override
	public int pageAmount() {
		// TODO Auto-generated method stub
		
		
		return dao.getAmount();
	}

	@Override
	public void insertComment(CommentVO vo) {
		// TODO Auto-generated method stub
		dao.insertComment(vo);
	}

	@Override
	public int commentCount() {
		// TODO Auto-generated method stub
			
		return	dao.commentCount();
		
	}

	@Override
	public List<CommentVO> selectComment(CommentPageing vo) {
		// TODO Auto-generated method stub
		return dao.selectComment(vo);
	}

	@Override
	public void updateComment(CommentVO vo) {
		// TODO Auto-generated method stub
		System.out.println("업데이트 댓글 서비스 도착");
		dao.updateComment(vo);
	}

	@Override
	public void deleteComment(int no) {
		// TODO Auto-generated method stub
		System.out.println("서비스 도착");
		System.out.println("NO!!!!!!!"+ no);
		dao.deleteComment(no);
	}

	@Override
	public List<BoardVO> hotBoard() {
		// TODO Auto-generated method stub
		return dao.hotBoard();
	}

	

	

}
