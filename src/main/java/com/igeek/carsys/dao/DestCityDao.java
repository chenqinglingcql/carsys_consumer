package com.igeek.carsys.dao;

import com.igeek.carsys.entity.DestCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:06
 */
public class DestCityDao extends BaseDao<DestCity> {
    //查询所有的目的成hi是
    public List<DestCity> viewAllDestCity() throws SQLException {
        String sql="select distinct route_dest_city from route";
        List<DestCity> destList = this.getBeanList(sql,DestCity.class);
        return destList;
    }
    //根据起点城市查询所有的目的城市
    public List<DestCity> viewAllDestCityByDepartCity(String depart_city) throws SQLException {
        String sql="select distinct route_dest_city from route where route_depart_city=?";
        List<DestCity> destList = this.getBeanList(sql, DestCity.class,depart_city);
        return destList;
    }
}
