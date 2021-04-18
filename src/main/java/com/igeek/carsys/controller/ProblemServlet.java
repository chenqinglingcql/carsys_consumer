package com.igeek.carsys.controller;

import com.igeek.carsys.entity.Problem;
import com.igeek.carsys.service.ProblemService;
import com.igeek.carsys.service.TicketService;
import com.igeek.carsys.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Description 常见问题
 * @Author Lemon
 * @Date 2021/2/16 2:25
 */
@WebServlet(name = "ProblemServlet",urlPatterns = "/problem")
public class ProblemServlet extends BaseServlet {
    private ProblemService service = new ProblemService();

   /* //查看所有问题
    public void viewAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //查询问题
        List<Problem> problems = service.viewAll();
        //存储数据
        request.setAttribute("problems",problems);
        //页面跳转
        request.getRequestDispatcher("problems.jsp").forward(request,response);
    }

    //根据问题分类查询问题
    public void viewProblemsByCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String problem_category = request.getParameter("problem_category");

        List<Problem> problems = service.viewProblemByCategory(problem_category);
        //存储数据
        request.setAttribute("problems",problems);
        //页面跳转
        request.getRequestDispatcher("problems.jsp").forward(request,response);
    }

    //根据问题标题进行模糊查询
    public void viewProblemsByTitle(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String problem_title = request.getParameter("problem_title");
        //查询数据
        List<Problem> problems = service.viewProblemByTitle(problem_title);
        //存储数据
        request.setAttribute("problems",problems);
        //页面跳转
        request.getRequestDispatcher("problems.jsp").forward(request,response);
    }*/

    //
    public void view(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String link = request.getParameter("link");
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        PageVO<Problem> vo=null;
        switch (link){
            case "全部问题":
                vo= service.viewAll(pageNow);
                link="全部问题";
                break;
            case "购票问题":
                vo=service.viewProblemByCategory("购票问题",pageNow);
                link="购票问题";
                //分页查询switch条件
                break;
            case "支付问题":
                vo=service.viewProblemByCategory("支付问题",pageNow);
                link="支付问题";
                break;
            case "取票问题":
                vo=service.viewProblemByCategory("取票问题",pageNow);
                link="取票问题";
                break;
            case "退票改签问题":
                vo=service.viewProblemByCategory("退票改签问题",pageNow);
                link="退票改签问题";
                break;
            case "班次查询":
                vo=service.viewProblemByCategory("班次查询",pageNow);
                link="班次查询";
                break;
            case "个人账户问题":
                vo=service.viewProblemByCategory("个人账户问题",pageNow);
                link="个人账户问题";
                break;
            case "其他问题":
                vo=service.viewProblemByCategory("其他问题",pageNow);
                link="其他问题";
                break;
        }
        //存储数据
        request.setAttribute("vo",vo);
        request.setAttribute("link",link);
        //页面跳转
        request.getRequestDispatcher("problems.jsp").forward(request,response);

    }

}