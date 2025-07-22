package com.beauty.model;

import java.sql.Date;

public class ReviewModel {

	 private String name;
	    private String location;
	    private String stylistName;
	    private String rating;
	    private String comment;
	    private int userId;

	    // Getters & Setters
	    public String getName() { return name; }
	    public void setName(String name) { this.name = name; }

	    public String getLocation() { return location; }
	    public void setLocation(String location) { this.location = location; }

	    public String getStylistName() { return stylistName; }
	    public void setStylistName(String stylistName) { this.stylistName = stylistName; }

	    public String getRating() { return rating; }
	    public void setRating(String rating) { this.rating = rating; }

	    public String getComment() { return comment; }
	    public void setComment(String comment) { this.comment = comment; }

	    public int getUserId() { return userId; }
	    public void setUserId(int userId) { this.userId = userId; }
	}
