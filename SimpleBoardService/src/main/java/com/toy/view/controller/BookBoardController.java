package com.toy.view.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toy.biz.board.LibCommentVo;
import com.toy.biz.board.book.BookPageing;
import com.toy.biz.board.book.BookService;
import com.toy.biz.board.book.BookVO;
import com.toy.biz.board.book.LibVO;
import com.toy.biz.board.book.LikeVO;
import com.toy.biz.util.Page;

@Controller

public class BookBoardController {
	@Autowired
	private BookService service;
	
	public BookBoardController() {
		// TODO Auto-generated constructor stub
	}

	
	@RequestMapping(value="/bookBoard.do")
	public String BookBoardList(@RequestParam (value="prePage", defaultValue="1") String prePage, Model model ){
		
		
		int among=service.getBookCount(new HashMap<String, String>());
		System.out.println(among);
		Page<BookVO> page = new Page<BookVO>(among, prePage,null,null);
		page.setList(service.getBookList(page));
		
		model.addAttribute("page",page);
		
		return "/bookBoard/bookindex.jsp";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/bookBoardsync.do" ,produces="application/json; charset=utf-8",method=RequestMethod.POST)
	public Page<BookVO> syncBookBoardList(@RequestBody Map<String,String> map){
		
		
		
		
			
			System.out.println(map.get("prePage"));
			 
			
			int among=service.getBookCount(map);
			System.out.println(among);
			if(map.get("prePage")==null){
				map.put("prePage","1");
			}
			Page<BookVO> page = new Page<BookVO>(among, map.get("prePage"), map.get("option"),map.get("search"));
			
			
			page.setList(service.getBookList(page));
			System.out.println("현재 페이지 :"+  page.getPrePage());
		
		
			return page;
			
			
			
	
		
		
		
		
		
		
	}
	
	
	@RequestMapping(value="getBook.do", method=RequestMethod.GET )
	
	public String getBook(Model model, @RequestParam( value="title", required=false) String title,Map<String,String> map,HttpSession sess){
		
		BookVO vo=service.getBook(title);
		map.put("id",(String)sess.getAttribute("userID")); 
		map.put("bookNo",String.valueOf(vo.getNo()));
		
		if(service.dCheck(map)!=null){
			model.addAttribute("like", "yes");
			
		}else{
			model.addAttribute("like", null);
		}
		model.addAttribute("book", vo);
		
		return "/bookBoard/getBook.jsp";
	
	
	}
	
	
	
	@RequestMapping(value="getLib.do" ,method=RequestMethod.GET)
	public String getLib(@RequestParam Map<String, String> map,HttpSession sess){
		
		
		if(sess.getAttribute("addr")==null){
		
		sess.setAttribute("addr", map.get("addr"));
		sess.setAttribute("lat", map.get("lat"));
		sess.setAttribute("lon",map.get("lon"));
		}
		
		
		
		
		return "redirect:/bookBoard/Lib.jsp";
	}
	@ResponseBody
	@RequestMapping(value="call.do",method=RequestMethod.POST)
	public  Page<LibVO> call(HttpSession session, @RequestBody Map<String,String> map){
		
		String addr =(String)session.getAttribute("addr");
		System.out.println(addr);
		String [] arrt=addr.split("");
		addr="";
		for(int i=0; i<arrt.length; i++){
			if(arrt[i].equals("시")){
				break;
			}
			addr+=arrt[i];
		}
		System.out.println(addr);
		int count=service.getCount(addr);
		
		
		
		Page<LibVO> book=new Page<LibVO>(count, map.get("prePage"), null, addr);
		List<LibVO> list=service.getLib(book);
		book.setList(list);
		
		return book;
		
	}
	
	
	
	@RequestMapping(value="getLi.do")
	public String getLi(Model model, @RequestParam Map<String,String> map ){
		
		
		System.out.println("NUmber"+map.get("no"));
		
		int count = service.getCountComment(Integer.parseInt(map.get("no")));
		BookPageing<LibCommentVo> page = new BookPageing<LibCommentVo>(String.valueOf(count), map.get("prePage"),Integer.parseInt(map.get("no")) );
		List<LibCommentVo> list=service.getCommentList(page);
		for (LibCommentVo vo : list){
			System.out.println(vo.getContent());
		}
		page.setList(list);
		
		model.addAttribute("page",page);
		model.addAttribute("lib",service.getLiv(map.get("no")));
		
		System.out.println(page.getNumstart());
		System.out.println(page.getNumend());
		return "bookBoard/library.jsp";
	}
	
	@RequestMapping(value ="boradbook/insertComment.do" ,method=RequestMethod.POST)
	public String insertComment(LibCommentVo vo, Model model, Map<String,Object> map){
		System.out.println(vo.getLbNo());
		service.insertComment(vo);
		double ration=service.getAVG(vo.getLbNo());
		map.put("ration" ,ration);
		map.put("no",vo.getLbNo());
		service.setRation(map);
		
		return "redirect:/getLi.do?no="+vo.getLbNo();
	}
	
	
	@RequestMapping("updateComment.do")
	public String updateComment(@RequestParam Map<String, String> map, Map<String, Object> map2){
		
		
		Iterator<String> it=map.keySet().iterator();
		
		
		
		while (it.hasNext()) {
			String key=it.next();
			System.out.println(key+map.get(key));
			
		}
		
		
		service.updateComment(map);
		
		double ration=service.getAVG(Integer.parseInt(map.get("lbno")));
		map2.put("ration" ,ration);
		map2.put("no",map.get("lbno"));
		service.setRation(map2);
		
		
		
		
		
		return "redirect:/getLi.do?no="+map.get("lbno");
		
	}
	
	@RequestMapping(value="/likeIt.do" ,produces="application/json;charset=UTF-8")
	 
	public @ResponseBody String likeIt(@RequestBody LikeVO vo, Map<String,Object> map){
		
		System.out.println("좋아요 성공");
		service.bookLike(vo);
		Map<String,Object> map_update= new HashMap<>();
		
		int count=service.getLikeCount(vo.getBookNo());
		map_update.put("love",count);
		map_update.put("no", vo.getBookNo());
		service.updateLike(map_update);
		
		
		map.put("count", count);
		
		return String.valueOf(count);
		
	}
	@RequestMapping(value="/disLikeIt.do" ,produces="application/json;charset=UTF-8")
	 
	public  @ResponseBody String disLikeIt(@RequestBody LikeVO vo, Map<String,Object> map){
		
		System.out.println("좋아요 취소");
		
		service.bookDisLike(vo);
		
		Map<String,Object> map_update= new HashMap<>();
		int count=service.getLikeCount(vo.getBookNo());
		map_update.put("love",count);
		map_update.put("no", vo.getBookNo());
		service.updateLike(map_update);
		
		System.out.println(count);
		
		
		
		
		return String.valueOf(count);
		
	}

	
	//
}
