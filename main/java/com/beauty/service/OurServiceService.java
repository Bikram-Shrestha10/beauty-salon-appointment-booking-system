package com.beauty.service;

import java.security.Provider.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.Modelservice;

public class OurServiceService {
 
    
    public List<Modelservice> getAllServices() {
        List<Modelservice> services = new ArrayList<>();
        
        // Modified query to order by category for proper grouping
        String query = "SELECT service_id, service_title, price, duration, category, image_path " +
                      "FROM service ORDER BY category, service_title";
        
        try (Connection con = bdconfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Modelservice service = new Modelservice(
                    rs.getInt("service_id"),
                    rs.getString("service_title"),
                    rs.getDouble("price"),
                    rs.getInt("duration"),
                    rs.getString("category"),
                    rs.getString("image_path")
                );
                services.add(service);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Database error in getAllServices(): " + e.getMessage());
            // Consider throwing a custom exception here
        } 
        
        return services;
    }
    
    public Modelservice getServiceByName(String name) {
        Modelservice Displayservices = null;
        
           String query = "SELECT * FROM services WHERE service_name = ?";
           try (Connection con = bdconfig.getDbConnection();
                   PreparedStatement ps = con.prepareStatement(query)){
        		   ps.setString(1, name);
        		   ResultSet rs = ps.executeQuery();
                  
                  if (rs.next()) {
                	  Displayservices = new Modelservice();
                	  Displayservices.setServiceId(rs.getInt("service_id"));
                	  Displayservices.setTitle(rs.getString("service_title"));
                	  Displayservices.setDuration(rs.getInt("duration"));
                     
                      
                  }
                  con.close();
              }
        catch (SQLException | ClassNotFoundException e) {
                  System.err.println("Database error in getAllServices(): " + e.getMessage());
                  // Consider throwing a custom exception here
              } 
              
              return Displayservices;
    }
    
    
    public List<Modelservice> searchServicesByName(String keyword) {
        List<Modelservice> results = new ArrayList<>();

        try (Connection conn = bdconfig.getDbConnection()) {
        	String sql = "SELECT * FROM service WHERE LOWER(service_title) LIKE ? OR LOWER(category) LIKE ?";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
            	String likeKeyword = "%" + keyword.toLowerCase() + "%";
            	ps.setString(1, likeKeyword);
            	ps.setString(2, likeKeyword);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Modelservice s = new Modelservice();
                    s.setServiceId(rs.getInt("service_id"));
                    s.setTitle(rs.getString("service_title"));      
                    s.setCategory(rs.getString("category"));         
                    s.setDuration(rs.getInt("duration"));
                    s.setPrice(rs.getDouble("price"));  
                    s.setImagePath(rs.getString("image_path"));
                    results.add(s);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return results;
    }
}
