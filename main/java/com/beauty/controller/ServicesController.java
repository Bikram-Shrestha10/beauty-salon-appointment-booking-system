package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.beauty.model.Modelservice;
import com.beauty.service.OurServiceService;
/**
 * Servlet implementation class ServicesController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/servicescontroller" })
public class ServicesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private OurServiceService serviceService;
	 @Override
	    public void init() throws ServletException {
	        this.serviceService = new OurServiceService(); // Initialize once
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
	 
    public ServicesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   try {
	            // Get services from database
	            List<Modelservice> services = serviceService.getAllServices();
	            
	            // Set the services in request attribute
	            request.setAttribute("services", services);
	            request.getRequestDispatcher("/WEB-INF/pages/services.jsp").forward(request, response);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Error loading services. Please try again later.");
	            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
	        }
	    }
	    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
