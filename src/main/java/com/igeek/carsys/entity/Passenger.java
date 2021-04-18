package com.igeek.carsys.entity;

import java.util.Date;

/**
 * @Description 乘客实体类
 * @Author Lemon
 * @Date 2021/2/8 14:25
 */
public class Passenger {
    int pid;
    private String pName;
    private String pPerson_id;
    private String ptelephone;
    //乘车日期
    private Date pDate;
    //乘车车次
    private String pTicketId;


    public Passenger() {
    }

    public                     Passenger(String pName, String pPerson_id, String ptelephone, Date pDate, String pTicketId) {
        this.pName = pName;
        this.pPerson_id = pPerson_id;
        this.ptelephone = ptelephone;
        this.pDate = pDate;
        this.pTicketId = pTicketId;
    }

    public Passenger(int pid, String pName, String pPerson_id, String ptelephone, Date pDate, String pTicketId) {
        this.pid = pid;
        this.pName = pName;
        this.pPerson_id = pPerson_id;
        this.ptelephone = ptelephone;
        this.pDate = pDate;
        this.pTicketId = pTicketId;
    }

    /**
     * 获取
     * @return pName
     */
    public String getPName() {
        return pName;
    }

    /**
     * 设置
     * @param pName
     */
    public void setPName(String pName) {
        this.pName = pName;
    }

    /**
     * 获取
     * @return pPerson_id
     */
    public String getPPerson_id() {
        return pPerson_id;
    }

    /**
     * 设置
     * @param pPerson_id
     */
    public void setPPerson_id(String pPerson_id) {
        this.pPerson_id = pPerson_id;
    }

    /**
     * 获取
     * @return ptelephone
     */
    public String getPtelephone() {
        return ptelephone;
    }

    /**
     * 设置
     * @param ptelephone
     */
    public void setPtelephone(String ptelephone) {
        this.ptelephone = ptelephone;
    }

    /**
     * 获取
     * @return pDate
     */
    public Date getPDate() {
        return pDate;
    }

    /**
     * 设置
     * @param pDate
     */
    public void setPDate(Date pDate) {
        this.pDate = pDate;
    }

    /**
     * 获取
     * @return pTicketId
     */
    public String getPTicketId() {
        return pTicketId;
    }

    /**
     * 设置
     * @param pTicketId
     */
    public void setPTicketId(String pTicketId) {
        this.pTicketId = pTicketId;
    }

    public String toString() {
        return "Passenger{pName = " + pName + ", pPerson_id = " + pPerson_id + ", ptelephone = " + ptelephone + ", pDate = " + pDate + ", pTicketId = " + pTicketId + "}";
    }

    /**
     * 获取
     * @return pid
     */
    public int getPid() {
        return pid;
    }

    /**
     * 设置
     * @param pid
     */
    public void setPid(int pid) {
        this.pid = pid;
    }
}
