package com.springmvc.service;

import com.springmvc.entity.User;

public interface ILoginService {
    User findUser(String username,String password);
}
