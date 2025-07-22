package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.Modelservice;
import com.beauty.service.OurServiceService;
import com.beauty.service.UpdateService;

/**
 * Servlet implementation class AdminServiceController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminservice" })
public class AdminServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServiceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            OurServiceService service = new OurServiceService(); // or inject connection
            List<Modelservice> services = service.getAllServices();

            request.setAttribute("serviceList", services);
            request.getRequestDispatcher("/WEB-INF/pages/adminservice.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load services.");
            request.getRequestDispatcher("/WEB-INF/pages/adminservice.jsp").forward(request, response);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   int serviceId = Integer.parseInt(request.getParameter("serviceId"));
		    double newPrice = Double.parseDouble(request.getParameter("price"));

		    UpdateService updateService = new UpdateService();
		    boolean success = updateService.updateServicePrice(serviceId, newPrice);

		    if (success) {
		        System.out.println("✅ Price updated successfully for service_id = " + serviceId);
		        request.setAttribute("message", "Price updated successfully.");
		    } else {
		        System.out.println("❌ Failed to update price.");
		        request.setAttribute("error", "Failed to update price.");
		    }

		    // Redirect to GET method to reload service list
		    response.sendRedirect("adminservice");
		
    }
}