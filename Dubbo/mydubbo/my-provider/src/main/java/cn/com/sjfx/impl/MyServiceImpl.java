package cn.com.sjfx.impl;

import cn.com.sjfx.MyService;
import cn.com.sjfx.po.User;

import java.util.Date;
import java.util.Random;

/*
 * MyServiceImpl class
 * @author zz
 * @date 2018-05-16
 */
public class MyServiceImpl implements MyService {

    public String saySomthings(String words) {
        return "You said :" + words + ". at : " + new Date();
    }

    public String printDate() {
        return new Date().toString();
    }

    public String printUser(User user) {
        return user.toString();
    }

    public String asyncMethod(int sleepTime) {
        Date start =new Date();
        try {
            Thread.sleep(sleepTime);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Date end =new Date();
        return "You start at : ["+start+"] end at : ["+end+"]";
    }
}
