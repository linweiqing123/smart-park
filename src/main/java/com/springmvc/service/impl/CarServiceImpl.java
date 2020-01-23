package com.springmvc.service.impl;

import com.springmvc.dao.CarMapper;
import com.springmvc.entity.CarInfo;
import com.springmvc.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class CarServiceImpl implements ICarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public void doCreate(CarInfo carInfo){
        carMapper.doCreate(carInfo);
    }

    @Override
    public int updata(CarInfo carInfo){
        return carMapper.updata(carInfo);
    }

    @Override
    public List<CarInfo> findAll(){
        return carMapper.findAll();
    }

    @Override
    public List<CarInfo> find(){
        return carMapper.find();
    }
    @Override
    public void del(int id){
        carMapper.del(id);
    }
    @Override
    public List<CarInfo> search(CarInfo carInfo){
        return carMapper.search(carInfo);
    }

    @Override
    public CarInfo findById(int id) {
        return carMapper.findById(id);
    }

    @Override
    public List<CarInfo> searchchu(CarInfo carInfo){
        return carMapper.searchchu(carInfo);
    }

}
