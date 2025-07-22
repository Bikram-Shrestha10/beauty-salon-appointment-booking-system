package com.beauty.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class HistoryModel {
	private int appointmentId;
    private int userId;
    private String services;
    private String stylist;
    private LocalDate appointment_date;
    private LocalTime time;
    private double price;
	public HistoryModel() {
		// TODO Auto-generated constructor stub
	}
	public HistoryModel(int appointmentId, int userId, String services, String stylist,
            LocalDate appointment_date, LocalTime time, double price) {
this.appointmentId = appointmentId;
this.userId = userId;
this.services = services;
this.stylist = stylist;
this.appointment_date = appointment_date;
this.time = time;
this.price = price;
}

// ✅ Getter & Setter Methods

public int getAppointmentId() {
return appointmentId;
}

public void setAppointmentId(int appointmentId) {
this.appointmentId = appointmentId;
}

public int getUserId() {
return userId;
}

public void setUserId(int userId) {
this.userId = userId;
}

public String getServices() {
return services;
}

public void setServices(String services) {
this.services = services;
}

public String getStylist() {
return stylist;
}

public void setStylist(String stylist) {
this.stylist = stylist;
}

public LocalDate getAppointment_date() {
return appointment_date;
}

public void setAppointment_date(String appointment_date) {
this.appointment_date =  LocalDate.parse(appointment_date);
}

public LocalTime getTime() {
return time;
}

public void setTime(LocalTime time) {
this.time = time;
}

public double getPrice() {
return price;
}

public void setPrice(double price) {
this.price = price;
}
}
