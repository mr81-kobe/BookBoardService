package com.toy.board;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.toy.biz.board.book.Impl.bookDAO;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={

		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 

		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})





public class Test2 {
	@Autowired
	private bookDAO dao;
	public Test2() {
		// TODO Auto-generated constructor stub
	}
	
	@Test
	
	public void testGetAVG(){
		
	System.out.println(dao.getAVG(247));
		
	}

	
	@Test
	public void testInsertRation(){
		Map<String ,Object> map= new HashMap<>();
		System.out.println(dao.getAVG(247));
		map.put("ration", dao.getAVG(247)); 
		map.put("no",247);
		
		dao.setRation(map);
		
		System.out.println(dao.getLibrary("247").getRation());
	}
	
}
