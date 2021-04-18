package com.igeek.carsys.service;

import com.igeek.carsys.dao.UserDao;
import com.igeek.carsys.entity.User;
import com.igeek.carsys.utils.DataSourceUtils;

import java.sql.SQLException;

/**
 * @Description 用户服务层
 * @Author Lemon
 * @Date 2021/2/5 20:57
 */
public class UserService {
    private UserDao dao=new UserDao();
    //通过手机号和密码进行登录
    public User login(String telelphone,String password){
        User user = null;
        try {
            user = dao.selectOne(telelphone, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //通过身份证号码和密码进行登录
    public User login(Long person_id,String password){
        User user = null;
        try {
            user = dao.selectOne(person_id, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //注册
    public boolean regist(User user){
        try {
            return dao.insert(user)>0? true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //校验改手机号是否已经注册
    public boolean validateTelephone(String telephone){
        try {
            Long count = dao.selectOneByTelephone(telephone);
            return count>0? true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //校验身份证号是否已经注册
    public boolean validatePerson_id(Long person_id){
        try {
            Long count = dao.selectOneByPerson_id(person_id);
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //校验改邮箱号是否已经注册
    public boolean validateEmail(String email){
        try {
            Long count = dao.selectOneByEmail(email);
            return count>0? true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //修改用户信息(除密码外的信息)
    public boolean updateUser(User user){
        int i = 0;
        try {
            i = dao.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }
    //修改密码
    public boolean updatePassword(String password,String uid){
        int i = 0;
        try {
            i = dao.updatrePassword(password, uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }

    //通过用户id查询信息
    public User selectOne(String uid){
        User user = null;
        try {
            user = dao.selectOne(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
