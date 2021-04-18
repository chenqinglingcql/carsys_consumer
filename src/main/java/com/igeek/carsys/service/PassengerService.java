package com.igeek.carsys.service;

import com.igeek.carsys.dao.PassengerDao;
import com.igeek.carsys.entity.Passenger;

import java.sql.SQLException;

/**
 * @Description 乘客服务层
 * @Author Lemon
 * @Date 2021/2/8 21:25
 */
public class PassengerService {
    private PassengerDao dao=new PassengerDao();

    //新增乘客信息
    public boolean insertOne(Passenger passenger){
        int i = 0;
        try {
            i = dao.insertOne(passenger);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }
}
