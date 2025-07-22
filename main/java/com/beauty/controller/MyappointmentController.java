package com.beauty.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.beauty.model.Appointment;
import com.beauty.model.Modelservice;
import com.beauty.service.AppointmentService;
import com.beauty.service.OurServiceService;

/**
 * Servlet implementation class MyappointmentController
 */
@WebServlet("/myappointmentController")
public class MyappointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyappointmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //user appoinments page
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 AppointmentService service = new AppointmentService();
		    request.setAttribute("appointments", service.getAllAppointments()); // fetch all
		    request.getRequestDispatcher("/WEB-INF/pages/My Appointment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String[] selectedServiceNames = request.getParameterValues("services");

	    List<Modelservice> selectedServices = new ArrayList<>();
	    OurServiceService serviceService = new OurServiceService();

	    if (selectedServiceNames != null) {
	        for (String name : selectedServiceNames) {
	            Modelservice service = serviceService.getServiceByName(name);
	            if (service != null) {
	                selectedServices.add(service);
	            }
	        }
	    }

	    request.setAttribute("selectedServices", selectedServices);

	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/My Appointment.jsp");
	    rd.forward(request, response);
		
		        int appointmentId = Integer.parseInt(request.getParameter("appointment_id")); // Verify parameter name
		      

		       
		        Appointment appointment = new AppointmentService().getAppointmentById(appointmentId);

		        if (appointment != null) {
		            request.setAttribute("appointmentId", appointment.getAppointmentId());
		            request.setAttribute("serviceName", appointment.getServiceName());
		            request.setAttribute("date", appointment.getDate());
		            request.setAttribute("time", appointment.getTime());
		            request.setAttribute("stylist", appointment.getStylist());

		            request.setAttribute("appointment", appointment);
		        } else {
		            request.setAttribute("error", "No appointment found with ID " + appointmentId);
		        }
		 
	}
	}