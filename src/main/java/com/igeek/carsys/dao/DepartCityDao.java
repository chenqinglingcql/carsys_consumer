package com.igeek.carsys.dao;

import com.igeek.carsys.entity.DepartCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:03
 */
public class DepartCityDao extends BaseDao<DepartCity> {

    //查询所有的起点是
    public List<DepartCity> viewAllDepartCity() throws SQLException {
        String sql="select distinct route_depart_city from route";
        List<DepartCity> departList = this.getBeanList(sql, DepartCity.class);
        return departList;
    }
}
