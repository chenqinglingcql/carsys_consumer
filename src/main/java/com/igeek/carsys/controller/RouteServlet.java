package com.igeek.carsys.controller;




import com.igeek.carsys.entity.Route;
import com.igeek.carsys.service.RouteService;
import com.igeek.carsys.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RouteServlet",urlPatterns = "/route")
public class RouteServlet extends BaseServlet {
    private RouteService service=new RouteService();
    /*
    public void addRoute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String route_depart_city = request.getParameter("route_depart_city");
        String route_dest_city = request.getParameter("route_dest_city");
        boolean flag = service.addRoute(route_depart_city, route_dest_city);
        String msg=null;
        if(flag){
            //增加成功
            msg="增加路线成功";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("addRoute.jsp").forward(request,response);
        }else{
            msg="增加路线成功";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("addRoute.jsp").forward(request,response);
        }


    }*/

    //查看所有路线信息
    public void viewAllRoute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取pageNow,并进行转化
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        PageVO<Route> vo = service.viewAllRoute(pageNow);
        System.out.println(vo);
        request.setAttribute("vo",vo);
        request.getRequestDispatcher("allRoute.jsp").forward(request,response);
    }

    //删除路线
    public void deleteRoute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("route_id");
        int route_id=Integer.parseInt(id);
        //获取pageNow,并进行转化
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        boolean flag = service.deleteRoute(route_id);
        String msg=null;
        PageVO<Route> vo=null;
        if(flag){
            //删除成功
            msg="删除成功";
            vo= service.viewAllRoute(pageNow);
        }else{
            //删除失败
            msg="删除失败";
            vo = service.viewAllRoute(pageNow);

        }
        request.setAttribute("msg",msg);
        request.setAttribute("vo",vo);
        request.getRequestDispatcher("allRoute.jsp").forward(request,response);
    }




}
