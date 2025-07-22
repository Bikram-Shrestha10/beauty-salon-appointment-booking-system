package com.beauty.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.beauty.model.Modelservice;
import com.beauty.service.OurServiceService;

/**
 * Servlet implementation class SearchController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/search" })
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String keyword = request.getParameter("query");
		 if (keyword != null && !keyword.trim().isEmpty()) {
			 OurServiceService service = new OurServiceService();
			 List<Modelservice> results = service.searchServicesByName(keyword);
			 request.setAttribute("searchQuery", keyword);
	            request.setAttribute("results", results);
	        }
	        request.getRequestDispatcher("/WEB-INF/pages/searchresults.jsp").forward(request, response);
	    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
