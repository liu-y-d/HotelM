package com.hyh.controller;

import com.alibaba.fastjson.JSON;
import com.hyh.dao.AdminDao;
import com.hyh.pojo.FinanceInfo;
import com.hyh.pojo.FinanceStatistics;
import com.hyh.pojo.SalesStatistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class StatisticsController {
    @Resource
    private AdminDao dao;
    @GetMapping("/SalesStatistics")
    public String toStatistics(){
        return "/admin/SalesStatisticsPage";
    }
    @GetMapping("/SalesStatisticsInitData")
    @ResponseBody
    public String SalesStatisticsInitData(){
        List<SalesStatistics> objects = dao.peopleStatistics();
        for (SalesStatistics o : objects){
            System.out.println(o.toString());

        }
        return JSON.toJSONString(objects);
    }
    @GetMapping("/FinanceStatistics")
    public String toStatistics1(){
        return "/admin/FinanceStatisticsPage";
    }


    @GetMapping("/FinanceStatisticsInitData")
    @ResponseBody
    public String FinanceStatisticsInitData(){
        List<FinanceStatistics> financeInfos = dao.financeStatistics();
        for (FinanceStatistics o : financeInfos){
            System.out.println(o.toString());

        }
        return JSON.toJSONString(financeInfos);
    }
}
