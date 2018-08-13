import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

/*
 * Provider class
 * @author zz
 * @date 2018-05-16
 */
public class Provider {
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("provider.xml");
        System.out.println(context.getDisplayName() + ": here");
        context.start();
        System.out.println("服务已经启动...");
        System.in.read();
    }
}
