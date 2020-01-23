package com.springmvc.service;

import com.springmvc.entity.CarInfo;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ICarService {
    public void doCreate(CarInfo carInfo);

    public int updata(CarInfo carInfo);

    public List<CarInfo> findAll();

    public List<CarInfo> find();

    public void del(int id);

    public List<CarInfo> search(CarInfo carInfo);

    public CarInfo findById(int id);

    public List<CarInfo> searchchu(CarInfo carInfo);
}
