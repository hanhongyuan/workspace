package cn.com.sjfx;

import cn.com.sjfx.po.User;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;

/*
 * UserService class
 * @author zz
 * @date 2018-05-16
 */
public interface UserService {

    @interface UpdateUser{}
    int insertUser(@NotNull User user);

    int updateUser(@NotNull User user);

    int deleteUser(@Min(100)int id);

    User findByID(int id);

    List<User> findByName(@NotNull String name);
}
