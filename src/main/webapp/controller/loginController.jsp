<%@ page import="com.util.StringUtils" %>
<%@ page import="com.service.LoginService" %>
<%@ page import="com.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/16
  Time: 下午7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
        out.print("-1"); //错误码 -1
    }else {
        UserBean user = LoginService.getUser(username);
        if (user!=null){
            if (username.equals(user.getUsername())&&password.equals(user.getPassword())){
                out.print("1");
                session.setAttribute("user",user);
                session.setAttribute("username", user.getUsername());
                return;
            }
        }
    }
    out.print("-3");
%>
