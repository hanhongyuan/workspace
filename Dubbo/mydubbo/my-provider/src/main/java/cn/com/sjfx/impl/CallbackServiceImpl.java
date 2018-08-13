package cn.com.sjfx.impl;

import cn.com.sjfx.CallbackListener;
import cn.com.sjfx.CallbackService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/*
 * CallbackServiceImpl class
 * @author zz
 * @date 2018-05-17
 */
public class CallbackServiceImpl implements CallbackService {

    public void addListener(String key, CallbackListener listener) {
        listener.changed(getChanged(key)); // 发送变更通知
    }

    private String getChanged(String key) {
        System.out.println("Old key is :" + key);
        return "Changed: " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
