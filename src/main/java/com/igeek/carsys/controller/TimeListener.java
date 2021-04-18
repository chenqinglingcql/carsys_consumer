package com.igeek.carsys.controller;

import com.igeek.carsys.service.TicketService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;
import java.sql.Time;
import java.util.Timer;
import java.util.TimerTask;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/20 15:29
 */
public class TimeListener extends HttpServlet implements ServletContextListener {
    //监听销毁
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    //监听开始执行
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    // 当监听开始执行时,设置一个TIME
        Timer timer = new Timer();
        System.out.println("-------   Timer开始进行执行  -----------");
           timer.schedule(new TimerTask() {
               @Override
               public void run() {
                   TicketService ticketService = new TicketService();
                   boolean b = ticketService.flushTime();
                   if(b){
                       System.out.println("刷新成功");
                   }
               }
           },1000*60*60*24);


    }
}
