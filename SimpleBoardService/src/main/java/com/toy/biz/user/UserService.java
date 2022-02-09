package com.toy.biz.user;

import java.util.List;

import com.toy.biz.util.Page;

public interface UserService {
	
	public void insertUser(UserVO vo); 
	public UserVO selectUser(UserVO vo);
	public String check(String vo);
	
	public List<UserVO> userList(Page<UserVO> page);
	
	public int userCount();
	
	public void deleteUser(String no);
}
