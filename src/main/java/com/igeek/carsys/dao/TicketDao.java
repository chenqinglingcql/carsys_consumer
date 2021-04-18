package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Ticket;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @Description 票工具类
 * @Author Lemon
 * @Date 2021/2/6 22:30
 */
public class TicketDao extends BaseDao<Ticket> {
    //根据起始点、目的地、出发日期查询汽车票
    public List<Ticket> selectTicketByDepartDest(String depart_city, String dest_city, Date depart_date,int begin) throws SQLException {
        List<Ticket> list=null;
        if(depart_city!=null || !depart_city.equals("")){
            String sql="select *  from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where depart_city=? and dest_city=? and dates.depart_date=? and ticket_status='是' limit ?,5";
           list = this.getBeanList(sql, Ticket.class, depart_city, dest_city,depart_date,begin);


        }
          return list;
    }

    //根据起始点、目的地查询汽车票的总数
    public int selectCountsByDepartDest(String depart_city,String dest_city,Date depart_date) throws SQLException {
        String sql="select count(*) from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where depart_city=? and dest_city=? and dates.depart_date=? and ticket_status='是'";
        //object类型不能强转为int类型
        Long count = (Long) this.getSinglevalue(sql, depart_city, dest_city, depart_date);
        //返回long类型的int数值
        return count.intValue();
    }

    //根据起始点、目的地、出发日期、出发时间查询汽车票
    public Ticket selectTicketByDepartDestTime(String depart_station, String dest_station, Date depart_date, String depart_time) throws SQLException {
       //String sql="select * from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where depart_station=? and dest_station=? and depart_time=? and dates.depart_date=?";
        String sql="select * from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where depart_station=? and dest_station=? and dates.depart_date=? and depart_time=? and ticket_status='是'";
        Ticket ticket = this.getBean(sql, Ticket.class, depart_station, dest_station, depart_date,depart_time);
        return ticket;
    }

    //ge根据起始点、，目的地、出发日期查看所有班次的时间
    public List<Ticket> selectOrder(String depart_station,String dest_station,Date depart_date) throws SQLException {
        String sql="select * from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where depart_station=? and dest_station=? and dates.depart_date=? and ticket_status='是'";
        List<Ticket> ticketList = this.getBeanList(sql, Ticket.class, depart_station, dest_station,depart_date);
        return ticketList;
    }

    //设置车次信息中的剩余座位数
    public int updateTicketCounts(int depart_date_id,String depart_time,String ticket_id,int counts) throws SQLException {
        String sql="update ticketList set ticket_counts=? where ticket_id=? and depart_date_id=? and depart_time=? and ticket_status='是'";
        int i = this.update(sql, counts, ticket_id,depart_date_id,depart_time);
        return i;
    }

    //根据ticket_id查车次信息
    public Ticket viewByTicket_id(Date depart_date,String depart_time,String ticket_id) throws SQLException {
        String sql="select * from ticketList left join dates on ticketlist.depart_date_id=dates.date_id where ticket_id=? and dates.depart_date=? and depart_time=?";
        Ticket ticket = this.getBean(sql, Ticket.class, ticket_id,depart_date,depart_time);
        return ticket;
    }


    public int flushTime() throws SQLException {
        int a=-1;
        Date depart_date=new Date();
        for(int i=1;i<=15;i++){
            String sql="update dates set depart_date=? where date_id=?";
            a= this.update(sql,  depart_date,i);
            //更新时间
            depart_date.setTime(depart_date.getTime()+24*60*60*1000);
        }
        return a;
    }
}