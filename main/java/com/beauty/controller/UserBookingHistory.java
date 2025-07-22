package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.beauty.model.AppointmentModel;
import com.beauty.model.HistoryModel;
import com.beauty.model.modeluser;
import com.beauty.service.AppointmentService;
import com.beauty.service.HistoryService;

/**
 * Servlet implementation class UserBookingHistory
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userbookinghistory" })
public class UserBookingHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final HistoryService bookingHistoryService = new HistoryService();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBookingHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Get the currently logged-in user from session
        HttpSession session = request.getSession();
        modeluser user = (modeluser) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Fetch booking history using service
        int userId = user.getUser_id();
        List<HistoryModel> historyList = bookingHistoryService.getBookingHistoryByUserId(userId);

        // Set attributes for JSP
        request.setAttribute("user", user);
        request.setAttribute("historyList", historyList);
        System.out.println(userId);
		request.getRequestDispatcher("/WEB-INF/pages/userbookinghistory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
