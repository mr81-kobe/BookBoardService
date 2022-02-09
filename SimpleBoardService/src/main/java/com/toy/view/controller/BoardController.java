package com.toy.view.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.toy.biz.board.BoardService;
import com.toy.biz.board.BoardVO;
import com.toy.biz.board.CommentPageing;
import com.toy.biz.board.CommentVO;
import com.toy.biz.board.book.BookService;
import com.toy.biz.util.Page;

@Controller

public class BoardController {
	
	public static final String UPLOAD_PATH="C:\\work\\SimpleBoardService\\src\\FIleUpload";
	@Autowired
	private BoardService service;
	
	@Autowired
	private BookService bookService;
	public BoardController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value= "/insertBoard.do",method= RequestMethod.POST)
	public String insertBoard(BoardVO vo,MultipartFile file) {
		
		
		//파일 원래 이름
		String fileName = file.getOriginalFilename(); 
		File f = new File(UPLOAD_PATH,fileName); 
		if(! new File(UPLOAD_PATH).exists()){
			new File(UPLOAD_PATH).mkdirs();
		}
		 try {
	            FileCopyUtils.copy(file.getBytes(), f);
	           
	        } catch(Exception e) {
	            e.printStackTrace();
	            
	        }
		vo.setFileName(fileName);
		service.insertBoard(vo); 
	
		
		return "redirect:/boardList.do";

	}
	
	@RequestMapping(value="/boardList.do" ,method=RequestMethod.GET)
	public String getBoardList(@RequestParam (value="pageNO", defaultValue="1" ) String pageNo ,Model ra ){
		
		int intNo = Integer.parseInt(pageNo);
		
		Page<BoardVO> page = new Page<BoardVO>(service.pageAmount(),pageNo,null,null);
		
		
		System.out.println( page.toString());
	
		List<BoardVO> list=service.getBoardList(page); 
		System.out.println("pageAmount :"+page.getWholePage());
		System.out.println("startPage :" +page.getStartPage());
		System.out.println("endPage :" + page.getEndPage());
		ra.addAttribute("list",list); 
		ra.addAttribute("page" , page);
		
		return "/board/boardList.jsp";
		
	}
	
	@RequestMapping(value="/next.do" ,method=RequestMethod.GET)
	
	public String nextPage(Page page , @RequestParam (value="start") String start,Model model){
		
		 
		page = new Page<>(service.pageAmount(),start,null,null);
		 
		System.out.println(start);
		System.out.println("pageAmount :"+page.getWholePage());
		System.out.println("startPage :" +page.getStartPage());
		System.out.println("endPage :" + page.getEndPage());
		model.addAttribute("page",page); 
		model.addAttribute("list",service.getBoardList(page));
		return "/board/boardList.jsp";
	}
	
	

	
	

	@RequestMapping(value="/getBoard.do" , method =RequestMethod.GET)
	public String getBoard(@RequestParam (value="boardNo") String boardNo, Model model, @RequestParam (value="prePage", defaultValue="1") String prePage ){
		
		int no = Integer.parseInt(boardNo); 
		String count=String.valueOf(service.commentCount());
		CommentPageing page = new CommentPageing(boardNo, count, prePage);
		model.addAttribute("list",service.selectComment(page));
		BoardVO vo=service.getBoard(no);
		model.addAttribute("page", page);
		model.addAttribute("board" , service.getBoard(no));
		
		
		model.addAttribute("lib",bookService.getLiv(String.valueOf(vo.getLibNo())));
		
		return "/board/getBoard.jsp";
	}
	
	@RequestMapping(value="/prePage.do", method=RequestMethod.GET)
	public String prePage(Page page, Model model, @RequestParam ("end")String end){
		
		
		page= new Page<BoardVO>(service.pageAmount(),end,null,null);
		
		
		System.out.println(end);
		
		model.addAttribute("page",page); 
		model.addAttribute("list",service.getBoardList(page));
		return "/board/boardList.jsp";
		
		
		
	}

	@RequestMapping(value="/updateBoard.do" ,method=RequestMethod.POST)
	public String updaateBoard(BoardVO vo ,Model model){
		
		
		System.out.println("Update Board 실행 중");
		 
		model.addAttribute("board",service.updateBoard(vo));
		
		
		
		
		return "getBoard.do?boardNo="+vo.getNo();
	}
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoard(@RequestParam("no") String no){
		
		service.deleteBoard(Integer.parseInt(no));
		
		return "boardList.do";
		
	}
	@RequestMapping("/updateForm.do")
	public String updateForm(@RequestParam (value="no") String no,Model model){
		

		int no2 = Integer.parseInt(no); 
		
		model.addAttribute("board" , service.getBoard(no2));
		
		
		
		return"/board/updateForm.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/comment.do", produces="application/json;charset=UTF-8", method= RequestMethod.POST)
	public  CommentPageing insertComment( @RequestBody CommentVO vo){
		
		service.insertComment(vo);
		String count=String.valueOf(service.commentCount());
		CommentPageing page = new CommentPageing(String.valueOf(vo.getBoardNo()), count, "1");
		List<CommentVO> list=service.selectComment(page);
		page.setList(list);
		
		
		
		return page;
	}
	@ResponseBody
	@RequestMapping(value="editComment.do",produces="application/json;charset=UTF-8", method= RequestMethod.POST)
	public CommentPageing editComment(@RequestBody CommentVO vo){
		System.out.println("컨트롤러 도착");
		System.out.println(vo.getContent());
		System.out.println(vo.getNo());
		service.updateComment(vo);
		String count=String.valueOf(service.commentCount());
		CommentPageing page = new CommentPageing(String.valueOf(vo.getBoardNo()), count, "1");
		List<CommentVO> list=service.selectComment(page);
		page.setList(list);
		
		
		
		return page;
		
	}
	@ResponseBody
	@RequestMapping(value="deleteComment.do", produces="application/json;charset=UTF-8" ,method=RequestMethod.POST)
	public CommentPageing deleteComment(@RequestBody Map<String,String> map ){
		System.out.println("delete comment 컨트롤러 도착");
		System.out.println( "no"+map.get("no"));
		service.deleteComment(Integer.parseInt(map.get("no")));
	
		String count=String.valueOf(service.commentCount());
		CommentPageing page = new CommentPageing(map.get("boardNo"), count, "1");
		List<CommentVO> list=service.selectComment(page);
		page.setList(list);
		System.out.println(list.size());
		for(CommentVO vo : list )
		{
			System.out.println(vo.getNo());
		}
		
		return page;
		
	}

	@RequestMapping("/board/insertForm.do")
	public String goToInsertForm(Model model,@RequestParam("libNo") String no ){
		
		model.addAttribute("Lib",bookService.getLiv(no));
		
		
		
		return "/board/insertForm.jsp";
	}

	
	

}
