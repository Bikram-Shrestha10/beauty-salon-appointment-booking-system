package com.beauty.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.beauty.model.modeluser;
import com.beauty.service.loginService;
import com.beauty.util.CookieUtil;
import com.beauty.util.SessionUtil;

/**
 * Servlet implementation class login
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       private final loginService loginService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
    	super();
        this.loginService = new loginService();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("Username"+username);
        System.out.println("Password"+password);
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Username and password are required.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        modeluser user = loginService.getUserByUsernamePass(username, password);

        if (user == null) {
            System.out.println("User not logged in");
            handleLoginFailure(request, response, false);
            return;
        }

        // Success
        System.out.println("Found user: " + user.getUsername());
        System.out.println("Role: " + user.getRole_name());

        HttpSession session = request.getSession(true);
        session.setAttribute("userId", user.getUser_id()); 
        SessionUtil.setAttribute(request, "user_id", user.getUser_id());
        SessionUtil.setAttribute(request, "username", user.getUsername());
        SessionUtil.setAttribute(request, "role_name", user.getRole_name());
        //SessionUtil.setAttribute(request, "user", user);

        CookieUtil.addCookie(response, "role_id", user.getRole_name(), 10 * 60);

        if ("admin".equalsIgnoreCase(user.getRole_name())) {
            response.sendRedirect(request.getContextPath() + "/adminDashboard");
        } else if ("user".equalsIgnoreCase(user.getRole_name())) {
          
            session.setAttribute("user", user);
 
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            handleLoginFailure(request, response, false);
        }
    }
    
    private void handleLoginFailure(HttpServletRequest request, HttpServletResponse response, Boolean loginStatus)
            throws ServletException, IOException {
        String errorMessage;
        if (loginStatus == null) {
            errorMessage = "Our server is under maintenance. Please try again later!";
        } else {
            errorMessage = "Username or password incorrect. Please try again!";
        }
        request.setAttribute("errorMsg", errorMessage);
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
}