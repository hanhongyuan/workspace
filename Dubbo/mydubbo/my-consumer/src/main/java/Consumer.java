import cn.com.sjfx.MyService;
import cn.com.sjfx.UserService;
import cn.com.sjfx.po.User;
import com.alibaba.dubbo.rpc.RpcContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

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
        MyService myService = context.getBean(MyService.class);
        System.out.println("consumer");
        System.out.println(myService.saySomthings("hello"));

        Instant start =Instant.now();
        // 此调用会立即返回null
        myService.asyncMethod(5000);
        // 拿到调用的Future引用，当结果返回后，会被通知和设置到此Future
        Future<String> future1 = RpcContext.getContext().getFuture();

        // 此调用会立即返回null
        myService.asyncMethod(3000);
        // 拿到调用的Future引用，当结果返回后，会被通知和设置到此Future
        Future<String> future2 = RpcContext.getContext().getFuture();

        // 此调用会立即返回null
        myService.asyncMethod(3000);
        // 拿到调用的Future引用，当结果返回后，会被通知和设置到此Future
        Future<String> future3 = RpcContext.getContext().getFuture();
        try {
            System.out.println(future1.get());
            System.out.println(future2.get());
            System.out.println(future3.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        Instant end =Instant.now();

        System.out.println("Use time :" + Duration.between( start, end).getSeconds());


        System.out.println(myService.printDate());
        User user =new User();
        user.setUsername("王小明");
        user.setSex("M");
        user.setAddress("你说哪里就是哪里！");
        user.setBirthday(new Date());

        System.out.println(myService.printUser(user));
        System.out.println(myService.printDate());
        for (int i=0;i<3;i++) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(myService.printDate());
        }
        context.close();
    }
}
