package com.beauty.controller.filter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.beauty.util.CookieUtil;
import com.beauty.util.SessionUtil;



	@WebFilter(asyncSupported = true, urlPatterns = "/*")
	public class AuthenticationFilter implements Filter {

	    private static final String LOGIN = "/login";
	    private static final String REGISTER = "/register";
	    private static final String HOME = "/home";
	    private static final String SERVICES = "/servicescontroller";
	    private static final String ROOT = "/";
	    private static final String DASHBOARD = "/adminDashboard";
	    private static final String ADMINUSER = "/adminuser";
	    private static final String BOOKAPPOINTMENT = "/bookappointment";
	    private static final String MYAPPOINTMENT = "/myappointmentController";
	    private static final String MODIFY_USER = "/userprofile";
	    private static final String USER_UPDATE = "/usersettings";
	    private static final String ABOUT = "/aboutus";
	    private static final String BOOKINGHISTORY = "/userbookinghistory";
	    private static final String CONTACT = "/contactus";
	    private static final String LOGOUT = "/logout";
	    private static final String Apoinments = "/myappointmentController";
	    private static final String Conform = "/bookingconfirmed";
	    private static final String Review = "/review";
	    private static final String ADMINSERVICE = "/adminservice";
	    private static final String Search = "/search";
	    @Override
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	            throws IOException, ServletException {

	        HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse res = (HttpServletResponse) response;

	        String uri = req.getRequestURI();

	        // Allow static resources
	        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") || uri.endsWith(".jpg") || uri.contains("/assets/")) {
	            chain.doFilter(request, response);
	            return;
	        }

	        boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
	        String userRole = CookieUtil.getCookie(req, "role_id") != null 
	        	    ? CookieUtil.getCookie(req, "role_id").getValue() 
	        	    : null;

	        if ("admin".equalsIgnoreCase(userRole)) {
//	            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//	                res.sendRedirect(req.getContextPath() + DASHBOARD);
//	        }
	        	if (uri.endsWith(DASHBOARD) || uri.endsWith(ADMINUSER) || uri.endsWith(ADMINSERVICE) || uri.endsWith(LOGOUT) || uri.endsWith(Apoinments)
	                    || uri.endsWith(ROOT)) {
	                chain.doFilter(request, response);
	            } else {
	                res.sendRedirect(req.getContextPath() + DASHBOARD);
	            }
	        } else if ("user".equalsIgnoreCase(userRole)) {
//	            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//	                res.sendRedirect(req.getContextPath() + HOME);
//	            } 
	        	if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(ABOUT) || uri.endsWith(SERVICES) || uri.endsWith(BOOKAPPOINTMENT)
	            		|| uri.endsWith(MYAPPOINTMENT) || uri.endsWith(MODIFY_USER) || uri.endsWith(BOOKINGHISTORY) || uri.endsWith(LOGOUT)
	            		|| uri.endsWith(USER_UPDATE) || uri.endsWith(Search)||  uri.endsWith(Review) || uri.endsWith(Conform)
	                    || uri.endsWith(CONTACT) || uri.endsWith(LOGIN) || uri.endsWith(REGISTER))  {
	                chain.doFilter(request, response);
	            } else {
	                res.sendRedirect(req.getContextPath() + HOME);
	            }
	        } else {
	            // Not logged in
	            if (uri.endsWith(LOGIN) || uri.endsWith(LOGOUT) || uri.endsWith(SERVICES) || uri.endsWith(Search) || uri.endsWith(REGISTER) || uri.endsWith(ABOUT) || uri.endsWith(CONTACT) || uri.endsWith(ROOT))  {
	                chain.doFilter(request, response);
	            } else {
	                res.sendRedirect(req.getContextPath() + LOGIN);
	                System.out.println("User not logged in");
	            }
	        }
	    }

	    @Override
	    public void init(FilterConfig filterConfig) throws ServletException {}

	    @Override
	    public void destroy() {}
	}