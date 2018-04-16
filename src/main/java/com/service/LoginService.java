package com.service;

import com.bean.UserBean;
import com.util.DataBaseUtils;

public class LoginService {
    public static UserBean getUser(String username){
        String sql = "select * from t_user where username = ?";
        UserBean userBean = DataBaseUtils.queryForBean(UserBean.class,sql,username);
        if(userBean == null){
            return null;
        }
        return userBean;
    }

}
