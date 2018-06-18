<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/16
  Time: 上午1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 公共库 -->
<%@include file="taglib.jsp" %>
<style type="text/css">
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
<div class="header">
    <div class='logo'>原创文字</div>
    <ul style="display: inline">
        <li class='first'><a href="javascript:void(0)">首页</a></li>
        <li><a href="javascript:void(0)">原创故事</a></li>
        <li><a href="javascript:void(0)">热门专题</a></li>
        <li><a href="javascript:void(0)">欣赏美文</a></li>
        <li><a href="javascript:void(0)">赞助</a></li>
    </ul>

    <div class='login'>
        <c:choose>
            <c:when test="${empty sessionScope.username}">
                <span><a href="login.jsp">登陆</a></span>
                <span>|</span>
                <span><a href="javascript:void(0)">注册</a></span>
            </c:when>
            <c:otherwise>
                <span><a href="javascript:void(0)">欢迎您,${sessionScope.username}</a></span>
                <span>|</span>
                <span><a href="${basePath}/controller/loginoutController.jsp">登出</a></span>
            </c:otherwise>
        </c:choose>
    </div>

</div>