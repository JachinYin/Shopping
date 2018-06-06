package com.jachin.shopping.test;

import com.jachin.shopping.po.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

@Component("test1")
public class Test1 {

    @Autowired
    private User user;

    public void setUser(User user) {
        this.user = user;
    }

    @Test
    public void test(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:spring.xml");
        user = (User) ioc.getBean("user");
        System.out.println("H");
        user.setName("Rose");
        System.out.println(user);
    }
}
