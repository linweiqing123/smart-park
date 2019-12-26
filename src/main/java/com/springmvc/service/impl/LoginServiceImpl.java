package com.springmvc.service.impl;

import com.springmvc.dao.LoginMapper;
import com.springmvc.entity.User;
import com.springmvc.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginServiceImpl implements ILoginService {
    @Autowired
    private LoginMapper loginMapper;

    @Override
    public User findUser(User user) {
        return loginMapper.findUser(user);
    }
}
