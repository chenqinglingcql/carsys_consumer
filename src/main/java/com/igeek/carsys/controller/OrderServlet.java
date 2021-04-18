package com.igeek.carsys.controller;

import com.igeek.carsys.entity.*;
import com.igeek.carsys.service.*;
import com.igeek.carsys.utils.CommonUtils;
import com.igeek.carsys.vo.PageVO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "OrderServlet",urlPatterns ="/order")
public class OrderServlet extends BaseServlet {
    private OrderService orderService=new OrderService();
    private BusService busService=new BusService();
    private TicketService ticketService=new TicketService();
    private PassengerService passengerService=new PassengerService();
    private RouteService routeService=new RouteService();

    //提交订单
    public void takeOrder(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

        //汽车对象
        //根据出发站、目的地、出发时间查询车辆
        String depart_station = request.getParameter("depart_station");
        String dest_station = request.getParameter("dest_station");
        String depart_time = request.getParameter("depart_time");

        //从会话获取user对象，并获取用户user_id
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        //设置Passenger属性
        //新建passenger属性对象
        String name = request.getParameter("name");
        String person_id = request.getParameter("person_id");
        String telephone = request.getParameter("telephone");


        //设置ticket属性
        //设置出发日期
        String date = request.getParameter("depart_date");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date depart_date = null;
        try {
            depart_date = sdf2.parse(date);
        } catch (Exception e) {

        }
        //设置票的类型ticket_type;
        String type = request.getParameter("ticket_type");
        //设置是否购买保险
        String insurance = request.getParameter("insurance");
        //设置是否携带儿童
        String if_take_children = request.getParameter("if_take_children");


        /*调用service改签方法*/
        //Order order = orderService.takeOrder(depart_station, dest_station, depart_time, name, person_id, telephone, depart_date, type, insurance, if_take_children, user);
        //查询车辆 属性对象
        Bus bus = busService.selectByDepartDest(depart_station, dest_station, depart_time);

        //车票属性
        Ticket ticket = ticketService.viewTicketDepartDestTime(depart_station, dest_station, depart_date, depart_time);

        if (ticket.getTicket_counts() >= 1) {
            //乘客属性
            Passenger passenger = null;

            passenger = new Passenger(1,name, person_id, telephone, depart_date, ticket.getTicket_id());


            Order order = new Order(bus, passenger, ticket, user.getUid());
            //设置订单编号
            order.setOrder_id(CommonUtils.getUUID().replaceAll("-", ""));
            //设置订单生成时间  系统当前时间
            order.setOperate_time(new Timestamp(System.currentTimeMillis()));
            //设置座位号
            order.setSeat_id(ticket.getTicket_counts());
            //设置车票状态
            order.setTicket_status("未支付");
            //设置检票窗口号
            order.setCheckout_id(new Random().nextInt(20));


            String ticket_type = "-1";
            if (type.equals("true")) {
                ticket_type = "1";
            } else {
                ticket_type = "0";
            }
            order.setTicket_type(ticket_type);


            if (insurance.equals("true")) {
                order.setInsurance(true);
            } else if (insurance.equals("false")) {
                order.setInsurance(false);
            }


            if (if_take_children.equals("true")) {
                order.setIf_taken_children(true);
            } else if (if_take_children.equals("false")) {
                order.setIf_taken_children(false);
            }

            //设置票价  若是儿童票，则打5折
            if (ticket_type == "0") {
                order.setTicket_price(ticket.getTicket_price() * 0.5);
            } else if (ticket_type == "1") {
                //成人票，全票
                order.setTicket_price(ticket.getTicket_price());
            }
            System.out.println(order);
            boolean flag = orderService.insertOrder(order);
            if (flag) {
                //订单生成成功，将乘客信息存储到数据库
                boolean i = passengerService.insertOne(passenger);
                System.out.println("添加乘客信息成功");

                //对应路线热度+1；
                routeService.updateHot(order);
                int depart_date_id = ticket.getDepart_date_id();
                //车次信息进行更改,座位数减少1
                ticketService.updateSeatsCounts(depart_date_id, depart_time, ticket.getTicket_id(), ticket.getTicket_counts() - 1);

                System.out.println("车次信息更新成功");
            }
            if (order != null) {
                //将数据存储
                request.setAttribute("order", order);
                session.setAttribute("order", order);
                //订单生成,跳转到支付界面
                request.getRequestDispatcher("payforOrder.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "订单提交失败");
                request.getRequestDispatcher("takeOrder.jsp").forward(request, response);
            }


        }
    }

    //确认订单
    public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        //从会话中获取当前订单信息
        HttpSession session = request.getSession();
        Order order = (Order)session.getAttribute("order");

        //更新订单中收货人信息
        boolean flag =false;
        flag=orderService.updateOrder("未检票".toString(), order.getOrder_id());

        //若更新成功，则跳转至支付页面
        if(flag){
            response.sendRedirect( "/alipay.trade.page.pay.jsp");
        }
    }

    //查看我的订单
    public void viewMyOrders(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //从会话中获取用户user_id
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String user_id = user.getUid();
        //获取pageNow,并进行转化
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        //通过用户user_id查询我的订单
        PageVO<Order> vo = orderService.viewMyOrders(user_id, pageNow);
        //将查询结果存储
        request.setAttribute("vo",vo);
        request.getRequestDispatcher("orderList.jsp").forward(request,response);

    }

    //退票(已支付)
    public void deleteOrder(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        Order order = orderService.viewOneOrder(order_id);

        String msg=null;
        //车次信息更新
        //获取depart_station,dest_station
        String depart_station = order.getDepart_station();
        String dest_station = order.getDest_station();
        Date depart_date = order.getDepart_date();
        String depart_time = order.getDepart_time();
        //根据depart_date,depart_time,ticket_id查询车次信息
        Ticket ticket = ticketService.viewByTicket_id(depart_date, depart_time, order.getTicket_id());
        //更新剩余票数
        boolean b = ticketService.updateSeatsCounts(ticket.getDepart_date_id(), depart_time, ticket.getTicket_id(), ticket.getTicket_counts()+1);
        if(b){
            System.out.println("剩余票数更新成功");
        }else{
            System.out.println("剩余票数更新失败");
        }
        boolean flag = orderService.deleteMyOrder(order_id);
        if(flag) {
            request.setAttribute("order_id",order.getOrder_id());
            request.setAttribute("price",order.getTicket_price());
            request.getRequestDispatcher("/alipay.trade.refund.jsp?order_id="+order_id+"&price="+order.getTicket_price()).forward(request,response);
        }
        /*request.getRequestDispatcher("/order?method=viewMyOrders");*/
    }

    //删除订单（未支付）
    public void deleteOrderNoPay(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        Order order = orderService.viewOneOrder(order_id);

        String msg=null;
        //车次信息更新
        //获取depart_station,dest_station
        String depart_station = order.getDepart_station();
        String dest_station = order.getDest_station();
        Date depart_date = order.getDepart_date();
        String depart_time = order.getDepart_time();
        //根据depart_date,depart_time,ticket_id查询车次信息
        Ticket ticket = ticketService.viewByTicket_id(depart_date, depart_time, order.getTicket_id());
        //更新剩余票数
        boolean b = ticketService.updateSeatsCounts(ticket.getDepart_date_id(), depart_time, ticket.getTicket_id(), ticket.getTicket_counts()+1);
        if(b){
            System.out.println("剩余票数更新成功");
        }else{
            System.out.println("剩余票数更新失败");
        }
        boolean flag = orderService.deleteMyOrder(order_id);
        if(flag) {
            request.setAttribute("order_id",order.getOrder_id());
            request.setAttribute("price",order.getTicket_price());
            request.getRequestDispatcher("/order?method=viewNoPayList?user_id="+order.getUser_id()).forward(request,response);
        }
        /*request.getRequestDispatcher("/order?method=viewMyOrders");*/
    }


    //查看某一订单详情
    public void viewOneOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        //查看某一订单详情
        Order order = orderService.viewOneOrder(order_id);
        //查看时间列表
        List<Ticket> ticketList = ticketService.viewOrder(order.getDepart_station(), order.getDest_station(), order.getDepart_date());
        if(order!=null){
            //订单不为空，跳转至修改订单页面
            //存储数据
            request.setAttribute("order",order);
            request.setAttribute("ticketList",ticketList);
            request.getRequestDispatcher("edit_order.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("orderList.jsp");
        }
    }

    //改签
    public void updateOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数

        String newDepart_time = request.getParameter("depart_time");
        String order_id = request.getParameter("order_id");
        //出发日期
        String newDate = request.getParameter("depart_date");
        Order order = orderService.updateOrderTotal(newDepart_time, order_id, newDate);
        String msg=null;
        if(order!=null){

            //将订单数据进行存储
            request.setAttribute("order",order);
            //提示信息
            msg="更新成功";
            request.setAttribute("msg",msg);
            //页面跳转
            request.getRequestDispatcher("/order?method=viewMyOrders").forward(request,response);
        }else{
            msg="更新失败";
            request.setAttribute("msg",msg);
               /* //跳转到订单详情，并传递数据
                Order order = orderService.viewOneOrder(order_id);
                request.setAttribute("order",order);*/
            request.getRequestDispatcher("orderList.jsp").forward(request,response);
        }
    }

    //查看所有未支付订单
    public void viewNoPayList(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //获取会话对象
        User user = (User) session.getAttribute("user");
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        //获取uid
        String uid = user.getUid();
        PageVO<Order> payList = orderService.viewNoPayOrder(pageNow,uid, "未支付");
        request.setAttribute("vo",payList);
        request.getRequestDispatcher("orderList.jsp").forward(request,response);

    }

    //查看已支付订单
    public void viewPayList(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //获取会话对象
        User user = (User) session.getAttribute("user");
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        //获取uid
        String uid = user.getUid();
        PageVO<Order> payList = orderService.viewNoPayOrder(pageNow,uid, "未检票");
        request.setAttribute("vo",payList);
        request.getRequestDispatcher("orderList.jsp").forward(request,response);

    }

    //未支付订单
    public void viewNoPayOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        Order order = orderService.viewOneOrder(order_id);
        request.setAttribute("order",order);
        //跳转页面
        request.getRequestDispatcher("payforOrder.jsp").forward(request,response);
    }




}
