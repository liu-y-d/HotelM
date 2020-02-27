package com.hyh.service;

import com.hyh.pojo.AdminInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 23:00
 */
public interface AdminService {
    AdminInfo Login(String adminName, String adminPwd);
    //添加房型信息
    int insertHotelInfo(@Param("houseName") String houseName, @Param("houseNum") Integer houseNum, @Param("housePrice") Double housePrice, @Param("houseImg") String houseImg);
    //添加总账信息
    void insertFinanceInfo(String cusTel, double cusMoney, Date time);
}
