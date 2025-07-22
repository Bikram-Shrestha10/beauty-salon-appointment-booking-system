package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beauty.config.bdconfig;
import com.beauty.model.modeluser;

public class registerservice {

		private Connection dbConn;
		public registerservice() {
			try {
				this.dbConn = bdconfig.getDbConnection();
			} catch (SQLException | ClassNotFoundException ex) {
				System.err.println("Database connection error: " + ex.getMessage());
				ex.printStackTrace();
			}
		
		}
		/**
		 * Registers a new customer in the database.
		 *
		 * @param modeluser the student details to be registered
		 * @return Boolean indicating the success of the operation
		 */
		public Boolean addUser(modeluser model_user) {
			if (dbConn == null) {
				System.err.println("Database connection is not available.");
				return null;
			}

			String roleQuery = "SELECT role_id FROM user_role WHERE role_name = ?";
			String insertQuery = "INSERT INTO user (first_name, last_name, email, phone, gender, username, password, role_id, image_path) "
					+ "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			try (PreparedStatement roleStmt = dbConn.prepareStatement(roleQuery);
					PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

				// Fetch role ID
				roleStmt.setString(1, model_user.getRole_name());
				ResultSet result = roleStmt.executeQuery();
				int roleid = result.next() ? result.getInt("role_id") : 1;

				// Insert user details
				insertStmt.setString(1, model_user.getFirst_name());
				insertStmt.setString(2, model_user.getLast_name());
				insertStmt.setString(3, model_user.getEmail());
				insertStmt.setString(4, model_user.getPhone());
				insertStmt.setString(5, model_user.getGender());
				insertStmt.setString(6, model_user.getUsername());
				insertStmt.setString(7, model_user.getPassword());
				insertStmt.setInt(8, roleid);
				insertStmt.setString(9, model_user.getImageUrl());

				return insertStmt.executeUpdate() > 0;
			} catch (SQLException e) {
				System.err.println("Error during student registration: " + e.getMessage());
				e.printStackTrace();
				return null;
			}
		}
	}

