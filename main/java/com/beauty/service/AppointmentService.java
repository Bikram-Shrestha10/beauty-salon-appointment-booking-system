package com.beauty.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.beauty.config.bdconfig;
import com.beauty.model.Appointment;
import com.beauty.model.AppointmentModel;

public class AppointmentService {

	public List<Appointment> getAllAppointments() {
	    List<Appointment> appointments = new ArrayList<>();

	    try (Connection conn = bdconfig.getDbConnection()) {
	        String query = "SELECT appointment_id, service_name, Time, booked_date, stylist FROM appointment";

	        try (PreparedStatement stmt = conn.prepareStatement(query)) {
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                Appointment appointment = new Appointment();
	                appointment.setAppointmentId(rs.getInt("appointment_id"));
	                appointment.setServiceName(rs.getString("service_name"));  // Full string
	                appointment.setTime(rs.getString("Time"));
	                appointment.setDate(rs.getString("booked_date"));
	                appointment.setStylist(rs.getString("stylist"));

	                // New: Handle multiple services and fetch their durations
	                List<String> serviceNames = new ArrayList<>();
	                List<String> durations = new ArrayList<>();

	                String[] servicesArray = rs.getString("service_name").split(",");
	                for (String service : servicesArray) {
	                    String serviceTrimmed = service.trim();
	                    serviceNames.add(serviceTrimmed);

	                    try (PreparedStatement ps2 = conn.prepareStatement("SELECT duration FROM service WHERE service_title = ?")) {
	                        ps2.setString(1, serviceTrimmed);
	                        ResultSet rs2 = ps2.executeQuery();
	                        if (rs2.next()) {
	                            durations.add(rs2.getString("duration"));
	                        } else {
	                            durations.add("N/A");  // Not found
	                        }
	                    }
	                }

	                appointment.setServiceNames(serviceNames); // You must have this in model
	                appointment.setDurations(durations);       // You must have this in model

	                appointments.add(appointment);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return appointments;
	}

	public Appointment getAppointmentById(int appointmentId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<AppointmentModel> getAppointmentsByUserId(int user_id) {
		// TODO Auto-generated method stub
		return null;
	}
}