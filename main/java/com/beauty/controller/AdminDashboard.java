package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.beauty.service.Adminuserservice;

/**
 * Servlet implementation class adminDashboard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminDashboard" })
public class AdminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Adminuserservice userService = new Adminuserservice();

		int totalUsers = userService.getTotalUsers();
		request.setAttribute("totalAppointments", userService.getTotalAppointments());
		request.setAttribute("totalStylists", userService.getTotalStylists());
		request.setAttribute("totalReviews", userService.getTotalReviews());


		request.setAttribute("totalUsers", totalUsers);
		request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
