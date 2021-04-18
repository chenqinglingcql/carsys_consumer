package com.igeek.carsys.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

/**
 * @Description 订单实体类
 * @Author Lemon
 * @Date 2021/2/8 11:18
 */
public class Order {
    //订单id
    private String order_id;
    //下单时间
    private Timestamp operate_time;
    //车票出发日期
    private Date depart_date;
    //出票出发时间
    private String depart_time;
    //车次
    private String ticket_id;
    //汽车类型
    private String bus_type;
    //检票窗口
    private int checkout_id;
    //车票状态
    private String ticket_status;
    //车票类型
    private String ticket_type;
    //车票价格
    private double  ticket_price;
    //乘车人姓名
    private String name;
    //乘车人身份证号
    private String person_id;
    //联系方式
    private String telephone;
    //座位号
    private int seat_id;
    //起始站
    private String depart_station;
    //目的地
    private String dest_station;
    //是否购买保险
    private boolean insurance;
    //是否携带儿童
    private boolean if_taken_children;

    //关联汽车、汽车票、乘客类
    private Bus bus;
    private Ticket ticket;
    private Passenger passenger;
    //用户id  便于搜索我的订单
    private String user_id;


    public Order() {
    }
    public Order(Bus bus,Passenger passenger,Ticket ticket,String user_id){
        this.depart_date = ticket.getDepart_date();
        this.depart_time = ticket.getDepart_time();
        this.ticket_id =ticket.getTicket_id();
        this.bus_type = bus.getBus_type();

        this.ticket_price = ticket.getTicket_price();
        this.name = passenger.getPName();
        this.person_id = passenger.getPPerson_id();
        this.telephone = passenger.getPtelephone();

        this.depart_station = ticket.getDepart_station();
        this.dest_station = ticket.getDest_station();

        this.bus = bus;
        this.ticket = ticket;
        this.passenger = passenger;
        this.user_id=user_id;
    }

    public Order(String order_id, Timestamp operate_time, int checkout_id, String ticket_status, String ticket_type,  int seat_id,  boolean insurance, boolean if_taken_children, Bus bus, Ticket ticket, Passenger passenger,String user_id) {
        this.order_id = order_id;
        this.operate_time = operate_time;
        this.depart_date = ticket.getDepart_date();
        this.depart_time = ticket.getDepart_time();
        this.ticket_id =ticket.getTicket_id();
        this.bus_type = bus.getBus_type();
        this.checkout_id = checkout_id;
        this.ticket_status = ticket_status;
        this.ticket_type = ticket_type;
        this.ticket_price = ticket.getTicket_price();
        this.name = passenger.getPName();
        this.person_id = passenger.getPPerson_id();
        this.telephone = passenger.getPtelephone();
        this.seat_id = seat_id;
        this.depart_station = ticket.getDepart_station();
        this.dest_station = ticket.getDest_station();
        this.insurance = insurance;
        this.if_taken_children = if_taken_children;
        this.bus = bus;
        this.ticket = ticket;
        this.passenger = passenger;
        this.user_id=user_id;
    }

    /**
     * 获取
     * @return order_id
     */
    public String getOrder_id() {
        return order_id;
    }

    /**
     * 设置
     * @param order_id
     */
    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    /**
     * 获取
     * @return operate_time
     */
    public Timestamp getOperate_time() {
        return operate_time;
    }

    /**
     * 设置
     * @param operate_time
     */
    public void setOperate_time(Timestamp operate_time) {
        this.operate_time = operate_time;
    }

    /**
     * 获取
     * @return depart_date
     */
    public Date getDepart_date() {
        return depart_date;
    }

    /**
     * 设置
     * @param depart_date
     */
    public void setDepart_date(Date depart_date) {
        this.depart_date = depart_date;
    }

    /**
     * 获取
     * @return depart_time
     */
    public String getDepart_time() {
        return depart_time;
    }

    /**
     * 设置
     * @param depart_time
     */
    public void setDepart_time(String depart_time) {
        this.depart_time = depart_time;
    }

    /**
     * 获取
     * @return ticket_id
     */
    public String getTicket_id() {
        return ticket_id;
    }

    /**
     * 设置
     * @param ticket_id
     */
    public void setTicket_id(String ticket_id) {
        this.ticket_id = ticket_id;
    }

    /**
     * 获取
     * @return bus_type
     */
    public String getBus_type() {
        return bus_type;
    }

    /**
     * 设置
     * @param bus_type
     */
    public void setBus_type(String bus_type) {
        this.bus_type = bus_type;
    }

    /**
     * 获取
     * @return checkout_id
     */
    public int getCheckout_id() {
        return checkout_id;
    }

    /**
     * 设置
     * @param checkout_id
     */
    public void setCheckout_id(int checkout_id) {
        this.checkout_id = checkout_id;
    }

    /**
     * 获取
     * @return ticket_status
     */
    public String getTicket_status() {
        return ticket_status;
    }

    /**
     * 设置
     * @param ticket_status
     */
    public void setTicket_status(String ticket_status) {
        this.ticket_status = ticket_status;
    }

    /**
     * 获取
     * @return ticket_type
     */
    public String getTicket_type() {
        return ticket_type;
    }

    /**
     * 设置
     * @param ticket_type
     */
    public void setTicket_type(String ticket_type) {
        this.ticket_type = ticket_type;
    }

    /**
     * 获取
     * @return ticket_price
     */
    public double getTicket_price() {
        return ticket_price;
    }

    /**
     * 设置
     * @param ticket_price
     */
    public void setTicket_price(double ticket_price) {
        this.ticket_price = ticket_price;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return person_id
     */
    public String getPerson_id() {
        return person_id;
    }

    /**
     * 设置
     * @param person_id
     */
    public void setPerson_id(String person_id) {
        this.person_id = person_id;
    }

    /**
     * 获取
     * @return telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置
     * @param telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 获取
     * @return seat_id
     */
    public int getSeat_id() {
        return seat_id;
    }

    /**
     * 设置
     * @param seat_id
     */
    public void setSeat_id(int seat_id) {
        this.seat_id = seat_id;
    }

    /**
     * 获取
     * @return depart_station
     */
    public String getDepart_station() {
        return depart_station;
    }

    /**
     * 设置
     * @param depart_station
     */
    public void setDepart_station(String depart_station) {
        this.depart_station = depart_station;
    }

    /**
     * 获取
     * @return dest_station
     */
    public String getDest_station() {
        return dest_station;
    }

    /**
     * 设置
     * @param dest_station
     */
    public void setDest_station(String dest_station) {
        this.dest_station = dest_station;
    }

    /**
     * 获取
     * @return insurance
     */
    public boolean isInsurance() {
        return insurance;
    }

    /**
     * 设置
     * @param insurance
     */
    public void setInsurance(boolean insurance) {
        this.insurance = insurance;
    }

    /**
     * 获取
     * @return if_taken_children
     */
    public boolean isIf_taken_children() {
        return if_taken_children;
    }

    /**
     * 设置
     * @param if_taken_children
     */
    public void setIf_taken_children(boolean if_taken_children) {
        this.if_taken_children = if_taken_children;
    }

    /**
     * 获取
     * @return bus
     */
    public Bus getBus() {
        return bus;
    }

    /**
     * 设置
     * @param bus
     */
    public void setBus(Bus bus) {
        this.bus = bus;
    }

    /**
     * 获取
     * @return ticket
     */
    public Ticket getTicket() {
        return ticket;
    }

    /**
     * 设置
     * @param ticket
     */
    public void setTicket(Ticket ticket) {
        //更新订单信息
        //ticket车次信息一变，订单信息也变
        this.ticket = ticket;
        this.ticket_id=ticket.getTicket_id();
        this.depart_date=ticket.getDepart_date();
        this.depart_time=ticket.getDepart_time();

    }

    /**
     * 获取
     * @return passenger
     */
    public Passenger getPassenger() {
        return passenger;
    }

    /**
     * 设置
     * @param passenger
     */
    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public void setUser_id(String user_id){
        this.user_id=user_id;
    }

    public String getUser_id(){
        return user_id;
    }
    public String toString() {
        return "Order{order_id = " + order_id + ", operate_time = " + operate_time + ", depart_date = " + depart_date + ", depart_time = " + depart_time + ", ticket_id = " + ticket_id + ", bus_type = " + bus_type + ", checkout_id = " + checkout_id + ", ticket_status = " + ticket_status + ", ticket_type = " + ticket_type + ", ticket_price = " + ticket_price + ", name = " + name + ", person_id = " + person_id + ", telephone = " + telephone + ", seat_id = " + seat_id + ", depart_station = " + depart_station + ", dest_station = " + dest_station + ", insurance = " + insurance + ", if_taken_children = " + if_taken_children + ", bus = " + bus + ", ticket = " + ticket + ", passenger = " + passenger + "}";
    }
}
