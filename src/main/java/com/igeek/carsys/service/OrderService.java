package com.igeek.carsys.service;

import com.igeek.carsys.dao.OrderDao;
import com.igeek.carsys.entity.*;
import com.igeek.carsys.utils.CommonUtils;
import com.igeek.carsys.utils.DataSourceUtils;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @Description 订单服务层
 * @Author Lemon
 * @Date 2021/2/8 12:13
 */
public class OrderService {
    private OrderDao dao=new OrderDao();
    private TicketService ticketService=new TicketService();
    private BusService busService=new BusService();
    private PassengerService passengerService=new PassengerService();
    private RouteService routeService=new RouteService();

    //插入订单
    public boolean insertOrder(Order order){
        int i = 0;

        try {
            i = dao.insertOne(order);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i>0?true:false;
    }

    //修改订单状态
    public boolean updateOrder(String ticket_status,String order_id){
        int i = 0;
        try {
            i = dao.updateorder(ticket_status, order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i>0?true:false;
    }

    //生成订单
    public Order takeOrder(String depart_station, String dest_station, String depart_time, String name , String person_id, String telephone, Date depart_date, String type, String insurance, String if_take_children, User user){
        Order order=null;
        try {
            DataSourceUtils.startTransaction();
            //查询车辆 属性对象
            Bus bus = busService.selectByDepartDest(depart_station,dest_station,depart_time);

            //车票属性
            Ticket ticket = ticketService.viewTicketDepartDestTime(depart_station, dest_station, depart_date, depart_time);

            if(ticket.getTicket_counts()>=1){
                //乘客属性
                Passenger passenger=null;

                passenger= new Passenger(name,person_id , telephone,depart_date,ticket.getTicket_id());


                order=new Order(bus,passenger,ticket,user.getUid());
                //设置订单编号
                order.setOrder_id(CommonUtils.getUUID().replaceAll("-",""));
                //设置订单生成时间  系统当前时间
                order.setOperate_time(new Timestamp(System.currentTimeMillis()));
                //设置座位号
                order.setSeat_id(new Random().nextInt(45));
                //设置车票状态
                order.setTicket_status("未付款");
                //设置检票窗口号
                order.setCheckout_id(new Random().nextInt(20));


                String ticket_type="-1";
                if(type.equals("true")){
                    ticket_type="1";
                }else{
                    ticket_type="0";
                }
                order.setTicket_type(ticket_type);


                if(insurance.equals("true")){
                    order.setInsurance(true);
                }else if(insurance.equals("false")){
                    order.setInsurance(false);
                }


                if(if_take_children.equals("true")){
                    order.setIf_taken_children(true);
                }else if(if_take_children.equals("false")){
                    order.setIf_taken_children(false);
                }

                //设置票价  若是儿童票，则打5折
                if(ticket_type=="0"){
                    order.setTicket_price(ticket.getTicket_price()*0.5);
                }else if(ticket_type=="1"){
                    //成人票，全票
                    order.setTicket_price(ticket.getTicket_price());
                }
                System.out.println(order);
                boolean flag = this.insertOrder(order);
                if(flag){
                    //订单生成成功，将乘客信息存储到数据库
                    boolean i = passengerService.insertOne(passenger);
                    System.out.println("添加乘客信息成功");

                    //对应路线热度+1；
                    routeService.updateHot(order);
                    int depart_date_id = ticket.getDepart_date_id();
                    //车次信息进行更改,座位数减少1
                    ticketService.updateSeatsCounts(depart_date_id,depart_time,ticket.getTicket_id(),ticket.getTicket_counts()-1);

                    System.out.println("车次信息更新成功");
                }
                return order;
            }

        }catch (Exception e){
            try {
                DataSourceUtils.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }finally {
            try {
                DataSourceUtils.commitAndRelease();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return order;

    }

    //查看我的订单
    public PageVO<Order> viewMyOrders(String user_id,int pageNow){
        PageVO<Order> vo=null;
        try {
            //获得我的订单的总数
            Long counts = dao.getMyOrdersCount(user_id);
            //获取页数myPages
            int mypages=(int)(counts%10==0?counts/10:Math.ceil(counts/10.0));
            //计算起始值
            int begin=(pageNow-1)*10;
            //我的订单所有订单数据
            List<Order> orderList = dao.getMyOrders(user_id, begin);
           vo = new PageVO<>(null, null, null, pageNow, mypages, orderList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //查看某一订单详情
    public Order viewOneOrder(String order_id){
        Order order = null;
        try {
            order = dao.getOneOrder(order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  order;
    }

    //删除我的订单
    public boolean deleteMyOrder(String order_id){
        int i = 0;
        try {
            i = dao.deleteOne(order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }

    //改签
    public boolean updateOrder(Date depart_date,String depart_time,String ticket_id,int seat_counts,String order_id){
        int i = 0;

        try {
            i = dao.updateOrder(depart_date, depart_time,ticket_id,seat_counts, order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i>0?true:false;
    }

    //改签全部过程
    public Order updateOrderTotal(String newDepart_time,String order_id,String newDate){
        try {
            DataSourceUtils.startTransaction();
             SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
             Date newDepart_date=null;
             try {
                 newDepart_date= sdf2.parse(newDate);
             }catch (Exception e){

             }

             //更新之前获取原来车次的信息
             //1.根据order_id
             Order OldOrder = this.viewOneOrder(order_id);
             //获得原来车次的车次编号
             String oldTicket_id = OldOrder.getTicket_id();
             //2.查看原来车次信息  原来的出发时间和出发日期
             Ticket oldTicket = ticketService.viewByTicket_id(OldOrder.getDepart_date(),OldOrder.getDepart_time(),oldTicket_id);

             if(newDate!=null&&!"".equals(newDate)&&newDepart_time!=null&&!"".equals(newDepart_time)) {
                 newDepart_date = sdf2.parse(newDate);
                 //获取新的车次信息
                 Order newOrder = this.viewOneOrder(order_id);
                 //查看车次信息  根据起点站、终点站、出发日期、出发时间
                 String depart_station = newOrder.getDepart_station();
                 String dest_station = newOrder.getDest_station();
                 //获得新的车次信息
                 Ticket newTicket = ticketService.viewTicketDepartDestTime(depart_station, dest_station, newDepart_date, newDepart_time);

                 if(newTicket.getTicket_counts()>=1){

                     //更新原来车次  剩余票数+1
                     int ticket_counts = oldTicket.getTicket_counts();
                     boolean b = ticketService.updateSeatsCounts(oldTicket.getDepart_date_id(),oldTicket.getDepart_time(), oldTicket.getTicket_id(), (ticket_counts + 1));
                     //新的座位号
                     int newSeatCounts = new Random().nextInt(newTicket.getTicket_counts());
                     boolean flag = false;
                     flag = this.updateOrder(newDepart_date, newDepart_time, newTicket.getTicket_id(), newSeatCounts, order_id);
                     String msg = null;
                     if (flag) {
                         //更新成功

                         //更新剩余票数新的车次的剩余票数  -1
                         int newTicketCounts = newTicket.getTicket_counts();
                         boolean b1 = ticketService.updateSeatsCounts(newTicket.getDepart_date_id(), newDepart_time, newTicket.getTicket_id(), (newTicketCounts - 1));

                         newOrder.setTicket(newTicket);
                         newOrder.setPassenger(OldOrder.getPassenger());
                         newOrder.setBus(OldOrder.getBus());
                         newOrder.setTicket(newTicket);
                         //查询新的订单数据
                         Order order = this.viewOneOrder(order_id);
                         return order;
                     }
                 }else{
                     try {
                         DataSourceUtils.rollback();
                     } catch (SQLException e) {
                         e.printStackTrace();
                     }
                 }

             }
             return  null;
         }catch(Exception e){
             try {
                 DataSourceUtils.rollback();
             } catch (SQLException ex) {
                 ex.printStackTrace();
             }
         }finally {
             try {
                 DataSourceUtils.commitAndRelease();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
     return null;

    }

    //查看所有未支付订单
    public PageVO<Order> viewNoPayOrder(int pageNow,String uid,String ticket_status){
        PageVO<Order> vo =null;
        //计算起始值
        int begin=(pageNow-1)*10;
        //计算所有的个数
        try {
            int counts = dao.viewNoPayCounts(uid, ticket_status);

            //计算总页数
            int myPages=(int)(counts%10==0?counts/10:Math.ceil(counts/10.0));
            //获取数据
            List<Order> list = dao.viewNoPay(begin, uid, ticket_status);
            //封装vo
            vo = new PageVO<>(null, null, null, pageNow, myPages, list);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vo;
    }
}
