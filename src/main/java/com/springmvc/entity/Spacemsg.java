package com.springmvc.entity;

import java.util.Date;

public class Spacemsg {
    private Date updateAt;

    private Date createTime;

    private Integer currentValue;

    private int id;

    @Override
    public String toString() {
        return "Spacemsg{" +
                "updateAt=" + updateAt +
                ", createTime=" + createTime +
                ", currentValue=" + currentValue +
                ", id=" + id +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(Integer currentValue) {
        this.currentValue = currentValue;
    }


}