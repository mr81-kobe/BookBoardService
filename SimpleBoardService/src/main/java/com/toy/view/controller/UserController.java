package com.toy.view.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toy.biz.board.BoardService;
import com.toy.biz.board.book.BookService;
import com.toy.biz.user.UserService;
import com.toy.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@Autowired 
	private BoardService boardService;
	
	@Autowired
	private BookService bookService;
	public UserController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value="/signin.do", method= RequestMethod.POST)
	public String signin(UserVO vo, Model model){
		
		service.insertUser(vo);
		model.addAttribute("user",vo);
		
		return "redirect:index.jsp";
	}
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login(UserVO vo, Model model,HttpSession session){
		
		if(service.selectUser(vo)!=null){
		session.setAttribute("userID", service.selectUser(vo));
		}else {
			model.addAttribute("message","명훈 할게요 ㅋㅋㅋㅋ");
			return "redirect:login.jsp";
		}
		
		
		return "redirect:Section.jsp";
	}

	@ResponseBody
	@RequestMapping(value="/login.do", produces="application/json;charset=UTF-8", method= RequestMethod.POST)
	public  String login2(@RequestBody UserVO vo, HttpSession session){
		
		if(service.selectUser(vo)!=null){
		session.setAttribute("userID", service.selectUser(vo).getEmail());
		
		session.setAttribute("lat",vo.getLat());
		session.setAttribute("lon", vo.getLon());
		session.setAttribute("addr", vo.getAddr());
		System.out.println(vo.getLat());
		System.out.println(vo.getLon());
		System.out.println(vo.getAddr());
		
		
		return "로그인 성공!";
		}else {
			
			return "로그인 실패";
		}
		
		
		
	}

	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		
		return "redirect:login.jsp";
	}
	
	@RequestMapping(value="/check.do",method = RequestMethod.GET ,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String check(@RequestParam Map<String, Object> map){
		UserVO vo = new UserVO(); 
		vo.setEmail((String)map.get("id"));
		String email=service.check(vo.getEmail());
		if(email.equals("성공")){
		
			return "yes";	
			
		}else{
			return email+"은 중복된 아이디 입니다. ";
		}
		
		
		
		
	}
	@RequestMapping("/Section.do")
	public String gotoIndex(Principal obj,HttpSession session,Model model){
		
		if(obj!=null){
		session.setAttribute("userID", obj.getName());
		}
		
		model.addAttribute("hot",boardService.hotBoard());
		
		model.addAttribute("best",bookService.bestLib());
		return "/Section.jsp";
		
	}
}
