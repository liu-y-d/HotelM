package com.hyh.pojo;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 19:26
 * 酒店信息类
 */
public class HotelInfo {
    private final static String HOTELNAME = "测试酒店";//酒店名字
    private Integer houseTypeId;//户型Id
    private String houseName;//户型名字
    private Integer houseNum;//户型剩余数量
    private Double housePrice;//户型价格
    private String houseImg;//户型图片
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getHouseImg() {
        return houseImg;
    }

    public void setHouseImg(String houseImg) {
        this.houseImg = houseImg;
    }

    public Double getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Double housePrice) {
        this.housePrice = housePrice;
    }

    public static String getHOTELNAME() {
        return HOTELNAME;
    }


    public String getHotelName() {
        return HOTELNAME;
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

    public Integer getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(Integer houseNum) {
        this.houseNum = houseNum;
    }

    @Override
    public String toString() {
        return "HotelInfo{" +
                "houseTypeId=" + houseTypeId +
                ", houseName='" + houseName + '\'' +
                ", houseNum=" + houseNum +
                ", housePrice=" + housePrice +
                ", houseImg='" + houseImg + '\'' +
                '}';
    }
}
