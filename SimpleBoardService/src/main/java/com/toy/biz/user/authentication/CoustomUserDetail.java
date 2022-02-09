package com.toy.biz.user.authentication;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.toy.biz.user.UserVO;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CoustomUserDetail implements UserDetails {

	public CoustomUserDetail() {
		// TODO Auto-generated constructor stub
	}
	
	private String ID;
	private String PASSWORD;
	private String NAME;
	private String AUTHORITY;
	private boolean ENABLED;
	private static final long serialVersionUID = 1L;
    private UserVO user;

    

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}

	@Override
	public String getPassword() {
		return PASSWORD;
	}

	@Override
	public String getUsername() {
		return ID;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String name) {
		NAME = name;
	}

}
