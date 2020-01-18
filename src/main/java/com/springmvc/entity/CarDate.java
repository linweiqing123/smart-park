package com.springmvc.entity;

import java.util.Date;

public class CarDate {

    Date create_time;
    Date update_at;
    String current_value;

    @Override
    public String toString() {
        return "CarDate{" +
                "create_time=" + create_time +
                ", update_at=" + update_at +
                ", current_value='" + current_value + '\'' +
                '}';
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getCurrent_value() {
        return current_value;
    }

    public void setCurrent_value(String current_value) {
        this.current_value = current_value;
    }


}
