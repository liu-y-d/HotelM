package com.hyh.pojo;

public class FinanceInfo {
    private Integer id;
    private String cusTel;
    private Double cusMoney;
    private String time;

    @Override
    public String toString() {
        return "FinanceInfo{" +
                "id=" + id +
                ", cusTel='" + cusTel + '\'' +
                ", cusMoney=" + cusMoney +
                ", time='" + time + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCusTel() {
        return cusTel;
    }

    public void setCusTel(String cusTel) {
        this.cusTel = cusTel;
    }

    public Double getCusMoney() {
        return cusMoney;
    }

    public void setCusMoney(Double cusMoney) {
        this.cusMoney = cusMoney;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
