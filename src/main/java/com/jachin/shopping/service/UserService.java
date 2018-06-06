package com.jachin.shopping.service;

import com.jachin.shopping.mapper.UserMapper;
import com.jachin.shopping.po.User;
import com.jachin.shopping.po.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserService {

    private static ApplicationContext ioc =
            new ClassPathXmlApplicationContext("classpath:spring.xml");

    @Autowired
    private UserMapper userMapper = (UserMapper) ioc.getBean("userMapper");

    // 用户登陆验证
    public int login(User user){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andAccountEqualTo(user.getAccount());
        criteria.andPasswordEqualTo(user.getPassword());
        List<User> list = userMapper.selectByExample(userExample);
         if(list.isEmpty())
            return -1;
        return list.get(0).getUserid();
    }

    // 用户查询信息
    public User getUserInfo(int id){
        return userMapper.selectByPrimaryKey(id);
    }

    // 用户修改信息
    public void editUserInfo(User user){
        userMapper.updateByPrimaryKeySelective(user);
    }
}
