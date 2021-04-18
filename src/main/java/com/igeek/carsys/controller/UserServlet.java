package com.igeek.carsys.controller;

import com.igeek.carsys.entity.User;
import com.igeek.carsys.service.UserService;
import com.igeek.carsys.utils.CommonUtils;
import com.igeek.carsys.utils.MD5Utils;
import net.sf.json.JSONObject;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "UserServlet",urlPatterns = "/user")
@MultipartConfig
public class UserServlet extends BaseServlet {
    private UserService service=new UserService();
    public void login(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String telephone = request.getParameter("telephone");
        String pwd = request.getParameter("password");
        //md5加密
        String password = MD5Utils.md5(pwd);
        User user=null;
        //手机号的长度为18位，则为身份证号
        if(telephone.length()==18){
            //采用身份证号、手机号登录
           user = service.login(Long.parseLong(telephone), password);

        }else{
            //采用手机号、密码登录
            user = service.login(telephone, password);
        }

        if(user!=null){
            //登录成功
            System.out.println("user="+user);
            String free = request.getParameter("free");
            String remember = request.getParameter("remember");
            if(remember!=null && "remember".equals(remember)){
                //记住名字
                Cookie telephoneCookie = new Cookie("remember", telephone);
                //设置存储时间  7天
                telephoneCookie.setMaxAge(7*24*60*60);
                response.addCookie(telephoneCookie);
            }else if(free!=null && "free".equals(free)){
                //创建cookie
                Cookie telephoneCookie = new Cookie("telephone", telephone);
                Cookie passwordCookie = new Cookie("password", password);
                //设置cookie时长
                telephoneCookie.setMaxAge(7*24*60*60);
                passwordCookie.setMaxAge(7*24*60*60);
                //将cookie添加至response
                response.addCookie(telephoneCookie);
                response.addCookie(passwordCookie);
            }
            //将用户信息存储在session中
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
            String msg="账户密码不匹配";
            HttpSession session = request.getSession();
            session.setAttribute("msg",msg);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    //注册
    public void regist(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //获取所有的请求参数map集合
        Map<String, String[]> map = request.getParameterMap();
        User user=new User();

        //注册转换器
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class clzz, Object o) {
                //生日类型单独处理
                Date birthday=null;
                if(o instanceof String){
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        //将日期解析成yyyy-MM-dd格式的日期类型
                        birthday = sdf.parse(request.getParameter("birthday"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return birthday;
            }
        }, Date.class);

        //BeanUtils工具类给user对象进行赋值
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //设置对象的uid
        user.setUid(CommonUtils.getUUID().replaceAll("-",""));

        //设置对象密码  MD5加密
        user.setPassword(MD5Utils.md5(request.getParameter("password")));

        //注册
        boolean flag = service.regist(user);
        if(flag){
            System.out.println("注册成功");
            HttpSession session = request.getSession();
            session.setAttribute("registFlag",flag);
            session.setAttribute("user",user);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("regist.jsp").forward(request,response);
        }
    }

    //用户手机号校验
    public void validateTelephone(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String telephone = request.getParameter("telephone");
        //校验手机号
        boolean flag = service.validateTelephone(telephone);
        //封装成json数据格式响应至客户端   json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);

    }

    //用户身份证号校验
    public void validatePerson_id(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String person_id = request.getParameter("person_id");
        System.out.println("进入方法内部");
        //校验身份证号
        boolean flag=false;
        try {
            flag= service.validatePerson_id(Long.parseLong(person_id));
        }catch (Exception e){

        }
        //封装成json数据格式响应至客户端   json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);
    }
    //用户邮箱校验
    public void validateEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        //校验手机号
        boolean flag = service.validateEmail(email);
        //json数据，设置编码集  麻烦不  用过滤器
        response.setContentType("text/html;charset=utf-8");
        //封装成json数据格式响应至客户端   json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);

    }


    //更新用户信息
    public void updateUser(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取所有的请求参数
        Map<String, String[]> map = request.getParameterMap();
        //获取原来用户信息
        HttpSession session = request.getSession();
        User user    = (User) session.getAttribute("user");
        //用户uid不变
       //注册转换器
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class clzz, Object o) {
                //生日类型单独处理
                Date birthday=null;
                if(o instanceof String){
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        //将日期解析成yyyy-MM-dd格式的日期类型
                        birthday = sdf.parse(request.getParameter("birthday"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return birthday;
            }
        }, Date.class);

        //BeanUtils工具类给user对象进行赋值
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


        //设置用户头像
        try {
            Part part = request.getPart("file");
            if(part!=null){
                String oldName = part.getHeader("content-disposition");
                if(oldName!=null && oldName.lastIndexOf(".")>0){
                    //上传
                    String newName =( UUID.randomUUID()).toString().replaceAll("-","") +
                            oldName.substring(oldName.lastIndexOf("."),oldName.length()-1);
                    //给Items对象传递图片信息
                    user.setUimage("/temp/"+newName);
                    //本地图片服务器传递图片信息
                    part.write("F:\\igeek\\5.JSP+Servlet\\temp\\"+newName);
                }else{
                    //未上传 根据身份证号码、密码获取原来用户的信息.不变

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }

        //更新
        boolean flag = service.updateUser(user);
        if(flag){
            //存储数据
            session.setAttribute("user",user);
            //请求转发，跳转到个人信息页面
            request.getRequestDispatcher("my_self.jsp").forward(request,response);

        }else{
            String msg="修改失败";
            request.setAttribute("msg",msg);
            //请求转发，跳转到个人信息页面
            request.getRequestDispatcher("edit_self.jsp").forward(request,response);
        }

    }

    //修改改密码
    public void updatePassword(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String pwd = request.getParameter("password");
        //对密码进行加密
        String password = MD5Utils.md5(pwd);
        //获取会话中存储的user对象
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        boolean flag = service.updatePassword(password, user.getUid());
        if(flag){
            String msg="修改密码成功,请重新登录！";
            request.setAttribute("msg",msg);
            //会话消除
            //重新登陆相当于登出
            logout(request,response);
        }else{
            String msg="修改密码失败！";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("edit_password.jsp");
        }

    }

    //查看个人信息
    public void viewMySelf(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user",user);
        request.getRequestDispatcher("my_self.jsp").forward(request,response);
    }

    //用户登出
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //销毁会话
        session.invalidate();

        //清楚Cookie
        Cookie usernameCookie = new Cookie("username", "");
        Cookie passwordCookie = new Cookie("password","");

        usernameCookie.setMaxAge(0);
        passwordCookie.setMaxAge(0);

        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);

        request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request,response);
    }


}
