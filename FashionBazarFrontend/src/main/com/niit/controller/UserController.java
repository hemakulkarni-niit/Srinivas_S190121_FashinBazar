package com.niit.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController 
{
	
	@RequestMapping("/login_success")
	public String loginProcess(HttpSession session,Model m)
	{
		String page=null;
		boolean loggedIn=true;
		
		System.out.println("Login Success :");
		
		SecurityContext securityContext=SecurityContextHolder.getContext();
		Authentication authentication=securityContext.getAuthentication();
		String username=authentication.getName();
		
		System.out.println(username);
		Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role:roles)
		{
			
			String roleName=role.getAuthority();
			session.setAttribute("loggedIn", loggedIn);
			session.setAttribute("username",username);
			session.setAttribute("role",roleName);
			
			if(roleName.equals("ROLE_USER"))
			{
				page="UserHome";
			}
			else
			{
				page="AdminHome";	
			}
		}
		
		return page;
	}
	
	@RequestMapping("/perform_logout")
	public String loggingOut(HttpSession session,Model m)
	{
		session.invalidate();
		m.addAttribute("errorInfo","Successfully Logged Out");
		return "Login";
	}
}