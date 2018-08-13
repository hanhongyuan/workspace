package cn.com.sjfx.po;


import cn.com.sjfx.UserService;

import javax.validation.constraints.*;

import java.io.Serializable;
import java.util.Date;

/*
 * User class
 * @author zz
 * @date 2018-05-16
 */
public class User implements Serializable {

    @NotNull(groups = UserService.UpdateUser.class)
    private int id;

    @Size(min = 2, max = 4)
    private String username;// 用户姓名

    @Pattern(regexp = "^[M|F]?$")
    private String sex;// 性别

    @Past
    private Date birthday;// 生日


    private String address;// 地址

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", sex=" + sex
                + ", birthday=" + birthday + ", address=" + address + "]";
    }
}
