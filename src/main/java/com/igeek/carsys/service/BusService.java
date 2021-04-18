package com.igeek.carsys.service;

import com.igeek.carsys.dao.BusDao;
import com.igeek.carsys.entity.Bus;

import java.sql.SQLException;
import java.util.Date;

/**
 * @Description 汽车服务层
 * @Author Lemon
 * @Date 2021/2/8 14:13
 */
public class BusService  {
    private BusDao dao=new BusDao();
    //根据起始站、目的地、出发时间查询车辆
    public Bus selectByDepartDest(String depart_station, String dest_station, String depart_time){
        Bus bus = null;
        try {
            bus = dao.selectBusByDepartDest(depart_station, dest_station, depart_time);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bus;
    }
}
