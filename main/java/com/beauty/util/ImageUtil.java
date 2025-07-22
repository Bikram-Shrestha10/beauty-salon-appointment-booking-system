package com.beauty.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public class ImageUtil {
	// Extracts file name from the 'Part' header
    public String getImageNameFromPart(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        String imageName = null;

        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                break;
            }
        }

        if (imageName == null || imageName.isEmpty()) {
            imageName = "download.png";
        }

        // Add unique ID prefix to avoid conflicts
        String extension = imageName.substring(imageName.lastIndexOf("."));
        String uniqueName =  imageName ;
        return uniqueName;
    }

    // Uploads the file and saves to a fixed path under /resources/images/userprofileimages/
    public String uploadImage(Part part, String folderName) {
        String imageName = getImageNameFromPart(part);

        //absolute development path
        String saveDir = "C:/Users/Acer/eclipse-workspace/Beauty Saloon booking system/beauty-salon-booking-system/src/main/webapp/resources/images/" + folderName;

        File dir = new File(saveDir);
        if (!dir.exists()) {
            dir.mkdirs(); // Create folder if not exists
        }

        String fullPath = saveDir + "/" + imageName;

        try {
            part.write(fullPath);
            System.out.println("Image saved at: " + fullPath);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        // Return relative path to save in DB
        return "resources/images/" + folderName + "/" + imageName;
    }
}