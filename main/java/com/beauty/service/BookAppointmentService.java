package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.AppointmentModel;

public class BookAppointmentService {

    public boolean isSlotTaken(String date, String time) {
        boolean taken = false;
        try (Connection conn = bdconfig.getDbConnection()) {
            String sql = "SELECT COUNT(*) FROM appointment WHERE appointment_date = ? AND Time = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, date);
            stmt.setString(2, time);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                taken = rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return taken;
    }

    public int save(AppointmentModel appointment) {
        int generatedId = -1;
        LocalDate currentDate = LocalDate.now();
        try (Connection conn = bdconfig.getDbConnection()) {
            String query = "INSERT INTO appointment (user_id, service_name, stylist, appointment_date, Time, booked_date, total_fee) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setInt(1, appointment.getUserId());
                stmt.setString(2, appointment.getServices());
                stmt.setString(3, appointment.getStylist());
                stmt.setString(4, appointment.getDate());
                stmt.setString(5, appointment.getTime());
                stmt.setDate(6, java.sql.Date.valueOf(currentDate));
                stmt.setDouble(7, appointment.getPrice());

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    ResultSet rs = stmt.getGeneratedKeys();
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }
    public List<AppointmentModel> getAppointmentsByUserId(int userId) throws ClassNotFoundException {
        List<AppointmentModel> list = new ArrayList<>();
        String sql = "SELECT service_name, stylist, booked_date, Time, appointment_date, total_fee " +
                     "FROM appointment WHERE user_id = ? ORDER BY booked_date DESC";

        try (Connection conn = bdconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AppointmentModel appt = new AppointmentModel();
                appt.setServices(rs.getString("service_name"));
                appt.setStylist(rs.getString("stylist"));
                appt.setDate(rs.getString("booked_date"));
                appt.setTime(rs.getString("Time"));
                appt.setAppointment_date(rs.getString("appointment_date"));
                appt.setPrice(rs.getDouble("total_fee"));
                list.add(appt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}