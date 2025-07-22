package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.beauty.util.CookieUtil;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/logout" })
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        	HttpSession session = request.getSession(false);
        	if (session != null) {
        	    session.invalidate();
        	}
            // Delete role_id cookie
            CookieUtil.deleteCookie(response, "role_id");
            // Redirect user to login page after logout
            response.sendRedirect(request.getContextPath() + "/");
        }

}
