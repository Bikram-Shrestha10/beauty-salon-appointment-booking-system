package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.beauty.config.bdconfig;

/**
 * Servlet implementation class UpdatePriceController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updateprice" })
public class UpdatePriceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePriceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int serviceId = Integer.parseInt(request.getParameter("service_id"));
        double newPrice = Double.parseDouble(request.getParameter("price"));

        try (Connection conn = bdconfig.getConnection()) {
            String sql = "UPDATE service SET price = ? WHERE service_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setDouble(1, newPrice);
            stmt.setInt(2, serviceId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the same page
		 request.getRequestDispatcher("/WEB-INF/pages/adminservice.jsp").forward(request, response);
    }
}
