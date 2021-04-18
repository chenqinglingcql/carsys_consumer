package com.igeek.carsys.controller;

import com.igeek.carsys.entity.DepartCity;
import com.igeek.carsys.entity.DestCity;
import com.igeek.carsys.entity.Ticket;
import com.igeek.carsys.service.DepartCityService;
import com.igeek.carsys.service.DestCityService;
import com.igeek.carsys.service.TicketService;
import com.igeek.carsys.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "TicketServlet",urlPatterns = "/ticket")
public class TicketServlet extends BaseServlet {
    private TicketService service=new TicketService();
    private DestCityService destCityService=new DestCityService();
    private DepartCityService departCityService=new DepartCityService();

    public void viewTicketByDepartDest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        //获取请求参数
        String depart_city = request.getParameter("depart_city");
        String dest_city = request.getParameter("dest_city");

        //查询所有的终点城市
        List<DestCity> destCityList =destCityService.viewAllDestCity();
        System.out.println(destCityList);

        //查询所有的起点城市
        List<DepartCity> departCityList = departCityService.viewAllDepartCity();
        System.out.println(departCityList);

        String time = request.getParameter("depart_date");
        System.out.println("time="+time);
        //查询所有起点城市
        destCityList = destCityService.viewAllDestCity();
        //查询所有的终点城市

        if(depart_city!=null&&dest_city!=null&&time!=null){


            String page = request.getParameter("pageNow");
            //对page进行处理，获得pageNow
            int pageNow=1;
            if(page!=null&&!"".equals(page)){
                pageNow=Integer.parseInt(page);
            }

            Date depart_date = null;
            if(time!=null&&!"".equals(time)){
                try {
                    //对出发时间进行解析   Sun Feb 07 00:00:00 CST 2021
                    SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK);
                    depart_date= sdf.parse(time);
                    //将初步解析后的日期再次进行解析
                    //SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
               /* String sDate=sdf2.format(newdate);
                System.out.println("解析完毕后的日期");*/
                } catch (ParseException e) {
                    SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        depart_date=sdf2.parse(time);
                        System.out.println("depart_date="+depart_date);
                    } catch (ParseException ex) {
                        ex.printStackTrace();
                    }
                }
            }else{
                depart_date=new Date();
            }

            //获取所有的信息
            PageVO<Ticket> vo = service.viewTicketByDepartDest(depart_city, dest_city, depart_date, pageNow);

            //将查询数据存储d到request中
            request.setAttribute("vo",vo);
            request.setAttribute("depart_city",depart_city);
            System.out.println(depart_city);
            System.out.println(dest_city);
            request.setAttribute("dest_city",dest_city);
            request.setAttribute("depart_date",time);
        }


        request.setAttribute("destCityList",destCityList);
        request.setAttribute("departCityList",departCityList);
        //跳转页面
        request.getRequestDispatcher("ticketList.jsp").forward(request,response);
    }



    /*预订车票*/
    public void viewTicketByDepartDestTime(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String depart_station = request.getParameter("depart_station");
        String dest_station = request.getParameter("dest_station");
        String depart_time = request.getParameter("depart_time");
        String date = request.getParameter("depart_date");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date depart_date = null;
        try {
            depart_date = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //查找对应的车票
        Ticket ticket = service.viewTicketDepartDestTime(depart_station, dest_station, depart_date, depart_time);
        //将车票信息存储
        request.setAttribute("ticket",ticket);
        //页面跳转
        request.getRequestDispatcher("takeOrder.jsp").forward(request,response);
    }

    //通过始发站、目的地、出发日期查找所有车次的时间
    public void viewOrderTime(HttpServletRequest request,HttpServletResponse response){
        //获取请求参数
        String depart_station = request.getParameter("depart_station");
        String dest_station = request.getParameter("dest_station");
        String date = request.getParameter("depart_date");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date depart_date = null;
        List<String> timeList=null;
        try {
            //解析时间
            depart_date = sdf.parse(date);
            List<Ticket> ticketList = service.viewOrder(depart_station, dest_station, depart_date);
            //存储数据
            request.setAttribute("ticketList",ticketList);
            //页面跳转
            request.getRequestDispatcher("edit_order.jsp").forward(request,response);

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }



}
