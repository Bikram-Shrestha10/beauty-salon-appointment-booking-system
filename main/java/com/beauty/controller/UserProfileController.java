package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.beauty.model.modeluser;
import com.beauty.service.UpdateService;
import com.beauty.util.SessionUtil;

/**
 * Servlet implementation class userprofile
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userprofile" })
public class UserProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UpdateService updateService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileController() {
        this.updateService = new UpdateService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("user") != null) {
            modeluser user = (modeluser) SessionUtil.getAttribute(request, "user");
//            SessionUtil.removeAttribute(request, "user");
            request.setAttribute("user", user);
        }
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method=request.getParameter("_method");
		if ("PUT".equals(method)) {
//			handlePutRequest(request);
		}else {
			int userid = Integer.parseInt(request.getParameter("user_id"));
	        String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	        String email = request.getParameter("email");
	        String number = request.getParameter("number");
	        HttpSession session = request.getSession();

	        System.out.println("user_id = " + request.getParameter("user_id"));

	        // Create StudentModel object with updated data
	        //modeluser user = new modeluser(userid, firstName, 
	               // lastName, email, number);
	        modeluser user = (modeluser) session.getAttribute("user");
	        session.setAttribute("user", user);
	        
	        if (user == null) {
	            // For debugging
	            System.out.println("User is null in servlet");
	            response.sendRedirect("login.jsp"); // redirect if not logged in
	            return;
	        }
	        
	        // Attempt to update student information in the database
	        Boolean result = updateService.updateUserInfo(user);
	        System.out.printf("name", firstName);
	        if (result != null && result) {
	        	
	        	response.sendRedirect(request.getContextPath() + "/WEB-INF/pages/userprofile"); // Redirect to dashboard on success
	        } else {
	            request.getSession().setAttribute("user", user);
	            handleUpdateFailure(request, response, result); // Handle failure
	        }
		}
    }

    /**
     * Handles update failures by setting an error message and forwarding the request 
     * back to the update page.
     * 
     * @param req The HttpServletRequest object containing the request data.
     * @param resp The HttpServletResponse object used to return the response.
     * @param loginStatus Indicates the result of the update operation.
     * @throws ServletException If an error occurs during request processing.
     * @throws IOException If an input or output error occurs.
     */
    private void handleUpdateFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
            throws ServletException, IOException {
        // Determine error message based on update result
        String errorMessage;
        if (loginStatus == null) {
            errorMessage = "Our server is under maintenance. Please try again later!";
        } else {
            errorMessage = "Update Failed. Please try again!";
        }
        req.setAttribute("error", errorMessage);
        req.getRequestDispatcher(req.getContextPath() + "/WEB-INF/pages/userprofile.jsp").forward(req, resp);
    }
    
    
//    private void handlePutRequest(HttpServletRequest request) {
//    	q1` mj	
//    }
}