package com.springmvc.dao;

import com.springmvc.entity.User;

public interface LoginMapper {


    User findUser(String username, String password);

}
