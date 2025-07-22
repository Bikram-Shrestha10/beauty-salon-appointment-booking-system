package com.beauty.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.modeluser;

public class Adminuserservice {
	private DeleteUser deleteuser;
	public Adminuserservice() {
		deleteuser = new DeleteUser ();
		}
	 
    public List<modeluser> getAllUsers() {
        List<modeluser> userList = new ArrayList<>();

        try {
            Connection conn = bdconfig.getDbConnection();
            String sql = "SELECT * FROM user";  // Make sure your table name is correct
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                modeluser user = new modeluser();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setFirst_name(rs.getString("first_name")); // change as per your column name
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                userList.add(user);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
    
//    public void deleteUser(int userId) {
//        try (Connection conn = bdconfig.getConnection();
//             PreparedStatement stmt = conn.prepareStatement("DELETE FROM user WHERE user_id = ?")) {
//            stmt.setInt(1, userId);
//            int rowsAffected = stmt.executeUpdate();
//            System.out.println("Rows deleted: " + rowsAffected); // for debugging
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
    public boolean deleteUserById(int userId) {
        return deleteuser.deleteUser(userId);
    }
 // Get total user count
    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM user";
        return executeCountQuery(sql);
    }

 // Total number of appointments
    public int getTotalAppointments() {
        String sql = "SELECT COUNT(*) FROM appointment";
        return executeCountQuery(sql);
    }

    // Total number of stylists
    public int getTotalStylists() {
        String sql = "SELECT COUNT(*) FROM stylist";
        return executeCountQuery(sql);
    }

    // Total number of reviews
    public int getTotalReviews() {
        String sql = "SELECT COUNT(*) FROM review";
        return executeCountQuery(sql);
    }

    // Reusable private method
    private int executeCountQuery(String sql) {
        try (Connection conn = bdconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }
    

}