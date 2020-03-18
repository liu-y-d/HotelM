package com.hyh.config;

import com.hyh.dao.AdminDao;
import com.hyh.pojo.CustomerReservationInfo;
import com.hyh.pojo.HotelInfo;
import com.hyh.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class projectInit {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private AdminService adminService;
    @PostConstruct
    public void updateOutdatedData() throws ParseException {
        List<CustomerReservationInfo> allCustomerReservationInfo = adminDao.getAllCustomerReservationInfo();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        Date currentTime = new Date();
        for (CustomerReservationInfo customerReservationInfo : allCustomerReservationInfo) {
            date=sdf.parse(customerReservationInfo.getOutTime());
            if (currentTime.after(date)&&customerReservationInfo.getStatus()==0){
                adminDao.updateCustomerReservationInfoStatus(customerReservationInfo.getCusTel(),1);
                Integer integer = adminDao.queryHouseNumById(customerReservationInfo.getHouseTypeId());
                adminDao.updateHotelInfoHotelNum(customerReservationInfo.getHouseTypeId(),integer+customerReservationInfo.getReserHouseNumber());
                HotelInfo hotelInfo = adminDao.queryById(customerReservationInfo.getHouseTypeId());
                adminService.insertFinanceInfo(customerReservationInfo.getCusTel(),customerReservationInfo.getReserHouseNumber()*hotelInfo.getHousePrice(),date);
            }
        }
        System.out.println("过期数据初始化完成");
    }
}
