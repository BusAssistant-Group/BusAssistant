package com.busasst.bean;

/**
 * Created by sl on 16-8-2.
 */
public class MessageStatus {

    private String message;
    private int status;

    public MessageStatus(String message, int status) {
        this.message = message;
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }
}
