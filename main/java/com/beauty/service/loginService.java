package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beauty.config.bdconfig;
import com.beauty.model.modeluser;
import com.beauty.util.PasswordUtil;


	public class loginService {

	    private Connection dbConn;
	    private boolean isConnectionError = false;
	    public loginService() {
	    	 try {
	            dbConn = bdconfig.getDbConnection();
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            isConnectionError = true;
	        }
	    }
	    

	    // 1. Check if username and password are valid
	    public boolean isValidUser(String username, String password) {
	        modeluser user = getUser(username);
	        if (user == null) return false;

	        String decryptedPass = PasswordUtil.decrypt(user.getPassword());
	        return decryptedPass.equals(password);
	    }

	    // 2. Get user details by username
	    public modeluser getUser(String username) {
	        modeluser user = null;

	        String sql = "SELECT u.*, r.role_name FROM user u JOIN user_role r ON u.role_id = r.role_id WHERE u.username = ?";

	        try (PreparedStatement ps = dbConn.prepareStatement(sql)) {
	            ps.setString(1, username);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                user = new modeluser();
	                user.setUser_id(rs.getInt("user_id"));
	                user.setFirst_name(rs.getString("first_name"));
	                user.setLast_name(rs.getString("last_name"));
	                user.setEmail(rs.getString("email"));
	                user.setPhone(rs.getString("phone"));
	                user.setGender(rs.getString("gender"));
	                user.setUsername(rs.getString("username"));
	                user.setPassword(rs.getString("password")); // Encrypted
	                user.setRole_id(rs.getInt("role_id"));
	                user.setRole_name(rs.getString("role_name"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }

	    // 3. Login and return true if admin, false if regular user, null if error
	    public Boolean loginUser(String username, String password) {
	        modeluser user = getUser(username);
	        if (user == null) return false;

	        try {
	            String decrypted = PasswordUtil.decrypt(user.getPassword());
	            if (decrypted.equals(password)) {
	                return "admin".equalsIgnoreCase(user.getRole_name());
	            } else {
	                return false;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null; // decryption error
	        }
	    }

	    // 4. Optional — Get user by both username and encrypted password (if needed)
	    public modeluser getUserByUsernamePass(String username, String password) {
	        modeluser user = null;

	        String query =  """
	            SELECT u.*, r.role_name
	            FROM user u
	            JOIN user_role r ON u.role_id = r.role_id
	            WHERE u.username = ?
	        """;

	        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	            stmt.setString(1, username);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                String encrypted = rs.getString("password");
	                String decrypted = PasswordUtil.decrypt(encrypted);

	                if (!decrypted.equals(password)) {
	                    return null;
	                }

	                user = new modeluser();
	                user.setUser_id(rs.getInt("user_id"));
	                user.setFirst_name(rs.getString("first_name"));
	                user.setLast_name(rs.getString("last_name"));
	                user.setEmail(rs.getString("email"));
	                user.setPhone(rs.getString("phone"));
	                user.setGender(rs.getString("gender"));
	                user.setUsername(rs.getString("username"));
	                user.setPassword(encrypted);
	                user.setRole_id(rs.getInt("role_id"));
	                user.setRole_name(rs.getString("role_name"));
	                user.setImageUrl(rs.getString("image_path"));

	                System.out.println("Found user: " + user.getUsername());
	                System.out.println("Role: " + user.getRole_name());
	                System.out.println("path: " + user.getImageUrl());

	            } else {
	                System.out.println("No user found with username: " + username);
	                return null;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }

	        return user;
	    }
	}
	
//	
//    private Connection dbConn;
//    private boolean isConnectionError = false;
//
//    public loginService() {
//        try {
//            dbConn = bdconfig.getDbConnection();
//        } catch (SQLException | ClassNotFoundException ex) {
//            ex.printStackTrace();
//            isConnectionError = true;
//        }
//    }
//
//    /**
//     * Validates the login credentials
//     * 
//     * @param username username to validate
//     * @param password password to validate
//     * @return true if admin user, false if regular user, null if error or invalid credentials
//     */
//    public Boolean loginUser(String username, String password) {
//        if (isConnectionError) {
//            System.out.println("Database connection error!");
//            return null;
//        }
//
//        // First check if this is a valid user
//        boolean validUser = isValidUser(username, password);
//        if (!validUser) {
//            System.out.println("Invalid credentials for username: " + username);
//            return null; // Return null for invalid credentials
//        }
//      String query = "SELECT role_id FROM user WHERE username = ?";
//        
//             try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//                 stmt.setString(1, username);
//                 ResultSet rs = stmt.executeQuery();
//                 
//                 if (rs.next()) {
//                     int roleId = rs.getInt("role_id");
//                     System.out.println("Retrieved role_id for user: " + roleId);
//                     if (roleId == 1) {
//                         // role_id=1 means regular user, return false
//                         return false;
//                     } else if (roleId == 2) {
//                         // role_id=2 means admin, return true
//                         return true;
//                     } else {
//                         // Unknown role, treat as login failure for safety
//                         System.out.println("Unknown role_id: " + roleId);
//                         return null;
//                     }
//                 } else {
//                     System.out.println("No user found with username: " + username);
//                     return null;
//                 }
//             } catch (Exception e) {
//                 e.printStackTrace();
//                 return null; // Return null for database errors
//             }
//         }
//
//    
//        
//// 
//    
//    /**
//     * Check if the username and password are valid
//     * 
//     * @param username username to check
//     * @param password password to check
//     * @return true if valid, false otherwise
//     */
//
//    public boolean isValidUser(String username, String password) {
//        if (isConnectionError) {
//            System.out.println("Database connection error!");
//            return false;
//        }
//        
//        String query = "SELECT password FROM user WHERE username = ?";
//        
//        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//            stmt.setString(1, username);
//            ResultSet rs = stmt.executeQuery();
//            
//            if (rs.next()) {
//            	System.out.println(rs);
//                String dbPass = rs.getString("password");
//                
//                // Check if database password is null or empty
//                if (dbPass == null || dbPass.isEmpty()) {
//                    System.out.println("Database password is null or empty for user: " + username);
//                    return false;
//                }
//                
//                // Decrypt password and check for null
//                String decryptedPassword = PasswordUtil.decrypt(dbPass);
//                System.out.println("decrypted pass: " + decryptedPassword);
//                if (decryptedPassword == null) {
//                    System.out.println("Password decryption failed for user: " + username);
//                    return false;
//                }
//                
//                // Compare passwords
//                boolean match = password.equals(decryptedPassword);
//                System.out.println("Password match result: " + match);
//                return match;
//            } else {
//                System.out.println("No user found with username: " + username);
//                return false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//    
//    /**
//     * Get user details by username
//     * 
//     * @param username username to look up
//     * @return user model or null if not found
//     */
//    public modeluser getUser(String username) {
//        if (username == null || username.isEmpty()) {
//            System.out.println("Username is null or empty");
//            return null;
//        }
//        
//        modeluser user = new modeluser(username);
//        
//        String query = "SELECT * FROM user WHERE username = ?";
//
//        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//            stmt.setString(1, username);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                user.setUser_id(rs.getInt("user_id"));
//                user.setFirst_name(rs.getString("first_name"));
//                user.setLast_name(rs.getString("last_name"));
//                user.setEmail(rs.getString("email"));
//                user.setPhone(rs.getString("phone"));
//                user.setGender(rs.getString("gender"));
//                user.setUsername(rs.getString("username"));
//                user.setPassword(rs.getString("password"));
//                user.setRole_id(rs.getInt("role_id"));
//                
//                return user;
//            } else {
//                System.out.println("No user found with username: " + username);
//                return null;  
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//
//
//
//public modeluser getUserByUsernamePass(String username, String password) {
//	 if (isConnectionError) {
//  System.out.println("Database connection error!");
//  return null;
//}	
//    
//    modeluser user = null;
//    
//    String query =  """
//    		SELECT u.*, r.role_name
//    		FROM user u
//    		JOIN user_role r ON u.role_id = r.role_id
//    		WHERE u.username = ? AND u.password = ?
//    		""";
//    	System.out.println("Paramaters usermame" + username + ", pass" + password);
//    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//        stmt.setString(1, username);
//        stmt.setString(2, password);
//        ResultSet rs = stmt.executeQuery();
//
//        if (rs.next()) {
//            user.setUser_id(rs.getInt("user_id"));
//            user.setFirst_name(rs.getString("first_name"));
//            user.setLast_name(rs.getString("last_name"));
//            user.setEmail(rs.getString("email"));
//            user.setPhone(rs.getString("phone"));
//            user.setGender(rs.getString("gender"));
//            user.setUsername(rs.getString("username"));
//            user.setPassword(rs.getString("password"));
//            user.setRole_id(rs.getInt("role_id"));
//            user.setRole_name(rs.getString("role_name"));
//            
//            
//            System.out.println("found with username: " + user.getUsername());
//            System.out.println(" found with username: " + user.getRole_name());
//        } else {
//            System.out.println("No user found with username: " + username);
//            return null;  
//        }
//    } catch (Exception e) {
//        e.printStackTrace();
//        return null;
//    }
//    return user;
//}
//
//}


//public boolean validAdmin(String username, String password) {
//	 if (isConnectionError) {
//     System.out.println("Database connection error!");
//     return false;
// }
// 
// String query = "SELECT password FROM user WHERE username = ?";
// try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//     stmt.setString(1, username);
//     ResultSet rs = stmt.executeQuery();
//     
//     if (rs.next()) {
//     	System.out.println(rs);
//         String dbPass = rs.getString("password");
//         
//         // Check if database password is null or empty
//         if (dbPass == null || dbPass.isEmpty()) {
//             System.out.println("Database password is null or empty for user: " + username);
//             return false;
//         }
//         
//         // Decrypt password and check for null
//         String decryptedPassword = PasswordUtil.decrypt(dbPass);
//         System.out.println("decrypted pass: " + decryptedPassword);
//         if (decryptedPassword == null) {
//             System.out.println("Password decryption failed for user: " + username);
//             return false;
//         }
//         
//         // Compare passwords
//         boolean match = password.equals(decryptedPassword);
//         System.out.println("Password match result: " + match);
//         return match;
//     } else {
//         System.out.println("No user found with username: " + username);
//         return false;
//     }
// } catch (Exception e) {
//     e.printStackTrace();
//     return false;
// }
//
//	
//}
    

