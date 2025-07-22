package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.beauty.config.bdconfig;

public class DeleteUser {
	 private Connection dbConn;
	    private boolean isConnectionError = false;
    public DeleteUser() {
   	 try {
           dbConn = bdconfig.getDbConnection();
       } catch (SQLException | ClassNotFoundException ex) {
           ex.printStackTrace();
           isConnectionError = true;
       }
   }
	public boolean deleteUser(int userId) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM user WHERE user_id = ?";

      
        try (PreparedStatement stmt = dbConn.prepareStatement(sql))  {
            
            stmt.setInt(1, userId);
            rowDeleted = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
}
