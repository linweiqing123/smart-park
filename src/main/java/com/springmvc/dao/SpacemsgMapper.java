package com.springmvc.dao;

import com.springmvc.entity.Spacemsg;

import java.util.List;

public interface SpacemsgMapper {
    int insert(Spacemsg record);

    int insertSelective(Spacemsg record);

    List<Spacemsg> find();
}