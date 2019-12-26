package com.springmvc.dao;

import com.springmvc.entity.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MessageMapperTest {

    private ApplicationContext applicationContext;

    @Autowired
    private LoginMapper mapper;

    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        // 导入需要测试的
        mapper = applicationContext.getBean(LoginMapper.class);
    }

    @After
    public void tearDown() throws Exception {
    }

   // @Test
    public void insert() throws Exception {
        User user=new User();
        user.setUsername("lin");
        user.setPassword(123);

      /*  int result = mapper.;
        System.out.println(result);
        assert (result == 1);*/
    }
}