package com.laptrinhjavaweb.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhjavaweb.dto.MyUser;

public class SecurityUtils {
	
	public static MyUser getPrincipal() {
		MyUser myUser = (MyUser)(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		return myUser;
	}

	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		List<String> result = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)
				(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		for(GrantedAuthority authority : authorities) {
			result.add(authority.getAuthority());
		}
		return result;
	}
	
	public static boolean isAuthentication() {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(obj != "anonymousUser") {
			return true;
		}
		return false;
	}
	
}
