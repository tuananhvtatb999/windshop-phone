package com.windshop.phone.config;

import org.springframework.security.access.AccessDeniedException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class CustomerAccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {
		response.sendRedirect(request.getContextPath() + "/role-blocked");
	}
}
