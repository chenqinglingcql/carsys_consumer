package com.igeek.carsys.entity;

import java.util.Date;

/**
 * @Description 路线实体类
 * @Author Lemon
 * @Date 2021/2/19 22:36
 */
public class Route {
    private int route_id;
    //路线起点城市
    private String route_depart_city;
    //路线终点城市
    private String route_dest_city;
    //路线日期
    private Date route_date;
    //路线最低价格
    private double route_price;

    /*热度*/
    private int hot;


    public Route() {
    }

    public Route(int route_id, String route_depart_city, String route_dest_city, Date route_date, double route_price) {
        this.route_id = route_id;
        this.route_depart_city = route_depart_city;
        this.route_dest_city = route_dest_city;
        this.route_date = route_date;
        this.route_price = route_price;
    }

    public Route(int route_id, String route_depart_city, String route_dest_city, Date route_date, double route_price, int hot) {
        this.route_id = route_id;
        this.route_depart_city = route_depart_city;
        this.route_dest_city = route_dest_city;
        this.route_date = route_date;
        this.route_price = route_price;
        this.hot = hot;
    }

    /**
     * 获取
     * @return route_id
     */
    public int getRoute_id() {
        return route_id;
    }

    /**
     * 设置
     * @param route_id
     */
    public void setRoute_id(int route_id) {
        this.route_id = route_id;
    }

    /**
     * 获取
     * @return route_depart_city
     */
    public String getRoute_depart_city() {
        return route_depart_city;
    }

    /**
     * 设置
     * @param route_depart_city
     */
    public void setRoute_depart_city(String route_depart_city) {
        this.route_depart_city = route_depart_city;
    }

    /**
     * 获取
     * @return route_dest_city
     */
    public String getRoute_dest_city() {
        return route_dest_city;
    }

    /**
     * 设置
     * @param route_dest_city
     */
    public void setRoute_dest_city(String route_dest_city) {
        this.route_dest_city = route_dest_city;
    }

    /**
     * 获取
     * @return route_date
     */
    public Date getRoute_date() {
        return route_date;
    }

    /**
     * 设置
     * @param route_date
     */
    public void setRoute_date(Date route_date) {
        this.route_date = route_date;
    }

    /**
     * 获取
     * @return route_price
     */
    public double getRoute_price() {
        return route_price;
    }

    /**
     * 设置
     * @param route_price
     */
    public void setRoute_price(double route_price) {
        this.route_price = route_price;
    }

    public String toString() {
        return "Route{route_id = " + route_id + ", route_depart_city = " + route_depart_city + ", route_dest_city = " + route_dest_city + ", route_date = " + route_date + ", route_price = " + route_price + "}";
    }

    /**
     * 获取
     * @return hot
     */
    public int getHot() {
        return hot;
    }

    /**
     * 设置
     * @param hot
     */
    public void setHot(int hot) {
        this.hot = hot;
    }
}
