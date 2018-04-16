package com.service;

import com.bean.CategoryBean;
import com.util.DataBaseUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CategoryService {

    public static List<CategoryBean> getCategoryList(){
        String sql = "select * from t_category";
        List<Map<String,Object>> categoryMaps = DataBaseUtils.queryForList(sql);

        List<CategoryBean> categoryBeans = new ArrayList<CategoryBean>();

        for (Map<String, Object>categoryMap : categoryMaps){
            CategoryBean categoryBean = DataBaseUtils.mapClassWithMap(CategoryBean.class,categoryMap);
            categoryBeans.add(categoryBean);
        }

        return categoryBeans;
    }
}
