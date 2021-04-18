package com.igeek.carsys.controller;




import com.igeek.carsys.entity.New;
import com.igeek.carsys.entity.Route;
import com.igeek.carsys.service.NewService;
import com.igeek.carsys.service.RouteService;
import com.igeek.carsys.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewServlet",urlPatterns = "/new")
public class NewServlet extends BaseServlet {
   private NewService service=new NewService();

   //根据新闻标题、新闻类型选择
    public void viewOneNew(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String new_title = request.getParameter("new_title");
        New news = service.viewOne(new_title);
        System.out.println(news);
        request.setAttribute("news",news);
        //页面跳转
        request.getRequestDispatcher("news.jsp").forward(request,response);
    }

    //查看所有新闻
    public void viewAllNews(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        PageVO<New> vo = service.viewAllNews(pageNow);
        //存储数据
        request.setAttribute("vo",vo);
        //跳转页面
        request.getRequestDispatcher("newsList.jsp").forward(request,response);

    }



}
