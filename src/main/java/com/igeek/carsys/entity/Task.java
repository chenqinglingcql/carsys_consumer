package com.igeek.carsys.entity;

import java.util.TimerTask;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/20 15:31
 */
public class Task extends TimerTask {
    public Task(){

    }
    @Override
    public void run() {
        System.out.println("-----------开始运行----------");

    }
}
