package com.beauty.service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beauty.config.bdconfig;
import com.beauty.model.modeluser;

public class UpdateService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
    public UpdateService() {
        try {
            dbConn = bdconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the connection error
            isConnectionError = true;
        }
    }

    /**
     * Updates user information in the database.
     * 
     * @param user The modeluser object containing updated user data.
     * @return true if update is successful, false otherwise. Returns null if DB connection failed.
     */
    public Boolean updateUserInfo(modeluser user) {
        if (isConnectionError) {
            return null;
        }

        String updateSQL = "UPDATE user SET first_name = ?, last_name = ?, email = ?, phone = ?, username = ?, password = ?  WHERE user_id = ?";

        try (PreparedStatement preparedStatement = dbConn.prepareStatement(updateSQL)) {
            preparedStatement.setString(1, user.getFirst_name());
            preparedStatement.setString(2, user.getLast_name());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getPassword()); // Assuming password is encrypted before passed
            preparedStatement.setInt(7, user.getUser_id());
          
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL error
            return null;
        }
    }

    /**
     * Retrieves the role ID for a given role name.
     * 
     * @param roleName The name of the role.
     * @return The role ID, or 0 if not found or an error occurs.
     */
    public int getRoleIdByName(String roleName) {
        if (isConnectionError) {
            return 0;
        }

        String selectSQL = "SELECT role_id FROM role WHERE role_name = ?";

        try (PreparedStatement preparedStatement = dbConn.prepareStatement(selectSQL)) {
            preparedStatement.setString(1, roleName);
            ResultSet result = preparedStatement.executeQuery();

            if (result.next()) {
                return result.getInt("role_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    public boolean updateServicePrice(int serviceId, double newPrice) {
        if (isConnectionError) {
            return false;
        }

        String sql = "UPDATE service SET price = ? WHERE service_id = ?";

        try (PreparedStatement ps = dbConn.prepareStatement(sql)) {
            ps.setDouble(1, newPrice);
            ps.setInt(2, serviceId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}