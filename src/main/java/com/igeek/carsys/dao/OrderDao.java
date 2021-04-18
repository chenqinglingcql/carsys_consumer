package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Order;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;


/**
 * @Description 订单工具类
 * @Author Lemon
 * @Date 2021/2/8 11:51
 */
public class OrderDao extends BaseDao<Order> {

    //插入数据
    public int insertOne(Order order) throws SQLException {
       String sql = "insert into orderList values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int i = this.update(sql, order.getOrder_id(), order.getOperate_time(), order.getDepart_date(), order.getDepart_time(),
                order.getTicket_id(), order.getBus_type(), order.getCheckout_id(), order.getTicket_status(),
                order.getTicket_type(), order.getTicket_price(), order.getName(), order.getPerson_id(),order.getTelephone(),
                order.getSeat_id(), order.getDepart_station(), order.getDest_station(), order.isInsurance(), order.isIf_taken_children(),order.getUser_id());
        return i;
    }

    //修改订单状态
    public int updateorder(String ticket_status,String order_id) throws SQLException {
        String sql="update orderList set ticket_status=? where order_id=?";
        int i = this.update(sql, ticket_status, order_id);
        return i;
    }

    //查看我的订单
    public List<Order> getMyOrders(String user_id,int begin) throws SQLException {
        String sql="select * from orderList where user_id=? order by depart_date desc limit ?,10 ";
        List<Order> list = this.getBeanList(sql,Order.class, user_id,begin);
        return list;
    }

    //查看我的订单的总数
    public Long getMyOrdersCount(String uid) throws SQLException {
        String sql="select count(*) from orderList where user_id=?";
        Long  counts = (Long) this.getSinglevalue(sql, uid);
        return counts;
    }
    //查看某一订单详情
    public Order getOneOrder(String order_id) throws SQLException {
        String sql="select * from orderList where order_id=?";
        Order order = this.getBean(sql, Order.class, order_id);
        return  order;
    }

    //删除订单
    public int deleteOne(String order_id) throws SQLException {
        String sql="delete from orderList where order_id=?";
        int i = this.update(sql, order_id);
        return i;
    }
    //改签
    public int updateOrder(Date depart_date, String depart_time,String ticket_id,int seat_id,String order_id) throws SQLException {
        String sql="update orderList set depart_date=? , depart_time=? , ticket_id=? , seat_id=?  where order_id=? ";
        int i = this.update(sql, depart_date, depart_time,ticket_id,seat_id,order_id);
        return i;
    }

    //查看未支付订单
    public List<Order> viewNoPay(int begin,String uid,String ticket_status) throws SQLException {
        String sql="select * from orderList where user_id=? and ticket_status=? limit ?,10";
        List<Order> list = this.getBeanList(sql, Order.class, uid, ticket_status,begin);
        return list;
    }

    //计算所有未支付状态订单的个数
    public int viewNoPayCounts(String uid,String ticket_status) throws SQLException {
        String sql="select count(*) from orderList where user_id=? and ticket_status=?";
        Long counts = (Long) this.getSinglevalue(sql, uid, ticket_status);
        return counts.intValue();
    }
}
