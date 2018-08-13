package cn.com.sjfx.impl;

import cn.com.sjfx.UserService;
import cn.com.sjfx.po.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/*
 * UserServiceImpl class
 * @author zz
 * @date 2018-05-16
 */
public class UserServiceImpl implements UserService {
    // mybatis配置文件
    String resource = "SqlMapConfig.xml";
    public int insertUser(User user) {
        SqlSession sqlSession =  getSession();

        // 插入用户对象
        sqlSession.insert("test.insertUser", user);
        // 提交事务
        sqlSession.commit();

        // 获取用户信息主键
        int id = user.getId();
        // 关闭会话
        sqlSession.close();
        return id;
    }

    public int updateUser(User user) {
        SqlSession sqlSession =  getSession();
        // 更新用户信息

        sqlSession.update("test.updateUser", user);

        // 提交事务
        sqlSession.commit();

        // 关闭会话
        sqlSession.close();
        return 1;
    }

    public int deleteUser(int id) {
        SqlSession sqlSession =  getSession();

        // 传入id删除 用户
        sqlSession.delete("test.deleteUser", id);

        // 提交事务
        sqlSession.commit();

        // 关闭会话
        sqlSession.close();
        return 1;
    }

    public User findByID(int id) {
        SqlSession sqlSession =  getSession();
        // selectOne查询出一条记录
        User user = sqlSession.selectOne("test.findUserById", id);
        // 释放资源
        sqlSession.close();
        return user;
    }

    public List<User> findByName(String name) {
        SqlSession sqlSession =  getSession();
        // list中的user和映射文件中resultType所指定的类型一致
        List<User> list = sqlSession.selectList("test.findUserByName", name);

        sqlSession.close();

        return list;
    }

    private SqlSession getSession(){
        // 得到配置文件流
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        // 创建会话工厂，传入mybatis的配置文件信息
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder()
                .build(inputStream);

        // 通过工厂得到SqlSession
        return sqlSessionFactory.openSession();
    }
}
