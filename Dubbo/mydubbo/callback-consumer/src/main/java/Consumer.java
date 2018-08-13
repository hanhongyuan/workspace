import cn.com.sjfx.CallbackListener;
import cn.com.sjfx.CallbackService;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/*
 * Consumer class
 * @author zz
 * @date 2018-05-16
 */
public class Consumer {

    public static void main(String[] args) {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:consumer.xml");
        context.start();

        CallbackService callbackService = (CallbackService) context.getBean("callbackService");

        callbackService.addListener("111", new CallbackListener(){
            public void changed(String msg) {
                System.out.println("callback1:" + msg);
            }
        });

        callbackService.addListener("222", new CallbackListener(){
            public void changed(String msg) {
                System.out.println("callback2:" + msg);
            }
        });
        context.close();
    }
}
