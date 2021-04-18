package com.igeek.carsys.service;

import com.igeek.carsys.dao.ProblemDao;
import com.igeek.carsys.entity.Problem;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 常见问题服务层
 * @Author Lemon
 * @Date 2021/2/16 2:18
 */
public class ProblemService {
    private ProblemDao dao=new ProblemDao();
    //查询所有的问题
    public PageVO<Problem> viewAll(int pageNow){
        PageVO<Problem> vo = null;
        try {
            //计算起始值
            int begin=(pageNow-1)*8;
            //查询所有订单数据
            List<Problem> list = dao.getAllProblems(begin);
            //所有订单的个数
            Long count = dao.count();
            //订单总页数
            int mypages=(int)(count%8==0?count/8:Math.ceil(count/8.0));
            //封装pageVo
            vo=new PageVO<>(null,null,null,pageNow,mypages,list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //根据问题的分类进行查询
    public PageVO<Problem> viewProblemByCategory(String problem_category,int pageNow){
        PageVO<Problem> vo = null;
        try {
            //计算起始值
            int begin=(pageNow-1)*8;
            //查询所有订单数据
            List<Problem> list = dao.getProblemByCategory(problem_category,begin);
            //所有订单的个数
            Long count = dao.count(problem_category);
            //订单总页数
            int mypages=(int)(count%8==0?count/8:Math.ceil(count/8.0));
            //封装pageVo
            vo=new PageVO<>(null,null,null,pageNow,mypages,list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //根据问题标题进行模糊查询
    public List<Problem> viewProblemByTitle(String problem_title){
        List<Problem> list = null;
        try {
            list = dao.getProblemByTitle(problem_title);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
