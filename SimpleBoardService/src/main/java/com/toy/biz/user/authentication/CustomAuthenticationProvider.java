package com.toy.biz.user.authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;



public class CustomAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private UserDetailsService userService;

	public CustomAuthenticationProvider() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		String username = (String) authentication.getPrincipal(); 
		String password=(String) authentication.getCredentials(); 
		UserDetails user = userService.loadUserByUsername(username); 
		if(!matchPass(password,user.getPassword())){
			throw new BadCredentialsException(username);
		}
		
		
		
		return new UsernamePasswordAuthenticationToken(username, password,user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}
	
	public boolean matchPass(String loginPwd ,String password){
		return loginPwd.equals(password);
		
	}
}
