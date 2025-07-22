package com.beauty.service;

import java.util.List;

import com.beauty.model.modeluser;

public class ModeluserService {
	 private Adminuserservice adminuserservice;

	    public ModeluserService() {
	    	adminuserservice = new Adminuserservice(); // DAO that connects to DB
	    }

	    public List<modeluser> getAllUsers() {
	        return adminuserservice.getAllUsers(); // Method that fetches users from DB
	    }
	}