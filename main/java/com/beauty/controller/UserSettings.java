package com.beauty.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.beauty.model.modeluser;
import com.beauty.service.UpdateService;
import com.beauty.util.PasswordUtil;
import com.beauty.util.SessionUtil;
import com.beauty.util.ValidationUtil;

/**
 * Servlet implementation class UserSettings
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/usersettings" })
public class UserSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSettings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        modeluser user = null;

        // Check if user is logged in (session attribute exists)
        if (request.getSession().getAttribute("user") != null) {
            user = (modeluser) SessionUtil.getAttribute(request, "user");
            request.setAttribute("user", user);

            // Decrypt password only if user is not null
            String encryptedPassword = user.getPassword(); 
            String decryptedPassword = PasswordUtil.decrypt(encryptedPassword);
            request.setAttribute("userPassword", decryptedPassword);
        }

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/pages/usersettings.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 modeluser user = (modeluser) SessionUtil.getAttribute(request, "user");
		    int userId = user.getUser_id(); // or however your user is identified

	        String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	        String username = request.getParameter("username");

	        String email = request.getParameter("email");
	        String number = request.getParameter("phone");
	        String password = request.getParameter("password");
		    
		    // Optional: encrypt password again before saving
		    String encryptedPassword = PasswordUtil.encrypt(password);
		    String errorMsg = "";
		    if (ValidationUtil.isNullOrEmpty(firstName)) {
	            errorMsg = "First Name is required.";
	        } else if (ValidationUtil.isNullOrEmpty(lastName)) {
	            errorMsg = "Last Name is required.";
	        } else if (ValidationUtil.isNullOrEmpty(username)) {
	            errorMsg = "Username is required.";
	        } else if (ValidationUtil.isNullOrEmpty(email)) {
	            errorMsg = "Email is required.";
	        } else if (!ValidationUtil.isValidEmail(email)) {
	            errorMsg = "Invalid email format.";
	        } else if (ValidationUtil.isNullOrEmpty(number)) {
	            errorMsg = "Phone number is required.";
	        } else if (!ValidationUtil.isValidPhoneNumber(number)) {
	            errorMsg = "Phone number must be 10 digits and start with 98.";
	        } else if (ValidationUtil.isNullOrEmpty(password)) {
	            errorMsg = "Password is required.";
	        } else if (!ValidationUtil.isValidPassword(password)) {
	            errorMsg = "Password must be at least 8 characters and include at least 1 capital letter, 1 number, and 1 symbol.";
	        }
		    if (!errorMsg.isEmpty()) {
		        request.setAttribute("errorMsg", errorMsg);
		        request.setAttribute("user", user);
		        request.setAttribute("userPassword", password);
		        request.getRequestDispatcher("/WEB-INF/pages/usersettings.jsp").forward(request, response);
		        return;
		    }

		    // Set new values
		    user.setFirst_name(firstName);
		    user.setLast_name(lastName);
		    user.setUsername(username);
		    user.setEmail(email);
		    user.setPhone(number);
		    try {
        	    String encryptedPass = PasswordUtil.encrypt( password);
        	    user.setPassword(encryptedPass);
        	} catch (Exception e) {
        	    e.printStackTrace();
        	    request.setAttribute("errorMessage", "Password encryption failed.");
        	    request.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(request, response);
        	    return;
        	}


		    UpdateService updateService = new UpdateService();
		    Boolean isUpdated = updateService.updateUserInfo(user);

		    if (Boolean.TRUE.equals(isUpdated)) {
		        SessionUtil.setAttribute(request, "user", user); // update session with new user data
		        request.setAttribute("successMsg", "Your information has been updated successfully.");
		    } else {
		        request.setAttribute("errorMsg", "Failed to update your information. Please try again.");
		    }

		    request.setAttribute("user", user);
		    request.setAttribute("userPassword", password);
		    request.getRequestDispatcher("/WEB-INF/pages/usersettings.jsp").forward(request, response);
	           
	    }
	}


