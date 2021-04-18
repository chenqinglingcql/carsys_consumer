package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Problem;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 常见问题工具类
 * @Author Lemon
 * @Date 2021/2/16 2:09
 */
public class ProblemDao extends BaseDao<Problem> {
    //查询所有的常见问题
    public List<Problem> getAllProblems(int begin) throws SQLException {
        String sql="select * from problems limit ?,8";
        List<Problem> list = this.getBeanList(sql, Problem.class,begin);
        return list;
    }

    //统计订单个数
    public Long count() throws SQLException {
        String sql="select count(*) from problems";
        Long count = (Long) this.getSinglevalue(sql);
        return count;
    }

    //根问题分类查找问题
    public List<Problem> getProblemByCategory(String problem_category,int begin) throws SQLException {
        String sql="select * from problems where problem_category=? limit ?,8";
        List<Problem> list = this.getBeanList(sql, Problem.class, problem_category,begin);
        return list;
    }
    //统计订单个数
    public Long count(String category) throws SQLException {
        String sql="select count(*) from problems where problem_category=?";
        Long count = (Long) this.getSinglevalue(sql,category);
        return count;
    }

    //根据问题标题模糊查询
    public List<Problem> getProblemByTitle(String problem_titel) throws SQLException {
        String sql="select * from problems where problem_title like('%',?,'%')";
        List<Problem> list = this.getBeanList(sql, Problem.class, problem_titel);
        return list;
    }
}
