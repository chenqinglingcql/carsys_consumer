package com.igeek.carsys.service;

import com.igeek.carsys.dao.DepartCityDao;
import com.igeek.carsys.entity.DepartCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/5 21:07
 */
public class DepartCityService {
    private DepartCityDao dao=new DepartCityDao();
    //查询所有的起点城市
    public List<DepartCity> viewAllDepartCity(){
        List<DepartCity> list = null;
        try {
            list = dao.viewAllDepartCity();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
