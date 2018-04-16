package com.bean;

import com.annotation.Column;
import com.annotation.Table;

@Table(tableName = "t_category")
public class CategoryBean {
    @Column(field = "category_id", type = "varchar(11)", primaryKey = true, defaultNull = false)
    private String id; //主键

    @Column(field = "category_name", type = "varchar(20)")
    private String name; //标题

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryBean{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
