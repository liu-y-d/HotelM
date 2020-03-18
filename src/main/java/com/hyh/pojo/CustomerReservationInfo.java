package com.hyh.pojo;


import java.util.Date;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 20:11
 * 顾客预定信息类
 */
public class CustomerReservationInfo {
    private String cusName;//顾客姓名
    private String cusTel;//顾客手机号
    private Integer houseTypeId;//预定户型Id
    private String houseName;
    private int reserHouseNumber;//预定房间数量
    private String inTime;//入住日期
    private String outTime;//退房日期
    private Date scheduledTime;//预定时间
    private Integer status;//预订状态 1 系统自动更新状态 0 未退房，未到离店时间 2 手动退订

    @Override
    public String toString() {
        return "CustomerReservationInfo{" +
                "cusName='" + cusName + '\'' +
                ", cusTel='" + cusTel + '\'' +
                ", houseTypeId=" + houseTypeId +
                ", houseName='" + houseName + '\'' +
                ", reserHouseNumber=" + reserHouseNumber +
                ", inTime='" + inTime + '\'' +
                ", outTime='" + outTime + '\'' +
                ", scheduledTime=" + scheduledTime +
                ", status=" + status +
                '}';
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusTel() {
        return cusTel;
    }

    public void setCusTel(String cusTel) {
        this.cusTel = cusTel;
    }

    public Integer getHouseTypeId() {
        return houseTypeId;
    }

    public void setHouseTypeId(Integer houseTypeId) {
        this.houseTypeId = houseTypeId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public int getReserHouseNumber() {
        return reserHouseNumber;
    }

    public void setReserHouseNumber(int reserHouseNumber) {
        this.reserHouseNumber = reserHouseNumber;
    }

    public String getInTime() {
        return inTime;
    }

    public void setInTime(String inTime) {
        this.inTime = inTime;
    }

    public String getOutTime() {
        return outTime;
    }

    public void setOutTime(String outTime) {
        this.outTime = outTime;
    }

    public Date getScheduledTime() {
        return scheduledTime;
    }

    public void setScheduledTime(Date scheduledTime) {
        this.scheduledTime = scheduledTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
