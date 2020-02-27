package com.hyh.pojo;

public class SalesStatistics {
    private String  inTime;
    private Integer number;

    @Override
    public String toString() {
        return "SalesStatistics{" +
                "inTime='" + inTime + '\'' +
                ", number=" + number +
                '}';
    }

    public String getInTime() {
        return inTime;
    }

    public void setInTime(String inTime) {
        this.inTime = inTime;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
