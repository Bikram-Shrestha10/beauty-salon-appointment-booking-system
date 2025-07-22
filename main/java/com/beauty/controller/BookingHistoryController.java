package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.beauty.model.modeluser;
import com.beauty.util.SessionUtil;

/**
 * Servlet implementation class BookingHistoryController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/bookinghistorycontroller" })
public class BookingHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingHistoryController() {
        super();
        // TODO Auto-generated constructor stub
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
