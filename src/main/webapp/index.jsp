<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/16
  Time: 上午1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath = null;
    if (port == 80) {
    }
%>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <title>Title</title>

    <style>
        *{
            padding: 0 ;
            margin: 0 ;
        }
        .header {
            height: 72px ;
            background: #458fce ;
        }
        .header .logo {
            color: #fff ;
            line-height: 72px ;
            font-size: 30px ;
            margin-left: 20px ;
            display:inline-block ;
            font-weight:500 ;
            float: left;
        }
        ul li {
            list-style: none ;
        }
        .header ul li {
            float: left ;
        }
        .header ul li.first {
            margin-left: 30px ;
        }

        .header ul li {
            float: left ;
            color: #fff ;
            display: inline-block ;
            width: 112px ;
            height: 72px ;
            text-align: center ;
            line-height:72px ;
            cursor: pointer ;
        }
        a {
            color: #fff ;
            text-decoration: none ;
        }
        .header ul li:hover {
            background:#74b0e2 ;
        }
        .header .login {
            float: right ;
            color: #fff ;
            line-height: 72px ;
            margin-right: 20px ;
        }
        .header ul li.first {
            margin-left: 30px ;
            background:#74b0e2 ;
        }
    </style>
</head>
<body>
    <!-- 头部页面 -->
    <%@include file="common/header.jsp" %>

    <!-- 登录页面 -->
    <%@include file="login.jsp" %>

</body>
</html>
