package com.beauty.util;

import java.util.Base64;

public class PasswordUtil {

    private static final int SHIFT_KEY = 5;

    // Encrypt method
    public static String encrypt(String input) {
        StringBuilder encrypted = new StringBuilder();

        for (char c : input.toCharArray()) {
            char shiftedChar = (char) (c + SHIFT_KEY);
            encrypted.append(shiftedChar);
        }

        // Encode the shifted string to Base64
        return Base64.getEncoder().encodeToString(encrypted.toString().getBytes());
    }

    // Decrypt method
    public static String decrypt(String encryptedText) {
        // Decode from Base64
        byte[] decodedBytes = Base64.getDecoder().decode(encryptedText);
        String shiftedString = new String(decodedBytes);

        StringBuilder original = new StringBuilder();

        for (char c : shiftedString.toCharArray()) {
            char originalChar = (char) (c - SHIFT_KEY);
            original.append(originalChar);
        }

        return original.toString();
    }
}
