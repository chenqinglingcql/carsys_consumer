package com.igeek.carsys.dao;


import com.igeek.carsys.entity.Route;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 路线工具类
 * @Author Lemon
 * @Date 2021/2/19 22:38
 */
public class RouteDao extends BaseDao<Route> {
    //增加路线
    public int addRoute(String route_depart_city,String route_dest_city,Double route_price) throws SQLException {
        String sql="insert into route values(null,?,?,?)";
        int i = this.update(sql, route_depart_city, route_dest_city, route_price);
        return i;
    }
    //查看所有路线的个数
    public Long viewRouteCount() throws SQLException {
        String sql="select count(*) from route";
        Long count = (Long)this.getSinglevalue(sql);
        return count;
    }
    //查看所有的路线信息
    public List<Route> viewAllRoute(int begin) throws SQLException {
        String sql="select * from route order by hot desc limit ?,5";
        List<Route> list = this.getBeanList(sql, Route.class,begin);
        return list;
    }

    //删除路线
    public int deleteRoute(int route_id) throws SQLException {
        String sql="delete  from route where route_id=?";
        int i = this.update(sql, route_id);
        return  i;

        //顺便删除TicketList中对应的车票
    }

    //根据depart_city,dest_city查找route
    public Route selectRoute(String depart_city,String dest_city) throws SQLException {
        String sql="select * from route where route_depart_city=? and route_dest_city=?";
        Route route = this.getBean(sql, Route.class, depart_city, dest_city);
        return  route;
    }

    //更新route中热度
    public int updateHot(int hot,String route_depart_city,String route_dest_city) throws SQLException {
        String sql="update route set hot=? where route_depart_city=? and route_dest_city=?";
        int i = this.update(sql, hot, route_depart_city, route_dest_city);
        return i;
    }


}
