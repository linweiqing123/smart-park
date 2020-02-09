package com.springmvc.service;

import com.springmvc.entity.Spacemsg;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SpaceMsgService {
    public List<Spacemsg> find();
}
