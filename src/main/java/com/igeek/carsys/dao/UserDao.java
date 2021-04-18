package com.igeek.carsys.dao;

import com.igeek.carsys.entity.User;

import java.sql.SQLException;
import java.util.Date;

/**
 * @Description 用户工具类
 * @Author Lemon
 * @Date 2021/2/5 20:46
 */
public class UserDao extends BaseDao<User> {


    //通过手机号密码查询数据
    public User selectOne(String telephone,String password) throws SQLException {
        String sql="select * from users where telephone=? and password=?";
        User user = this.getBean(sql, User.class, telephone, password);
        return  user;

    }
    //通过身份证号密码查询数据
    public User selectOne(Long person_id,String password) throws SQLException {
        String sql="select * from where person_id=? and password=?";
        User user = this.getBean(sql, User.class, person_id, password);
        return user;
    }

    //增加
    public int insert(User user) throws SQLException {
        String sql="insert into users values(?,?,?,?,?,?,?,?,?,?)";
        int i = this.update(sql, user.getUid(), user.getUsername(),
                user.getPassword(), user.getName(), user.getPerson_id(),
                user.getEmail(), user.getTelephone(), user.getBirthday(), user.getSex(), "img/touxiang.jpg");
        return i;
    }

    //通过电话号码查询信息
    public Long selectOneByTelephone(String telephone) throws SQLException {
        String sql="select count(*) from users where telephone=?";
        Long count = (Long)this.getSinglevalue(sql,telephone);
        return count;
    }

    //通过身份证号码查询信息
    public Long selectOneByPerson_id(Long person_id) throws SQLException {
        String sql="select count(*) from users where person_id=?";
        Long count =(Long) this.getSinglevalue(sql, person_id);
        return count;
    }

    //通过身份证号码查询信息
    public Long selectOneByEmail(String  email) throws SQLException {
        String sql="select count(*) from users where email=?";
        Long count =(Long) this.getSinglevalue(sql, email);
        return count;
    }

    //修改个人信息（除密码以外的个人信息）
    public int updateUser(User user) throws SQLException {
        String sql="update users set username=? , name=? ,  person_id=? , email=? , telephone=? , birthday=? , sex=? , uimage=? where uid=?";
        int i = this.update(sql, user.getUsername(),user.getName(),
                user.getPerson_id(), user.getEmail(), user.getTelephone(), user.getBirthday(),
                user.getSex(), user.getUimage(),user.getUid());
        return i;

    }

    //修改登陆密码
    public int updatrePassword(String  password,String uid) throws SQLException {
        String sql="update users set password=? where uid=?";
        int i = this.update(sql, password, uid);
        return i;

    }

    //通过用户id查询信息
    public User selectOne(String uid) throws SQLException {
        String sql="select * from users where uid=?";
        User user = this.getBean(sql, User.class, uid);
        return user;
    }



}
