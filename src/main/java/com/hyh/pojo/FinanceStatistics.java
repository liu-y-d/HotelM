package com.hyh.pojo;

public class FinanceStatistics {
    private String  money;
    private String time;

    @Override
    public String toString() {
        return "FinanceStatistics{" +
                "money='" + money + '\'' +
                ", time=" + time +
                '}';
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
