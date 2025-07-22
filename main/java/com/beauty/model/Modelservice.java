package com.beauty.model;

public class Modelservice {
	   private int service_id;
	    private String title;
	    private String name;
	    private double price;
	    private int duration;
	    private String category;
	    private String imagePath;
	    private String serviceName;

	 
	    
	public Modelservice() {
		// TODO Auto-generated constructor stub
	}
	 public Modelservice(int service_id, String title, double price, 
             int duration, String category, String imagePath) {
   this.service_id = service_id;
   this.title = title;
   this.price = price;
   this.duration = duration;
   this.category = category;
   this.imagePath = imagePath;
}

// Getters and Setters
public int getServiceId() {
   return service_id;
}

public void setServiceId(int service_id) {
   this.service_id = service_id;
}

public String getTitle() {
   return title;
}

public void setTitle(String title) {
   this.title = title;
}

public String getName() {
   return name;
}

public void setName(String name) {
   this.name = name;
}

public double getPrice() {
   return price;
}

public void setPrice(double price) {
   this.price = price;
}

public int getDuration() {
   return duration;
}

public void setDuration(int duration) {
   this.duration = duration;
}

public String getCategory() {
   return category;
}

public void setCategory(String category) {
   this.category = category;
}

public String getImagePath() {
   return imagePath;
}

public void setImagePath(String imagePath) {
   this.imagePath = imagePath;
}

// Helper method
public String getFormattedPrice() {
   return String.format("₱%.2f", price);
}
public String getServiceName() {
    return serviceName;
}

public void setServiceName(String serviceName) {
    this.serviceName = serviceName;
}
@Override
public String toString() {
   return "Service [id=" + service_id + ", title=" + title + ", price=" + price + "]";
}
	   
}
