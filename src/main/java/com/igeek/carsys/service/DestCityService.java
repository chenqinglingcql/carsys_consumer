package com.igeek.carsys.service;

import com.igeek.carsys.dao.DestCityDao;
import com.igeek.carsys.entity.DestCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:08
 */
public class DestCityService {
    private DestCityDao dao=new DestCityDao();

    //根据起点城市查询所有的目的城市
    public List<DestCity> viewAllDestCityByDepartCity(String depart_city){

        List<DestCity> list = null;
        try {
            list = dao.viewAllDestCityByDepartCity(depart_city);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    //根据起点城市查询所有的目的城市
    public List<DestCity> viewAllDestCity(){

        List<DestCity> list = null;
        try {
            list = dao.viewAllDestCity();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}
