import cn.com.sjfx.MyService;
import cn.com.sjfx.UserService;
import cn.com.sjfx.po.User;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/*
 * Consumer class
 * @author zz
 * @date 2018-05-16
 */
public class Consumer {

    public static void main(String[] args) {
        //测试常规服务
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("consumer.xml");
        context.start();
        System.out.println("consumer start");
        User user =new User();
        user.setUsername("王小明");
        user.setSex("男");
        user.setAddress("你说哪里就是哪里！");
        user.setBirthday(new Date());

        UserService userService = context.getBean(UserService.class);

        int insertID = userService.insertUser(user);

        System.out.println("Inserted data id="+insertID);

        System.out.println(userService.findByID(insertID).toString());
        context.close();
    }
}
