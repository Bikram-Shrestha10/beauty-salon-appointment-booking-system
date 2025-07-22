package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.AppointmentModel;
import com.beauty.model.HistoryModel;

public class HistoryService {
	 private Connection dbConn;
	public HistoryService() {
		  try {
	            this.dbConn = bdconfig.getDbConnection();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	public List<HistoryModel> getBookingHistoryByUserId(int userId) {
        List<HistoryModel> historyList = new ArrayList<>();
        String sql = "SELECT stylist, service_name, appointment_date, Time, total_fee FROM appointment WHERE user_id = ? ORDER BY appointment_date DESC";

        try (Connection conn = bdconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                HistoryModel history = new HistoryModel();
                history.setStylist(rs.getString("stylist"));
                history.setServices(rs.getString("service_name"));
                history.setAppointment_date(rs.getString("appointment_date"));
                history.setTime(rs.getTime("time").toLocalTime());
                history.setPrice(rs.getDouble("total_fee"));
                historyList.add(history);
                System.out.println(historyList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return historyList;
    }
}