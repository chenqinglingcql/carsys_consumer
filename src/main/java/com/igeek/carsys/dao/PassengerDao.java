package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Passenger;

import java.sql.SQLException;

/**
 * @Description 乘客工具类
 * @Author Lemon
 * @Date 2021/2/8 21:17
 */
public class PassengerDao extends BaseDao<Passenger> {
    public int insertOne(Passenger passenger) throws SQLException {
        String sql="insert into passenger values(null,?,?,?,?,?)";
        int i = this.update(sql, passenger.getPName(),passenger.getPPerson_id() ,passenger.getPtelephone(),passenger.getPDate(),passenger.getPTicketId() );
        return i;
    }
}
