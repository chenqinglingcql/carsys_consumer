package com.igeek.carsys.entity;

import java.util.Date;

/**
 * @Description 用户实体类
 * @Author Lemon
 * @Date 2021/2/5 20:11
 */
public class User {
    //用户id
    String uid;
    //昵称
    String username;
    //密码
    String password;
    //姓名
    String name;
    //身份证号码
    Long person_id;
    //邮箱
    String email;
    //联系方式
    String telephone;
    //生日
    Date birthday;
    //性别
    String sex;
    //头像
    String uimage;


    public User() {
    }

    public User(String uid, String username, String password, String name, Long person_id, String email, String telephone, Date birthday, String sex, String uimage) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.name = name;
        this.person_id = person_id;
        this.email = email;
        this.telephone = telephone;
        this.birthday = birthday;
        this.sex = sex;
        this.uimage = uimage;
    }

    /**
     * 获取
     * @return uid
     */
    public String getUid() {
        return uid;
    }

    /**
     * 设置
     * @param uid
     */
    public void setUid(String uid) {
        this.uid = uid;
    }

    /**
     * 获取
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return person_id
     */
    public Long getPerson_id() {
        return person_id;
    }

    /**
     * 设置
     * @param person_id
     */
    public void setPerson_id(Long person_id) {
        this.person_id = person_id;
    }

    /**
     * 获取
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取
     * @return telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置
     * @param telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 获取
     * @return birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取
     * @return uimage
     */
    public String getUimage() {
        return uimage;
    }

    /**
     * 设置
     * @param uimage
     */
    public void setUimage(String uimage) {
        this.uimage = uimage;
    }

    public String toString() {
        return "User{uid = " + uid + ", username = " + username + ", password = " + password + ", name = " + name + ", person_id = " + person_id + ", email = " + email + ", telephone = " + telephone + ", birthday = " + birthday + ", sex = " + sex + ", uimage = " + uimage + "}";
    }
}
