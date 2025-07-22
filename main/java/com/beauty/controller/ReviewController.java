package com.beauty.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.ReviewModel;
import com.beauty.model.modeluser;
import com.beauty.service.ReviewService;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/review" })
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (Connection conn = bdconfig.getConnection()) {
		    ReviewService service = new ReviewService(conn);

		    // This method fetches stylist names like "Samantha", "Riya", etc.
		    List<String> stylistList = service.getAllStylistNames();
		    request.setAttribute("stylistList", stylistList);

		    // Forward to JSP
		    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/review.jsp");
	        rd.forward(request, response);
	        } catch (Exception e) {
		    e.printStackTrace();
		    request.setAttribute("error", "Database connection error.");
		    request.getRequestDispatcher("/WEB-INF/pages/review.jsp").forward(request, response);
		}
		 
	        }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String stylist = request.getParameter("stylist");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("review");

  
        ReviewModel review = new ReviewModel();
        review.setName(name);
        review.setLocation(location);
        review.setStylistName(stylist);
        review.setRating(rating);
        review.setComment(comment);
   

        try (Connection conn = bdconfig.getConnection()) {
            ReviewService service = new ReviewService(conn);
            
            boolean success = service.submitReview(review);

            if (success) {
                response.sendRedirect("review-success.jsp");
            } else {
                response.sendRedirect("review-error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("review-error.jsp");
        }
    }
}