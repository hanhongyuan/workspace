package cn.com.sjfx;

/*
 * CallbackService class
 * @author zz
 * @date 2018-05-17
 */
public interface CallbackService {
    void addListener(String key, CallbackListener listener);
}
