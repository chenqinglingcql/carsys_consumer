package com.igeek.carsys.entity;

import java.sql.Timestamp;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/2/24 20:02
 */
public class New {
    private String new_title;
    private String new_content;
    private Timestamp new_date;
    private String new_type;

    public New() {
    }

    public New(String new_title, String new_content, Timestamp new_date, String new_type) {
        this.new_title = new_title;
        this.new_content = new_content;
        this.new_date = new_date;
        this.new_type = new_type;
    }

    /**
     * 获取
     * @return new_title
     */
    public String getNew_title() {
        return new_title;
    }

    /**
     * 设置
     * @param new_title
     */
    public void setNew_title(String new_title) {
        this.new_title = new_title;
    }

    /**
     * 获取
     * @return new_content
     */
    public String getNew_content() {
        return new_content;
    }

    /**
     * 设置
     * @param new_content
     */
    public void setNew_content(String new_content) {
        this.new_content = new_content;
    }

    /**
     * 获取
     * @return new_date
     */
    public Timestamp getNew_date() {
        return new_date;
    }

    /**
     * 设置
     * @param new_date
     */
    public void setNew_date(Timestamp new_date) {
        this.new_date = new_date;
    }

    /**
     * 获取
     * @return new_type
     */
    public String getNew_type() {
        return new_type;
    }

    /**
     * 设置
     * @param new_type
     */
    public void setNew_type(String new_type) {
        this.new_type = new_type;
    }

    public String toString() {
        return "New{new_title = " + new_title + ", new_content = " + new_content + ", new_date = " + new_date + ", new_type = " + new_type + "}";
    }
}
