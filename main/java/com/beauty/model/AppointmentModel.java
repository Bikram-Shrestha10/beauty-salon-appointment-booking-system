package com.beauty.model;

import java.time.LocalDate;

public class AppointmentModel {
	 private int appointmentId;
    private int userId;
    private String services;
    private String stylist;
    private String appointment_date;
    private String date;
    private String time;
    private double price;
    public AppointmentModel() {
    }

    public AppointmentModel(int userId, String services, String stylist, String date, String time, double price) {
        this.userId = userId;
        this.services = services;
        this.stylist = stylist;
        this.date = date;
        this.time = time;
        this.price = price;
    }

    public int getUserId() {
        return userId;
    }

    public String getServices() {
        return services;
    }

    public String getStylist() {
        return stylist;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
    public double getPrice() {
        return price;
    }

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public void setStylist(String stylist) {
		this.stylist = stylist;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public String getAppointment_date() {
		return appointment_date;
	}

	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
	}
    
}
