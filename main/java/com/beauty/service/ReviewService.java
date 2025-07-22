package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.ReviewModel;

public class ReviewService {
    private Connection conn;

	public ReviewService(Connection conn) {
		 this.conn = conn;
		 }
	 public boolean submitReview(ReviewModel review) {
	        try {
	            String sql = "INSERT INTO review (name, location, stylist_name, rating, comment) VALUES ( ?, ?, ?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, review.getName());
	            stmt.setString(2, review.getLocation());
	            stmt.setString(3, review.getStylistName());
	            stmt.setString(4, review.getRating());
	            stmt.setString(5, review.getComment());
	         
	            System.out.println("Name: " + review.getName());
	            System.out.println("Location: " + review.getLocation());
	            System.out.println("Stylist: " + review.getStylistName());
	            System.out.println("Rating: " + review.getRating());
	            System.out.println("Comment: " + review.getComment());
	            System.out.println("User ID: " + review.getUserId()); 
	            return stmt.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 public List<String> getAllStylistNames() {
		    List<String> stylistList = new ArrayList<>();

		    try {
		        String sql = "SELECT full_name FROM stylist";
		        PreparedStatement stmt = conn.prepareStatement(sql);
		        ResultSet rs = stmt.executeQuery();

		        while (rs.next()) {
		            stylistList.add(rs.getString("full_name"));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return stylistList;
		}

	}