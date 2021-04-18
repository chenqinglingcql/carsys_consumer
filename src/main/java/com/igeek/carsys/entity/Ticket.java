package com.igeek.carsys.entity;


import java.util.Date;

/**
 * @Description 汽车票实体类
 * @Author Lemon
 * @Date 2021/2/6 22:31
 */
public class Ticket {

    private String ticket_id;
    //出发日期
    private int depart_date_id;
    //出发时间
    private String depart_time;
    //起始站所在城市
    private String depart_city;
    //起始站
    private String depart_station;
    //终点站所在城市
    private String dest_city;
    //终点站
    private String dest_station;
    //汽车类型
    private String bus_type;
    //票价
    private double ticket_price;
    //剩余票数
    private  int ticket_counts;
    //日期表对应字段
    private int date_id;
    private Date depart_date;
    //运营状态
    private String ticket_status;


    public Ticket() {
    }

    public Ticket(String ticket_id, int depart_date_id, String depart_time, String depart_city, String depart_station, String dest_city, String dest_station, String bus_type, double ticket_price, int ticket_counts, int date_id, Date depart_date) {
        this.ticket_id = ticket_id;
        this.depart_date_id = depart_date_id;
        this.depart_time = depart_time;
        this.depart_city = depart_city;
        this.depart_station = depart_station;
        this.dest_city = dest_city;
        this.dest_station = dest_station;
        this.bus_type = bus_type;
        this.ticket_price = ticket_price;
        this.ticket_counts = ticket_counts;
        this.date_id = date_id;
        this.depart_date = depart_date;
    }

    public Ticket(String ticket_id, int depart_date_id, String depart_time, String depart_city, String depart_station, String dest_city, String dest_station, String bus_type, double ticket_price, int ticket_counts, int date_id, Date depart_date, String ticket_status) {
        this.ticket_id = ticket_id;
        this.depart_date_id = depart_date_id;
        this.depart_time = depart_time;
        this.depart_city = depart_city;
        this.depart_station = depart_station;
        this.dest_city = dest_city;
        this.dest_station = dest_station;
        this.bus_type = bus_type;
        this.ticket_price = ticket_price;
        this.ticket_counts = ticket_counts;
        this.date_id = date_id;
        this.depart_date = depart_date;
        this.ticket_status = ticket_status;
    }

    /**
     * 获取
     * @return ticket_id
     */
    public String getTicket_id() {
        return ticket_id;
    }

    /**
     * 设置
     * @param ticket_id
     */
    public void setTicket_id(String ticket_id) {
        this.ticket_id = ticket_id;
    }

    /**
     * 获取
     * @return depart_date_id
     */
    public int getDepart_date_id() {
        return depart_date_id;
    }

    /**
     * 设置
     * @param depart_date_id
     */
    public void setDepart_date_id(int depart_date_id) {
        this.depart_date_id = depart_date_id;
    }

    /**
     * 获取
     * @return depart_time
     */
    public String getDepart_time() {
        return depart_time;
    }

    /**
     * 设置
     * @param depart_time
     */
    public void setDepart_time(String depart_time) {
        this.depart_time = depart_time;
    }

    /**
     * 获取
     * @return depart_city
     */
    public String getDepart_city() {
        return depart_city;
    }

    /**
     * 设置
     * @param depart_city
     */
    public void setDepart_city(String depart_city) {
        this.depart_city = depart_city;
    }

    /**
     * 获取
     * @return depart_station
     */
    public String getDepart_station() {
        return depart_station;
    }

    /**
     * 设置
     * @param depart_station
     */
    public void setDepart_station(String depart_station) {
        this.depart_station = depart_station;
    }

    /**
     * 获取
     * @return dest_city
     */
    public String getDest_city() {
        return dest_city;
    }

    /**
     * 设置
     * @param dest_city
     */
    public void setDest_city(String dest_city) {
        this.dest_city = dest_city;
    }

    /**
     * 获取
     * @return dest_station
     */
    public String getDest_station() {
        return dest_station;
    }

    /**
     * 设置
     * @param dest_station
     */
    public void setDest_station(String dest_station) {
        this.dest_station = dest_station;
    }

    /**
     * 获取
     * @return bus_type
     */
    public String getBus_type() {
        return bus_type;
    }

    /**
     * 设置
     * @param bus_type
     */
    public void setBus_type(String bus_type) {
        this.bus_type = bus_type;
    }

    /**
     * 获取
     * @return ticket_price
     */
    public double getTicket_price() {
        return ticket_price;
    }

    /**
     * 设置
     * @param ticket_price
     */
    public void setTicket_price(double ticket_price) {
        this.ticket_price = ticket_price;
    }

    /**
     * 获取
     * @return ticket_counts
     */
    public int getTicket_counts() {
        return ticket_counts;
    }

    /**
     * 设置
     * @param ticket_counts
     */
    public void setTicket_counts(int ticket_counts) {
        this.ticket_counts = ticket_counts;
    }

    /**
     * 获取
     * @return date_id
     */
    public int getDate_id() {
        return date_id;
    }

    /**
     * 设置
     * @param date_id
     */
    public void setDate_id(int date_id) {
        this.date_id = date_id;
    }

    /**
     * 获取
     * @return depart_date
     */
    public Date getDepart_date() {
        return depart_date;
    }

    /**
     * 设置
     * @param depart_date
     */
    public void setDepart_date(Date depart_date) {
        this.depart_date = depart_date;
    }

    public String toString() {
        return "Ticket{ticket_id = " + ticket_id + ", depart_date_id = " + depart_date_id + ", depart_time = " + depart_time + ", depart_city = " + depart_city + ", depart_station = " + depart_station + ", dest_city = " + dest_city + ", dest_station = " + dest_station + ", bus_type = " + bus_type + ", ticket_price = " + ticket_price + ", ticket_counts = " + ticket_counts + ", date_id = " + date_id + ", depart_date = " + depart_date + "}";
    }

    /**
     * 获取
     * @return ticket_status
     */
    public String getTicket_status() {
        return ticket_status;
    }

    /**
     * 设置
     * @param ticket_status
     */
    public void setTicket_status(String ticket_status) {
        this.ticket_status = ticket_status;
    }
}
