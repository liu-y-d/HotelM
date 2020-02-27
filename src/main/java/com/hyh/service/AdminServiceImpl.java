package com.hyh.service;

import com.hyh.dao.AdminDao;
import com.hyh.pojo.AdminInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 23:01
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;
    public AdminInfo Login(String adminName, String adminPwd) {
        return adminDao.Login(adminName,adminPwd);
    }

    public int insertHotelInfo(String houseName, Integer houseNum,Double housePrice,String houseImg) {
        return adminDao.insertHotelInfo(houseName,houseNum,housePrice,houseImg);
    }

    @Override
    public void insertFinanceInfo(String cusTel, double cusMoney, Date time) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(time);
        adminDao.insertFinanceInfo(cusTel,cusMoney,format);

    }
}
