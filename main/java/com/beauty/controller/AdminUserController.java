package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.beauty.model.modeluser;
import com.beauty.service.Adminuserservice;

/**9/
 * Servlet implementation class AdminUserController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminuser" })
public class AdminUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private Adminuserservice adminuserservice;

    @Override
    public void init() throws ServletException {
    	adminuserservice = new Adminuserservice(); // Initialize your service or DAO
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   try {
	            List<modeluser> userList = adminuserservice.getAllUsers();
	            request.setAttribute("userList", userList);
	            String successMessage = (String) request.getSession().getAttribute("successMessage");
	            String errorMessage = (String) request.getSession().getAttribute("errorMessage");

	            request.setAttribute("successMessage", successMessage);
	            request.setAttribute("errorMessage", errorMessage);

	            request.getSession().removeAttribute("successMessage");
	            request.getSession().removeAttribute("errorMessage");
	            
	            request.getRequestDispatcher("/WEB-INF/pages/adimUser.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load users.");
	        }
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String action = request.getParameter("action");

	        if ("delete".equals(action)) {
	            try {
	                int userId = Integer.parseInt(request.getParameter("user_id"));
	                boolean deleted = adminuserservice.deleteUserById(userId);
	                System.out.println("ENtered");
	                if (deleted) {
	                    request.getSession().setAttribute("successMessage", "User deleted successfully.");
	                } else {
	                    request.getSession().setAttribute("errorMessage", "Failed to delete user.");
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.getSession().setAttribute("errorMessage", "Error deleting user.");
	            }

	            response.sendRedirect(request.getContextPath() + "/adminuser");
	        }
	    }
}
