package com.igeek.carsys.controller;

import java.util.ArrayList;

/**
 * @Description TODO
 * @Author Lemon
 * @Date 2021/3/23 19:33
 */
public class Test {
    public static void main(String[] args) {
        String[] arr=new String[]{"aaa","bbbb","ccc"};
        String s = "hjhhh";
        for (String s1 : arr) {
            if (s1.equals(s)){
                System.out.println("包含");
                return;
            }
        }

        int index = arr[0].indexOf("aa");
        System.out.println(index);


    }
}
