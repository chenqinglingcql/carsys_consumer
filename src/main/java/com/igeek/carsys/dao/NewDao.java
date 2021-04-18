package com.igeek.carsys.dao;

import com.igeek.carsys.entity.New;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 新闻工具类
 * @Author Lemon
 * @Date 2021/2/24 20:04
 */
public class NewDao extends  BaseDao<New> {
    //根据新闻标题和新闻类别查找新闻
    public New selectOne(String new_title) throws SQLException {
        String sql="select * from news where new_title=?";
        New news = this.getBean(sql, New.class, new_title);
        return news;
    }

    //查看所有
    public List<New> selecAll(int begin) throws SQLException {
        String sql="select * from news limit ?,10";
        List<New> beanList = this.getBeanList(sql, New.class,begin);
        return beanList;
    }

    //查看所有新闻的数量
    public int selectAllCounts() throws SQLException {
        String sql="select count(*) from news";
        Long couts = (Long) this.getSinglevalue(sql);
        return couts.intValue();

    }
}
