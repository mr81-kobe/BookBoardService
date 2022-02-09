package com.toy.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.biz.user.UserService;
import com.toy.biz.user.UserVO;
import com.toy.biz.util.Page;
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.insertUser(vo);
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.selectUser(vo);
	}

	@Override
	public String check(String vo) {
		// TODO Auto-generated method stub
		
		UserVO user1 = dao.checkID(vo);
		
		if(user1!=null){
		return user1.getEmail();	
		}
		else{
			return "¼º°ø";
		}
		
	}

	@Override
	public List<UserVO> userList(Page<UserVO> page) {
		// TODO Auto-generated method stub
		return dao.userList(page);
	}

	@Override
	public int userCount() {
		// TODO Auto-generated method stub
		return dao.userCount();
	}

	
	//userAdmin
	@Override
	public void deleteUser(String no) {
		// TODO Auto-generated method stub
		dao.deleteUser(Integer.parseInt(no));
	}
	
	
	
	
	
	
}
