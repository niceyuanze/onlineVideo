package com.onlineVideo.web.shiro;

/**
 * Created by niceyuanze on 17-6-17.
 */
public enum LoginType {
    USER("User"),  ADMIN("Staff");
    private String type;

    private LoginType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
