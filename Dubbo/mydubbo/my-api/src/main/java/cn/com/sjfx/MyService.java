package cn.com.sjfx;

import cn.com.sjfx.po.User;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/*
 * MyService interface
 * @author zz
 * @date 2018-05-16
 */
public interface  MyService {
    String saySomthings(@NotNull String words);

    String printDate();

    String printUser(User user);

    String asyncMethod(@Min(2000) int sleepTime);
}
