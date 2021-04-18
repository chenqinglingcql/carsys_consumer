package com.igeek.carsys.entity;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:02
 */
public class DepartCity {
    private String route_depart_city;

    public DepartCity() {
    }

    public DepartCity(String route_depart_city) {
        this.route_depart_city = route_depart_city;
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

    public String toString() {
        return "DepartCity{route_depart_city = " + route_depart_city + "}";
    }
}
