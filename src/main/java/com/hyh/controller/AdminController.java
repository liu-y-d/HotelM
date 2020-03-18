package com.hyh.controller;

import com.alibaba.fastjson.JSON;

import com.hyh.dao.AdminDao;
import com.hyh.pojo.AdminInfo;
import com.hyh.pojo.CustomerReservationInfo;
import com.hyh.pojo.HotelInfo;
import com.hyh.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 20:42
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private AdminService adminService;
	@Resource
	private AdminDao adminDao;

	@RequestMapping("/Login")
	//登录方法
	public String Login(String adminName, String adminPwd, Model model, HttpServletRequest request, HttpSession httpSession) {
		//调用service层的Login方法
		AdminInfo adminInfo = adminService.Login(adminName, adminPwd);
		if (adminInfo != null) {
			httpSession.setAttribute("adminInfo", adminInfo);
			//model.addAttribute("adminInfo", adminInfo);
			return "admin/main";
		} else {
			String LoginError = "用户名或密码错误！";
			request.setAttribute("LoginError", LoginError);
			return "admin/Login";
		}
	}

	//退出登录功能
	@RequestMapping("/signOut")
	public String signOut(HttpSession httpSession) {
		httpSession.setAttribute("adminInfo", null);
		return "redirect:/";
	}

	@GetMapping("/toMain")
	public String toMain() {
		return "admin/main";
	}

	//跳转到房型信息管理页面
	@RequestMapping("/toHouseInfoM")
	public String toHouseInfoM(Model model) {
		//查询户型信息
		List<HotelInfo> hotelInfos = adminDao.selectHouseInfo();
		model.addAttribute("hotelInfos", hotelInfos);
		return "admin/houseInfoM/houseInfoM";
	}

	//增加房型信息方法
	@RequestMapping("/addHouseInfo")
	public String addHouseInfo(HotelInfo hotelInfo, Model model, MultipartFile file) throws IOException {

		//图片上传成功后，将图片的地址写到数据库
		String filePath = "D:\\File";//保存图片的路径
		//获取原始图片的拓展名
		String originalFilename = file.getOriginalFilename();
		//新的文件名字
		String newFileName = "/hyhimages/" + UUID.randomUUID() + originalFilename;
		//封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		//把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		hotelInfo.setHouseImg(newFileName);
		int i = adminService.insertHotelInfo(hotelInfo.getHouseName(), hotelInfo.getHouseNum(), hotelInfo.getHousePrice(), hotelInfo.getHouseImg());
		if (i != 0) {
			return "redirect:toHouseInfoM";
		}
		return "errorHandling/addHouseError";
	}
	//根据id查找房型信息
	@RequestMapping(value = "/queryById/{houseTypeId}", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String queryById(@PathVariable("houseTypeId") Integer houseTypeId) {
		HotelInfo hotelInfo = adminDao.queryById(houseTypeId);
		return JSON.toJSONString(hotelInfo);
	}

	//修改户型信息
	@RequestMapping("/editHouseInfo")
	public String editHouseInfo(HotelInfo hotelInfo, MultipartFile file) throws IOException {
		/**
		 * 上传图片
		 */
		//图片上传成功后，将图片的地址写到数据库
		String filePath = "D:\\File";//保存图片的路径
		//获取原始图片的拓展名
		String originalFilename = file.getOriginalFilename();
		//新的文件名字
		String newFileName = "/hyhimages/" + UUID.randomUUID() + originalFilename;
		//封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		//把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		hotelInfo.setHouseImg(newFileName);
		int i = adminDao.editHouseInfo(hotelInfo.getHouseTypeId(), hotelInfo.getHouseName(), hotelInfo.getHouseNum(), hotelInfo.getHousePrice(), hotelInfo.getHouseImg());
		if (i != 0) {
			return "redirect:toHouseInfoM";
		}
		return "errorHandling/editHouseError";
	}

	//根据id删除户型信息
	@RequestMapping(value = "/delHouseById/{houseTypeId}", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Integer delHouseById(@PathVariable("houseTypeId") Integer houseTypeId) {
		List<CustomerReservationInfo> customerReservationInfos = adminDao.queryByHouseById(houseTypeId);
		if (customerReservationInfos.size()==0){
			int i = adminDao.delHouseInfo(houseTypeId);
			if (i != 0) {
				return i;
			}
			return null;
		}else{
			return 0;
		}

	}

	//跳转到客户预定页面
	@RequestMapping("/reservationPage")
	public String toReservationPage(HttpSession session) {
		session.setAttribute("hotelName", HotelInfo.getHOTELNAME());
		return "customerM/reservationPage";
	}

	//跳转到预定主页面
	@RequestMapping("/toHouseInfoMInReservationPage")
	public String toHouseInfoMInReservationPage(Model model) {
		//查询户型信息
		List<HotelInfo> hotelInfos = adminDao.selectHouseInfo();
		model.addAttribute("hotelInfos", hotelInfos);

		return "customerM/reservationHotelPage";
	}

	//添加客户预定信息
	@RequestMapping(value = "/addCustomerReservationInfo", produces = {"application/json;charset=UTF-8"})
	public String addCustomerReservationInfo(Model model,CustomerReservationInfo cusReInfo, HttpSession session) throws SQLException, ParseException {
		if(cusReInfo.getCusTel()==null||cusReInfo.getInTime()==""||cusReInfo.getOutTime()==""||cusReInfo.getCusName()==null){
			model.addAttribute("msg","预定信息填写有误请重试");
			return "customerM/myError";
		}
		//根据手机号进行判断是否有预订信息，如果有则不允许重复预订
		CustomerReservationInfo customerReservationInfo = adminDao.queryByCusTel(cusReInfo.getCusTel());
		if (customerReservationInfo!=null){
			model.addAttribute("msg","不允许重复预订");
			model.addAttribute("cusTel",cusReInfo.getCusTel());
			return "customerM/myError";
		}
		Integer houseNum = adminDao.queryHouseNumById(cusReInfo.getHouseTypeId());
		if (cusReInfo.getReserHouseNumber()>houseNum){
			model.addAttribute("msg","预订数量超过限制");
			return "customerM/myError";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date date = sdf.parse(cusReInfo.getOutTime());
		date.setHours(12);
		//向预定表里添加客户信息
		int i = adminDao.addCustomerReservationInfo(cusReInfo.getCusTel(), cusReInfo.getCusName(), cusReInfo.getHouseTypeId(), cusReInfo.getReserHouseNumber(),cusReInfo.getInTime(),cusReInfo.getOutTime(),new Date(),0);
		//去数据库中查找该房型id的房间剩余房间数量
		//定义房间剩余数量应该更新多少
		Integer laveHouseNum = 0;
		laveHouseNum = houseNum - cusReInfo.getReserHouseNumber();
		//用户预定该房间的时候对应的房型信息表里的房间数量应该进行更新
		adminDao.updateHotelInfoHotelNum(cusReInfo.getHouseTypeId(), laveHouseNum);
		//设置在离店日期中午12点删除预订数据
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			//run方法就是具体需要定时执行的任务
			@Override
			public void run() {
				//过了离店时间删除预订信息
				adminDao.updateCustomerReservationInfoStatus(cusReInfo.getCusTel(),1);
				Integer houseNum = adminDao.queryHouseNumById(cusReInfo.getHouseTypeId());
				adminDao.updateHotelInfoHotelNum(cusReInfo.getHouseTypeId(), houseNum+cusReInfo.getReserHouseNumber());
				System.out.println("aaaa");

			}
		}, date);
		HotelInfo hotelInfo = adminDao.queryById(cusReInfo.getHouseTypeId());

		adminService.insertFinanceInfo(cusReInfo.getCusTel(),cusReInfo.getReserHouseNumber()*hotelInfo.getHousePrice(),new Date());
		//根据房型id查询房型信息
		//添加预定信息到视图
		session.setAttribute("cusReInfo", cusReInfo);
		//添加房型信息到视图
		session.setAttribute("hotelInfo", hotelInfo);
		return "customerM/personalReservationInfo";
	}

	//根据客户电话查询预定信息
	@ResponseBody
	@RequestMapping(value = "/queryByCusTel/{cusTel}", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public String queryByCusTel(@PathVariable("cusTel") String cusTel) {
		if (null == cusTel) {
			return null;
		}
		CustomerReservationInfo customerReservationInfo = adminDao.queryByCusTel(cusTel);
		if (null == (customerReservationInfo)) {
			return null;
		}
		//根据查询出来的预定信息的户型id查找户型名称
		HotelInfo hotelInfo = adminDao.queryById(customerReservationInfo.getHouseTypeId());
		//将数据组装到hashMap里
		Map reservationInfo = new HashMap();
		reservationInfo.put("houseTypeId", customerReservationInfo.getHouseTypeId());
		reservationInfo.put("houseName", hotelInfo.getHouseName());
		reservationInfo.put("cusTel", cusTel);
		reservationInfo.put("cusName", customerReservationInfo.getCusName());
		reservationInfo.put("reserHouseNumber", customerReservationInfo.getReserHouseNumber());
		reservationInfo.put("inTime", customerReservationInfo.getInTime());
		reservationInfo.put("outTime", customerReservationInfo.getOutTime());
		return JSON.toJSONString(reservationInfo);


	}

	//管理员查看预定信息
	@RequestMapping("/queryCustomerReservationInfo")
	public String queryCustomerReservationInfo(Model model) {
		List<CustomerReservationInfo> customerReservationInfos = adminDao.queryCustomerReservationInfo();
		model.addAttribute("customerReservationInfos", customerReservationInfos);
		return "admin/CustomerReservationInfoM/customerReservationInfoPage";
	}

	//退订
	@ResponseBody
	@RequestMapping(value = "/Unsubscribe/{cusTel}", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
	public String Unsubscribe(@PathVariable("cusTel") String cusTel) {
		CustomerReservationInfo customerReservationInfo = adminDao.queryByCusTel(cusTel);
		Date time = customerReservationInfo.getScheduledTime();
		time.setDate(time.getDate()+1);
		time.setHours(0);
		time.setMinutes(0);
		time.setSeconds(0);
		String msg = "";
		if (new Date().after(time)==false){
			//退订
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			time.setDate(time.getDate()-1);
			String format = sdf.format(time);
			CustomerReservationInfo info = adminDao.queryByCusTel(cusTel);
			//删除预订信息
			adminDao.updateCustomerReservationInfoStatus(cusTel,2);
			Integer number = adminDao.queryHouseNumById(info.getHouseTypeId());
			adminDao.updateHotelInfoHotelNum(info.getHouseTypeId(),number+info.getReserHouseNumber());
			//删除总账信息
			int i = adminDao.deleteFinanceInfo(cusTel, format);
			msg = "退订成功";
			return JSON.toJSONString(msg);
		}else{
			msg = "超时退订失败";
			return JSON.toJSONString(msg);
		}
	}

	/**
	 * 修改预订信息
	 * @return
	 */
	@RequestMapping(value = "/editReservation",method = RequestMethod.POST)
	public String editReservation(CustomerReservationInfo cusReInfo,Model model) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date date = sdf.parse(cusReInfo.getOutTime());
		date.setHours(12);
		cusReInfo.setScheduledTime(new Date());
		int i = adminDao.updateCustomerReservationInfo(cusReInfo);
		//设置在离店日期中午12点删除预订数据
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			//run方法就是具体需要定时执行的任务
			@Override
			public void run() {
				//过了离店时间删除预订信息
				adminDao.deleteCustomerReservationInfoByTel(cusReInfo.getCusTel());
				Integer houseNum = adminDao.queryHouseNumById(cusReInfo.getHouseTypeId());
				adminDao.updateHotelInfoHotelNum(cusReInfo.getHouseTypeId(), houseNum+cusReInfo.getReserHouseNumber());
				System.out.println("aaaa");

			}
		}, date);
		if (i==1){
			model.addAttribute("msg","修改成功");
		}else{
			model.addAttribute("msg","修改失败");
		}
		model.addAttribute("cusTel",cusReInfo.getCusTel());
		return "customerM/myError";
	}

	/**
	 * 获取用户信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getAdminInfo")
	public String getAdminInfo(HttpServletRequest request,Model model){
		AdminInfo adminInfo = (AdminInfo) request.getSession().getAttribute("adminInfo");
		model.addAttribute("adminInfo",adminInfo);
		return "admin/AdminInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/updateAdminPwd", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public String updateAdminPwd(Integer adminId,String adminPwd){
		int i = adminDao.updateAdminPwd(adminId, adminPwd);
		return JSON.toJSONString("更新成功,请退出当前用户并重新登录！");
	}
}
