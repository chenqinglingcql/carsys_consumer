package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Bus;

import java.sql.SQLException;
import java.util.Date;

/**
 * @Description 汽车工具类
 * @Author Lemon
 * @Date 2021/2/8 14:04
 */
public class BusDao extends BaseDao<Bus> {
    //根据起始站、目的站以及出发时间查询
    public Bus selectBusByDepartDest(String depart_station, String dest_station, String depart_time) throws SQLException {
        String sql="select * from bus where depart_station=? and dest_station=? and depart_time=?";
        Bus bus = this.getBean(sql, Bus.class, depart_station, dest_station, depart_time);
        return bus;
    }
}
