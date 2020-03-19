package com.hyh.service;

import com.hyh.dao.AdminDao;
import com.hyh.pojo.AdminInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
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

    @Override
    public Integer dateDiff(String startTime, String endTime) {
        //按照传入的格式生成一个simpledateformate对象
        SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy");
        Integer nd = 1000*24*60*60;//一天的毫秒数
        Integer nh = 1000*60*60;//一小时的毫秒数
        Integer nm = 1000*60;//一分钟的毫秒数
        Integer ns = 1000;//一秒钟的毫秒数
        Integer diff;
        Integer day;
        try {
            //获得两个时间的毫秒时间差异
            diff = Math.toIntExact(sd.parse(endTime).getTime() - sd.parse(startTime).getTime());
            day = diff/nd;//计算差多少天
            Integer hour = diff%nd/nh;//计算差多少小时
            Integer min = diff%nd%nh/nm;//计算差多少分钟
            Integer sec = diff%nd%nh%nm/ns;//计算差多少秒
            //输出结果
            return day;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
