package com.igeek.carsys.service;



import com.igeek.carsys.dao.RouteDao;
import com.igeek.carsys.dao.TicketDao;
import com.igeek.carsys.entity.Order;
import com.igeek.carsys.entity.Route;
import com.igeek.carsys.entity.Ticket;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * @Description 路线服务层
 * @Author Lemon
 * @Date 2021/2/19 22:55
 */
public class RouteService {
    private RouteDao routeDao=new RouteDao();
    private TicketDao ticketDao=new TicketDao();

    //查看所有路线
    public PageVO<Route> viewAllRoute(int pageNow){
        PageVO<Route> vo=null;

        try {
            //获取路线总数量
            Long count = routeDao.viewRouteCount();
            //获取总页数
            int myPages=(int)(count%10==0?count/5:Math.ceil(count/5.0));
            //计算起始值
            int begin=(pageNow-1)*5;
            //我的订单所有订单数据
            List<Route> list = routeDao.viewAllRoute(begin);
            vo=new PageVO<>(null,null,null,pageNow,myPages,list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;

    }

    //删除路线
    public boolean deleteRoute(int route_id){
        int i = 0;
        try {
            i = routeDao.deleteRoute(route_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }

    //更新热度
    public boolean updateHot(Order order){
        //获取订单信息
        String depart_station = order.getDepart_station();
        String dest_station = order.getDest_station();
        Date depart_date = order.getDepart_date();
        String depart_time = order.getDepart_time();
        //获取车次信息
        try {
            Ticket ticket = ticketDao.selectTicketByDepartDestTime(depart_station, dest_station, depart_date, depart_time);
            //获取depart_city,dest_city;
            String depart_city = ticket.getDepart_city();
            String dest_city = ticket.getDest_city();
            Route route = routeDao.selectRoute(depart_city, dest_city);
            //获取route的热度
            int hot = route.getHot();
            int i = routeDao.updateHot((hot+1), depart_city, dest_city);
            return i>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return false;
    }
}
