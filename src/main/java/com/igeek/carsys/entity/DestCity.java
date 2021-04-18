package com.igeek.carsys.entity;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:03
 */
public class DestCity {
    private String route_dest_city;

    public DestCity() {
    }

    public DestCity(String route_dest_city) {
        this.route_dest_city = route_dest_city;
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

    public String toString() {
        return "DestCity{route_dest_city = " + route_dest_city + "}";
    }
}
