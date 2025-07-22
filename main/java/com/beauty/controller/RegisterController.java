package com.beauty.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import com.beauty.service.registerservice;


import com.beauty.model.modeluser;
import com.beauty.util.ImageUtil;
import com.beauty.util.PasswordUtil;
import com.beauty.util.ValidationUtil;

/**
 * Servlet implementation class Register
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ImageUtil imageUtil = new ImageUtil();
	private final registerservice registerService = new registerservice();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get parameters
	
				String role_id = request.getParameter("role_id");

			    // Get parameters
		        String firstName = request.getParameter("firstName");
		        String lastName = request.getParameter("lastName");
		        String username = request.getParameter("username");
		        String gender = request.getParameter("gender");
		        String email = request.getParameter("email");
		        String number = request.getParameter("phone");
		        String password = request.getParameter("password");
		        String retypePassword = request.getParameter("re-Password");
		        String dobString = request.getParameter("dob");
		       Part image = request.getPart("image"); // For file upload
		        
				System.out.println("username: " + username);
				System.out.println("email: " + email);
				System.out.println("password: " + password);
				System.out.println("retypePassword: " + retypePassword);
				System.out.println("file: " + image);
		        String errorMsg = "";

		        // Validate fields
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
		        } else if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) {
		            errorMsg = "Passwords do not match.";
		        } else if (dobString == null || dobString.isEmpty()) {
		            errorMsg = "Date of Birth is required.";
		        } else {
		            LocalDate dob = LocalDate.parse(dobString);
		            if (!ValidationUtil.isAgeAtLeast16(dob)) {
		                errorMsg = "You must be at least 16 years old.";
		            }
		        }

		        // Validate image file
		        if (image == null || image.getSize() == 0) {
		            errorMsg = "Display picture is required.";
		        } else if (!ValidationUtil.isValidImageExtension(image)) {
		            errorMsg = "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
		        }

		        // If validation fails
		        if (!errorMsg.isEmpty()) {
		            request.setAttribute("errorMsg", errorMsg);
		            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp");

		            System.out.println("Registration failed");
		            rd.forward(request, response);
		        } else {
		            // generate unique image name
		           
		            String imageName = imageUtil.getImageNameFromPart(image);
		            String savedRelativePath = "userprofileimages/" + imageName;
		            

		            

		           modeluser modeluser = new modeluser();
		           modeluser.setFirst_name(firstName);
		           modeluser.setLast_name(lastName);
		           modeluser.setUsername(username);
		           modeluser.setGender(gender);
		           modeluser.setEmail(email);
		           modeluser.setPhone(number);
		          modeluser.setImageUrl(savedRelativePath);
		           
		           imageUtil.uploadImage(image, "userprofileimages");
		           try {
		        	    String encryptedPassword = PasswordUtil.encrypt( password);
		        	    modeluser.setPassword(encryptedPassword);
		        	} catch (Exception e) {
		        	    e.printStackTrace();
		        	    request.setAttribute("errorMessage", "Password encryption failed.");
		        	    request.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(request, response);
		        	    return;
		        	}
		           modeluser.setRole_name(role_id);
		   
		           com.beauty.service.registerservice registerService = new com.beauty.service.registerservice();
		           Boolean  isRegistred = registerService.addUser(modeluser);
		           if(isRegistred != null && isRegistred) {
		        
		        	   System.out.println("Successefully  registered");
		        	   request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		           }
		           else {
		        	   System.out.println("UNSuccessefully  registered");
		        	   request.setAttribute("errorMessage", "Something went wrong");
		        	   request.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(request, response);
		           }
		           
		           
		    }

			}

				
    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(redirectPage).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        req.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(req, resp);
    }
	
		}
//		
//		try {
//	        // Validate form inputs
//	        String validationMessage = validateRegistrationForm(request);
//	        if (validationMessage != null) {
//	            handleError(request, response, validationMessage);
//	            return;
//	        }
//
//	        // Extract model from request
//	        modeluser modeluser = extractUserModel(request);
//
//	        // Upload image first
//	        if (uploadImage(request)) {
//	            // Register user only after successful image upload
//	            Boolean isRegistered = registerService.addUser(modeluser);
//
//	            if (isRegistered != null && isRegistered) {
//	                System.out.println("Successfully registered");
//	                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
//	            } else {
//	                handleError(request, response, "Could not register your account. Please try again later!");
//	            }
//
//	        } else {
//	            handleError(request, response, "Could not upload the image. Please try again later!");
//	        }
//
//	    } catch (Exception e) {
//	        handleError(request, response, "An unexpected error occurred. Please try again later!");
//	        e.printStackTrace(); // Debug
//	    }
//	}
//	private String validateRegistrationForm(HttpServletRequest request) {
//		String firstName = request.getParameter("firstName");
//		String lastName = request.getParameter("lastName");
//		String username = request.getParameter("username");
//		String gender = request.getParameter("gender");
//		LocalDate dobStr = LocalDate.parse(request.getParameter("dob"));
//		String email = request.getParameter("email");
//		String number = request.getParameter("phone");
//		String password = request.getParameter("password");
//		String retypePassword = request.getParameter("re-Password");
//		String role_id = request.getParameter("role_id");
//		System.out.println("username: " + username);
//		System.out.println("email: " + email);
//		System.out.println("password: " + password);
//		System.out.println("retypePassword: " + retypePassword);
//
//		// Check for null or empty fields first
//		if (ValidationUtil.isNullOrEmpty(firstName))
//			return "First name is required.";
//		if (ValidationUtil.isNullOrEmpty(lastName))
//			return "Last name is required.";
//		if (ValidationUtil.isNullOrEmpty(username))
//			return "Username is required.";
//		if (dobStr == null)
//			
//			return "Date of birth is required.";
//		if (ValidationUtil.isNullOrEmpty(gender))
//			return "Gender is required.";
//		if (ValidationUtil.isNullOrEmpty(email))
//			return "Email is required.";
//		if (ValidationUtil.isNullOrEmpty(number))
//			return "Phone number is required.";
//		
//		if (ValidationUtil.isNullOrEmpty(password))
//			return "Password is required.";
//		if (ValidationUtil.isNullOrEmpty(retypePassword))
//			return "Please retype the password.";
//		System.out.println("DOB from form: " + request.getParameter("dob"));
//		// Convert date of birth
//		LocalDate dob;
//		try {
//		    dob = LocalDate.parse(request.getParameter("dob")); // Get and parse the date string here
//		} catch (Exception e) {
//		    return "Invalid date format. Please use YYYY-MM-DD.";
//		}
//		// Validate fields
//		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
//			return "Username must start with a letter and contain only letters and numbers.";
//		if (!ValidationUtil.isValidGender(gender))
//			return "Gender must be 'male' or 'female'.";
//		if (!ValidationUtil.isValidEmail(email))
//			return "Invalid email format.";
//		if (!ValidationUtil.isValidPhoneNumber(number))
//			return "Phone number must be 10 digits and start with 98.";
//		if (!ValidationUtil.isValidPassword(password))
//			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
//		if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
//			return "Passwords do not match.";
//
//		// Check if the date of birth is at least 16 years before today
//		if (!ValidationUtil.isAgeAtLeast16(dob))
//			return "You must be at least 16 years old to register.";
//
//		try {
//			Part image = request.getPart("image");
//			if (!ValidationUtil.isValidImageExtension(image))
//				return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
//		} catch (IOException | ServletException e) {
//			return "Error handling image file. Please ensure the file is valid.";
//		}
//
//		return null; // All validations passed
//	}
//	private modeluser extractUserModel(HttpServletRequest request) throws Exception {
//
//		String firstName = request.getParameter("firstName");
//		String lastName = request.getParameter("lastName");
//		String username = request.getParameter("username");
//		String gender = request.getParameter("gender");
//		LocalDate dob = LocalDate.parse(request.getParameter("dob"));
//		String email = request.getParameter("email");
//
//		int role_id = Integer.parseInt(request.getParameter("role_id"));
//		String phone = request.getParameter("phone");
//		String password = request.getParameter("password");
//		String retypePassword = request.getParameter("re-Password");
//
//		System.out.println("username: " + username);
//		System.out.println("email: " + email);
//		System.out.println("password: " + password);
//		System.out.println("retypePassword: " + retypePassword);
//
//		System.out.println("Password being set: " + password); // Or encryptedPassword
//	
//		Part image = request.getPart("image");
//		String imageUrl = imageUtil.getImageNameFromPart(image);
//
//		// Assuming password validation is already done in validateRegistrationForm
//		password = PasswordUtil.encrypt(username, password);
//		return new modeluser(firstName, lastName, username, dob, gender, email, phone, password,
//				 imageUrl, role_id);
//	}
//	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
//		Part image = req.getPart("image");
//		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");
//	}
//
//	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
//			throws ServletException, IOException {
//		req.setAttribute("success", message);
//		req.getRequestDispatcher(redirectPage).forward(req, resp);
//	}
//	
//	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
//			throws ServletException, IOException {
//		req.setAttribute("error", message);
//		req.setAttribute("firstName", req.getParameter("firstName"));
//		req.setAttribute("lastName", req.getParameter("lastName"));
//		req.setAttribute("username", req.getParameter("username"));
//		req.setAttribute("dob", req.getParameter("dob"));
//		req.setAttribute("gender", req.getParameter("gender"));
//		req.setAttribute("email", req.getParameter("email"));
//		req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
//		req.setAttribute("subject", req.getParameter("subject"));
//		req.getRequestDispatcher("/WEB-INF/pages/userregistration.jsp").forward(req, resp);
//	}
//}

		
		
	

	


