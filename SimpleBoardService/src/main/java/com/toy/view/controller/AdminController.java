package com.toy.view.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.toy.biz.board.BoardService;
import com.toy.biz.board.BoardVO;
import com.toy.biz.board.book.BookService;
import com.toy.biz.board.book.BookVO;
import com.toy.biz.board.book.LibVO;
import com.toy.biz.user.UserService;
import com.toy.biz.user.UserVO;
import com.toy.biz.util.Page;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	public AdminController() {
		// TODO Auto-generated constructor stub
	}
	public static final String UPLOAD_PATH="C:\\work\\SimpleBoardService\\src\\FIleUpload";
@Autowired
private UserService userService;
@Autowired
private BoardService boardService;
@Autowired
private BookService bookService;

	
	
@RequestMapping("/index.do")

public String adminIndex(){
	
	
	return "/admin/index.jsp";
	
}
/*회원을 관리 할 목록의 리스트업*/
@RequestMapping(value="/userMange.do")
public String userMangeList(Model model, @RequestParam Map<String ,String> map)
{
	
	
	
	Page<UserVO> page = new Page<>(userService.userCount(),map.get("prePage"),map.get("option"),map.get("search")); 
	
	page.setList(userService.userList(page));
	
	model.addAttribute("page",page);
	return "/admin/userMange.jsp";

}

	
/*관리 할 책 목록의 리스트업 */
@RequestMapping(value="/bookMange.do")
public String bookMangeList(Model model,@RequestParam Map<String, String> map)
{	
	
	
	int wholeContent=bookService.getBookCount(map);
	System.out.println("wholeContent" + wholeContent);
	Page<BookVO> page =new Page<BookVO>(wholeContent,map.get("prePage"), map.get("option"),map.get("search")); 
	System.out.println(page.toString());
	page.setList(bookService.getBookList(page)); 
	
	model.addAttribute("page",page);
	return "/admin/bookMange.jsp";
} 

@RequestMapping(value="/bookEdit.do")
public String bookEdit(Model model, @RequestParam(value="no") String no){
	
	

	model.addAttribute("book",bookService.selectBook(Integer.parseInt(no)));
	
	
	return "/admin/bookEdit.jsp";
}

@RequestMapping(value="/deleteBook.do")
@ResponseBody
public Page<BookVO> deleteBook(@RequestParam Map<String,String> map){
	
	
	
	Page<BookVO> page = new Page<>(bookService.getBookCount(map), map.get("prePage"), map.get("option"), map.get("search"));
	
	return page;
	
}


/*관리할 도서관 목록의 리스트업*/
@RequestMapping(value="/libMange.do")
public String libMangeList(Model model ,HttpSession session,@RequestParam Map<String,String> map)
{	
	
	int count = bookService.getCount(map.get("search")); 
	System.out.println(map.get("search"));
	System.out.println(map.get("option"));
	Page<LibVO> page=new Page<LibVO>(count, map.get("prePage"), map.get("option"),map.get("search") );
	
	List<LibVO> list=bookService.getLibList(page);
	page.setList(list); 
	
	model.addAttribute("page",page);
	return "/admin/libMange.jsp";
}
/*관리할 게시판의 리스트업*/
@RequestMapping(value="/boardMange.do")
public String boardMangeList(Model model,@RequestParam Map<String,String> map)
{	
	
	
	Page<BoardVO> vo = new Page<>(boardService.pageAmount(),map.get("prePage"),map.get("option"),map.get("search"));
	
	
	vo.setList(boardService.getBoardList(vo));
	model.addAttribute("page",vo);
	return "/admin/boardMange.jsp";
}
	

@RequestMapping( value="/editBook.do")

public String  updateBook(BookVO vo){
	
	  
	
			 bookService.updateBook(vo);
			 
			 return "/admin/bookMange.do";
	}		



@RequestMapping(value="/insertBookForm.do")
public String insertBookForm(){
	
	
	
	
	return "/admin/insertBookForm.jsp";
}

@RequestMapping(value="/insertBook.do" ,method=RequestMethod.POST)
public String insertBook( BookVO vo ,MultipartFile file){
	
	
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
	vo.setImg_url(UPLOAD_PATH +"\\"+ fileName);
	
	System.out.println(vo.getImg_url());
	
	
	bookService.insertBook(vo);
	return "/admin/bookMange.do";
}




@RequestMapping(value="/editLib.do" )

public String editLib(Model model, LibVO vo)
{
	System.out.println("컨트롤러 도착");
	System.out.println(vo.toString());
	bookService.updateLib(vo);
	
	
	return "redirect:/admin/libMange.do";
	
}


@RequestMapping(value="/editLibForm.do")
public String editLibForm(Model model,@RequestParam("no") String no){
	
	
	model.addAttribute("lib",bookService.getLiv(no));
	
	
	
	
	
	return "/admin/libEdit.jsp";
	
}

@RequestMapping(value="/insertLib.do")
public String insertLib(LibVO vo){
	
	bookService.insertLib(vo);
	
	return "redirect:/admin/libMange.do";
}


@RequestMapping(value="/deleteUser.do")
public String deleteUser(@RequestParam("no") String no){
	
	
	
	
	return "redirect:/admin/userMange.do";
	
	
}




}
