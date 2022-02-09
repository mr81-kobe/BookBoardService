package com.toy.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.toy.biz.user.UserVO;
import com.toy.biz.util.Page;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public UserDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Transactional
	public void insertUser(UserVO vo){
		
		System.out.println(mybatis.insert("UserDAO.insertUser",vo));
		
		
	}
	
	public UserVO selectUser(UserVO vo){
		
		
		return mybatis.selectOne("UserDAO.selectUser",vo); 
		
		
	}

	public UserVO checkID(String userName){
		
		
		return mybatis.selectOne("UserDAO.checkID",userName); 
		
		
		
	} 
	
	public List<UserVO> userList(Page<UserVO> page){
		
		
		return mybatis.selectList("UserDAO.userList",page);
	}
	
	public int userCount(){
		
		return mybatis.selectOne("UserDAO.userCount");
	}

	public void deleteUser(int no){
		
		mybatis.delete("UserDAO.deleteUser",no);
	}
}
