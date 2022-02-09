package com.toy.biz.user.authentication;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.toy.biz.user.UserVO;
import com.toy.biz.user.impl.UserDAO;
@Service("loginService")
public class SecurityLoginService implements UserDetailsService{
	@Autowired
	private UserDAO dao;
	
	public SecurityLoginService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		System.out.println(username+"....loadUserByUsername");
		
		UserVO vo=dao.checkID(username);
		UserDetails login=null; 
		ArrayList<GrantedAuthority> authorities  = new ArrayList<GrantedAuthority>();
		
		authorities.add(new SimpleGrantedAuthority(vo.getAuthority()));
		login=new User(vo.getEmail(), vo.getPassword(),authorities);
		
		return login;
	}

}
