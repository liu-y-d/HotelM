package com.hyh.dao;

import com.hyh.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Date;
import java.util.List;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 22:15
 */
@Repository("AdminDao")
public interface AdminDao {
    //登录方法
    AdminInfo Login(@Param("adminName") String adminName, @Param("adminPwd") String adminPwd);
    //查看房型信息
    List<HotelInfo> selectHouseInfo();
    //添加房型信息
    int insertHotelInfo(@Param("houseName") String houseName, @Param("houseNum") Integer houseNum, @Param("housePrice") Double housePrice, @Param("houseImg") String houseImg);
    //根据Id查找hotelInfo
    HotelInfo queryById(@Param("houseTypeId") Integer houseTypeId);
    //修改户型信息
    int editHouseInfo(@Param("houseTypeId") Integer houseTypeId, @Param("houseName") String houseName, @Param("houseNum") Integer houseNum, @Param("housePrice") Double housePrice, @Param("houseImg") String houseImg);
    //根据id删除户型信息
    int delHouseInfo(@Param("houseTypeId") Integer houseTypeId);
    //添加预定信息
    int addCustomerReservationInfo(@Param("cusTel") String cusTel, @Param("cusName") String cusName, @Param("houseTypeId") Integer houseTypeId, @Param("reserHouseNumber") int reserHouseNumber, @Param("inTime") String inTime, @Param("outTime") String outTime, @Param("scheduledTime") Date scheduledTime, @Param("status")Integer status);
    //更新预订信息
    int updateCustomerReservationInfo(CustomerReservationInfo customerReservationInfo);
    //查找房间剩余房间数量
    Integer queryHouseNumById(@Param("houseTypeId") Integer houseTypeId);
    //更新房间数量
    int updateHotelInfoHotelNum(@Param("houseTypeId") Integer houseTypeId, @Param("houseNum") Integer houseNum);
    //根据客户电话查询预定信息
    CustomerReservationInfo queryByCusTel(@Param("cusTel") String cusTel);
    CustomerReservationInfo queryByCusTelAndStatus(@Param("cusTel") String cusTel);
    //根据客户电话查询预定信息
    List<CustomerReservationInfo> queryByHouseById(@Param("houseTypeId") Integer houseTypeId);
    //查找预定信息
    List<CustomerReservationInfo> queryCustomerReservationInfoStatus0(@Param("status")Integer status);
    List<CustomerReservationInfo> queryCustomerReservationInfoStatus2(@Param("status")Integer status);
    List<CustomerReservationInfo> queryCustomerReservationInfo(@Param("status")Integer status);

    //删除订单信息
    void deleteCustomerReservationInfoByTel(@Param("cusTel") String cusTel);

    //更新预定信息状态
    void updateCustomerReservationInfoStatus(@Param("cusTel")String cusTel ,@Param("status")Integer status);
    //统计每月预订人数
    List<SalesStatistics> peopleStatistics();
    //统计财务
    List<FinanceStatistics> financeStatistics();

    //记入总账
    void insertFinanceInfo(@Param("cusTel") String cusTel,@Param("cusMoney") Double cusMoney,@Param("time") String time);
    //从总账中删除
    int deleteFinanceInfo(@Param("cusTel")String cusTel,@Param("time")String time);
    //更新用户密码
    int updateAdminPwd(@Param("adminId")Integer adminId,@Param("adminPwd")String adminPwd);
    //获取所有预订信息
    List<CustomerReservationInfo> getAllCustomerReservationInfo();
}
