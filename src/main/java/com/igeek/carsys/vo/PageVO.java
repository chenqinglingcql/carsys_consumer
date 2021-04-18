package com.igeek.carsys.vo;

import java.util.Date;
import java.util.List;

/**
 * @Description 分页
 * @Author Lemon
 * @Date 2021/2/7 14:19
 */
public class PageVO<T> {
    //查询条件
    private String depart_city;
    private String dest_city;
    private Date depart_date;
    //当前页
    private int pageNow;
    //总页数
    private int myPages;
    //数据
    private List<T> list;


    public PageVO() {
    }

    public PageVO(String depart_city, String dest_city, Date depart_date, int pageNow, int myPages, List<T> list) {
        this.depart_city = depart_city;
        this.dest_city = dest_city;
        this.depart_date = depart_date;
        this.pageNow = pageNow;
        this.myPages = myPages;
        this.list = list;
    }

    /**
     * 获取
     * @return depart_city
     */
    public String getDepart_city() {
        return depart_city;
    }

    /**
     * 设置
     * @param depart_city
     */
    public void setDepart_city(String depart_city) {
        this.depart_city = depart_city;
    }

    /**
     * 获取
     * @return dest_city
     */
    public String getDest_city() {
        return dest_city;
    }

    /**
     * 设置
     * @param dest_city
     */
    public void setDest_city(String dest_city) {
        this.dest_city = dest_city;
    }

    /**
     * 获取
     * @return depart_date
     */
    public Date getDepart_date() {
        return depart_date;
    }

    /**
     * 设置
     * @param depart_date
     */
    public void setDepart_date(Date depart_date) {
        this.depart_date = depart_date;
    }

    /**
     * 获取
     * @return pageNow
     */
    public int getPageNow() {
        return pageNow;
    }

    /**
     * 设置
     * @param pageNow
     */
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    /**
     * 获取
     * @return myPages
     */
    public int getMyPages() {
        return myPages;
    }

    /**
     * 设置
     * @param myPages
     */
    public void setMyPages(int myPages) {
        this.myPages = myPages;
    }

    /**
     * 获取
     * @return list
     */
    public List<T> getList() {
        return list;
    }

    /**
     * 设置
     * @param list
     */
    public void setList(List<T> list) {
        this.list = list;
    }

    public String toString() {
        return "PageVO{depart_city = " + depart_city + ", dest_city = " + dest_city + ", depart_date = " + depart_date + ", pageNow = " + pageNow + ", myPages = " + myPages + ", list = " + list + "}";
    }
}
