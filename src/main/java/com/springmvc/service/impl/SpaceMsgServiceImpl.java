package com.springmvc.service.impl;


import com.springmvc.dao.SpacemsgMapper;
import com.springmvc.entity.Spacemsg;
import com.springmvc.service.SpaceMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SpaceMsgServiceImpl implements SpaceMsgService {
    @Autowired
    private SpacemsgMapper spacemsgMapper;
    @Override
    public List<Spacemsg> find() {
        return spacemsgMapper.find();
    }
}
