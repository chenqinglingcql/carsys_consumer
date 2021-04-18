package com.igeek.carsys.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @Description 汽车实体类
 * @Author Lemon
 * @Date 2021/2/7 11:17
 */
public class Bus {
    private String bus_id;
    private String bus_type;
    private String depart_time;
    private String bus_brand;
    private int seat_counts;
    private String depart_station;
    private String dest_station;


    public Bus() {
    }

    public Bus(String bus_id, String bus_type, String depart_time, String bus_brand, int seat_counts, String depart_station, String dest_station) {
        this.bus_id = bus_id;
        this.bus_type = bus_type;
        this.depart_time = depart_time;
        this.bus_brand = bus_brand;
        this.seat_counts = seat_counts;
        this.depart_station = depart_station;
        this.dest_station = dest_station;
    }

    /**
     * 获取
     * @return bus_id
     */
    public String getBus_id() {
        return bus_id;
    }

    /**
     * 设置
     * @param bus_id
     */
    public void setBus_id(String bus_id) {
        this.bus_id = bus_id;
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
     * @return bus_brand
     */
    public String getBus_brand() {
        return bus_brand;
    }

    /**
     * 设置
     * @param bus_brand
     */
    public void setBus_brand(String bus_brand) {
        this.bus_brand = bus_brand;
    }

    /**
     * 获取
     * @return seat_counts
     */
    public int getSeat_counts() {
        return seat_counts;
    }

    /**
     * 设置
     * @param seat_counts
     */
    public void setSeat_counts(int seat_counts) {
        this.seat_counts = seat_counts;
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

    public String toString() {
        return "Bus{bus_id = " + bus_id + ", bus_type = " + bus_type + ", depart_time = " + depart_time + ", bus_brand = " + bus_brand + ", seat_counts = " + seat_counts + ", depart_station = " + depart_station + ", dest_station = " + dest_station + "}";
    }
}
