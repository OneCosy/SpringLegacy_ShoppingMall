package com.bit.dto;

import org.springframework.stereotype.Repository;

@Repository
public class BitDemoDTO {
    private int no;
    private String message;
    private String name;

    public BitDemoDTO() {
    }

    public BitDemoDTO(int no, String message, String name) {
        this.no = no;
        this.message = message;
        this.name = name;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "BitDemoDTO{" +
                "no=" + no +
                ", message='" + message + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
