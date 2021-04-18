package com.igeek.carsys.dao;

import com.igeek.carsys.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 到
 * @Author Lemon
 * @Date 2021/2/5 20:11
 */
public class BaseDao<T> {

    QueryRunner runner=new QueryRunner();
    //查询单条信息
    public T getBean(String sql,Class<T> clazz,Object...params) throws SQLException {
        return (T) runner.query(DataSourceUtils.getConnection(), sql, new BeanHandler<>(clazz), params);
    }

    //查询多条信息
    public List<T> getBeanList(String sql,Class<T> clazz,Object...params) throws SQLException {
        return runner.query(DataSourceUtils.getConnection(),sql,new BeanListHandler<>(clazz),params);
    }

    //增删改
    public int update(String sql,Object...params) throws SQLException {
        int i = runner.update(DataSourceUtils.getConnection(), sql, params);
        return i;
    }

    //获取单个值
    public Object getSinglevalue(String sql,Object...params) throws SQLException {
        return  runner.query(DataSourceUtils.getConnection(), sql, new ScalarHandler(), params);

    }
}
