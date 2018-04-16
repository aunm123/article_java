package com.service;

import com.bean.ArticleBean;
import com.util.DataBaseUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ArticleService {
    public static List<ArticleBean> getArticleListWithCategoryid(String categoryid){
        String sql = "select * from t_article where category_id = ?";
        List<Map<String,Object>> articleMaps = DataBaseUtils.queryForList(sql,categoryid);

        List<ArticleBean> articleBeans = new ArrayList<ArticleBean>();

        for (Map<String, Object>articleMap : articleMaps){
            ArticleBean articleBean = DataBaseUtils.mapClassWithMap(ArticleBean.class,articleMap);
            articleBeans.add(articleBean);
        }

        return articleBeans;
    }
}
