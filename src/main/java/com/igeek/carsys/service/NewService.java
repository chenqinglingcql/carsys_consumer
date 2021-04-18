package com.igeek.carsys.service;

import com.igeek.carsys.dao.NewDao;
import com.igeek.carsys.entity.New;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/2/24 20:07
 */
public class NewService {
    private NewDao dao=new NewDao();
    public New viewOne(String new_title){
        New news = null;
        try {
            news = dao.selectOne(new_title);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    //查看所有新闻
    public PageVO<New> viewAllNews(int pageNow){
        PageVO<New> vo=null;
        //计算起始值
        int begin=(pageNow-1)*10;
        //查询数据
        try {
            List<New> list = dao.selecAll(begin);
            //计算总行数
            int counts = dao.selectAllCounts();
            //计算总页数
            int myPages=(int)(counts%10==0?counts/10:Math.ceil(counts/10.0));
            //封装vo
            vo=new PageVO<>(null,null,null,pageNow,myPages,list);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vo;

    }
}
