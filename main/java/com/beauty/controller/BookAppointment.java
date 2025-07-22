package com.beauty.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.beauty.model.AppointmentModel;
import com.beauty.service.BookAppointmentService;

/**
 * Servlet implementation class BookAppointment
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/bookappointment" })
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		String[] selectedServices = request.getParameterValues("services");

	        boolean showMakeupError = false;
	        boolean showHairError = false;
	        boolean showNailError = false;
	        boolean showCosmoError = false;
	        boolean showSpaError = false;
	        HttpSession session = request.getSession(false);
	        Integer userId = (Integer) session.getAttribute("userId");

	        System.out.println("Session: " + session);
	        System.out.println("User ID: " + (session != null ? session.getAttribute("userId") : "No session"));

	        if (selectedServices != null) {
	            List<String> services = Arrays.asList(selectedServices);

	            List<String> lowerServices = new ArrayList<>();
	            for (String service : services) {
	                lowerServices.add(service.toLowerCase());
	            }

	            // Makeup stylist validation
	            if (containsAny(lowerServices, Arrays.asList("make up")) &&
	                request.getParameter("stylist_makeup") == null) {
	                showMakeupError = true;
	            }

	            // Hair stylist validation
	            if (containsAny(lowerServices, Arrays.asList("hair")) &&
	                request.getParameter("stylist_hair") == null) {
	                showHairError = true;
	            }

	            // Nail stylist validation
	            if (containsAny(lowerServices, Arrays.asList("nail", "manicure", "pedicure")) &&
	                request.getParameter("stylist_nail") == null) {
	                showNailError = true;
	            }

	            // Cosmetologist validation
	                       if (containsAny(lowerServices, Arrays.asList("botox", "chemical", "laser")) &&
	                request.getParameter("stylist_cosmo") == null) {
	                showCosmoError = true;
	            }

	            // Spa therapist validation
	            if (containsAny(lowerServices, Arrays.asList("scrub", "relax", "slimming", "foot")) &&
	                request.getParameter("stylist_spa") == null) {
	                showSpaError = true;
	            }
	        }

	        // If any error exists, return to form
	        if (showMakeupError || showHairError || showNailError || showCosmoError || showSpaError) {
	            request.setAttribute("showMakeupError", showMakeupError);
	            request.setAttribute("showHairError", showHairError);
	            request.setAttribute("showNailError", showNailError);
	            request.setAttribute("showCosmoError", showCosmoError);
	            request.setAttribute("showSpaError", showSpaError);
	            request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
	            return;
	        }

	        // Continue with booking
	        String[] services = request.getParameterValues("services");
	        String date = request.getParameter("date");
	        String time = request.getParameter("time");

	        String stylistMakeup = request.getParameter("stylist_makeup");
	        String stylistHair = request.getParameter("stylist_hair");
	        String stylistNail = request.getParameter("stylist_nail");
	        String stylistCosmo = request.getParameter("stylist_cosmo");
	        String stylistSpa = request.getParameter("stylist_spa");

//	        String selectedServicesdb = String.join(", ", services != null ? services : new String[]{});
	        String stylist = stylistMakeup != null ? stylistMakeup :
	                         stylistHair != null ? stylistHair :
	                         stylistNail != null ? stylistNail :
	                         stylistCosmo != null ? stylistCosmo :
	                         stylistSpa;
	        
	        double totalPrice = 0.0;
	        List<String> serviceNames = new ArrayList<>();

	        if (selectedServices != null) {
	            for (String serviceWithPrice : selectedServices) {
	                String[] parts = serviceWithPrice.split(":");
	                if (parts.length == 2) {
	                    String serviceName = parts[0];
	                    double price = Double.parseDouble(parts[1]);

	                    serviceNames.add(serviceName);
	                    totalPrice += price;
	                }
	            }
	        }

	        String selectedServicesdb = String.join(", ", serviceNames);
	        System.out.println("Total Price: £" + totalPrice);
	        if (userId == null) {
	            response.sendRedirect("login.jsp"); // or handle unauthenticated user
	            return;
	        }
	     
	        BookAppointmentService service = new BookAppointmentService();
	        boolean alreadyBooked = service.isSlotTaken(date, time);

	        if (alreadyBooked) {
	            request.setAttribute("error", "Slot already booked.");
	            request.getRequestDispatcher("/WEB-INF/pages/confirmbooking.jsp").forward(request, response);
	            return;
	        }

	        AppointmentModel appointment = new AppointmentModel(userId, selectedServicesdb, stylist, date, time, totalPrice);

	        service.save(appointment);
	        request.setAttribute("appointment", appointment);  // pass appointment model
	        request.setAttribute("user", session.getAttribute("user"));  // pass logged-in user
	        // Set attributes for JSP
	        int appointmentId = service.save(appointment);
	        appointment.setAppointmentId(appointmentId);
	        request.setAttribute("appointmentID", appointmentId);
	        request.setAttribute("selectedServices", services);
	        request.setAttribute("stylist", stylist);
	        request.setAttribute("date", date);
	        request.setAttribute("time", time);
	        request.setAttribute("total", totalPrice);
	        request.getRequestDispatcher("/WEB-INF/pages/confirmbooking.jsp").forward(request, response);

	        }
	    
	

	// Helper method
	private boolean containsAny(List<String> services, List<String> keywords) {
	    for (String service : services) {
	        String serviceLower = service.toLowerCase();
	        for (String keyword : keywords) {
	            if (serviceLower.contains(keyword)) {
	                return true;
	            }
	        }
	    }
	    return false;
	}
	
	
	
	
	}


