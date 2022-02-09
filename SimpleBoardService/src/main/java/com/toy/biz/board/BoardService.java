package com.toy.biz.board;

import java.util.List;

import com.toy.biz.util.Page;

public interface BoardService {

	
	
	public int insertBoard(BoardVO vo); 
	
	public int updateBoard(BoardVO vo); 
	
 
	
	public List<BoardVO> getBoardList(Page<BoardVO> page); 
	public BoardVO getBoard(int no);
	public int pageAmount();

	int deleteBoard(int vo);
	public void insertComment(CommentVO vo);
	public int commentCount();
	public List<CommentVO> selectComment(CommentPageing vo);
	public void updateComment(CommentVO vo);
	public void deleteComment(int no);
	public List<BoardVO>hotBoard();

}
