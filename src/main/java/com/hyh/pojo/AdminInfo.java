package com.hyh.pojo;

/**
 * @author HuaYanHe
 * @date 2019/11/12 - 20:43
 * 管理员信息类
 */
public class AdminInfo {
    private Integer adminId;//管理员id
    private String adminName;//管理员姓名
    private String adminPwd;//管理员密码

    public AdminInfo() {
    }

    public AdminInfo(String adminName, String adminPwd) {
        this.adminName = adminName;
        this.adminPwd = adminPwd;
    }

    public AdminInfo(Integer adminId, String adminName, String adminPwd) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPwd = adminPwd;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    @Override
    public String toString() {
        return "AdminInfo{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPwd='" + adminPwd + '\'' +
                '}';
    }
}
