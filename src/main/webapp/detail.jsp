<%@ page import="com.service.ArticleService" %>
<%@ page import="com.bean.ArticleBean" %>
<%@ page import="com.bean.CategoryBean" %>
<%@ page import="com.service.CategoryService" %><%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/17
  Time: 下午2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    ArticleBean articleBean = ArticleService.getArticleByid(id);
    CategoryBean categoryBean = CategoryService.getCategoryById(articleBean.getCategoryId().toString());
    pageContext.setAttribute("article",articleBean);
    pageContext.setAttribute("category",categoryBean);
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .article .title {
            text-align: center;
            font-size: 28px;
            color: #565353;
            letter-spacing: 2px;
            margin-top:20px;
        }
        .article .light-font{
            font-size:14px;
            color:#666;
        }
        .article .info{
            font-size:14px;
            color:#3c3a3a;
        }
        .article .content p{
            text-indent:2em;
            margin-bottom:20px;
            font-family: 微软雅黑;
        }
    </style>
</head>
<body>
<div class="article">

    <!-- 头部页面 -->
    <%@include file="common/header.jsp" %>

    <div class="title">${article.name}</div>
    <div class="category">
        <span class="light-font">分类</span>
        <span class="info">${category.name}</span>
    </div>
    <div class="publicDate">
        <span class="light-font">发布时间：</span>
        <span class="info">${article.createTime}</span>
    </div>
    <hr/>
    <div class="content">
        ${article.content}
    </div>

    <div class='right mt32'>
        <div class='author'>
            <img src='${basePath}/static/img/1.jpg' class='header_pic' width='90' height='90' />
            作者：${article.author}
        </div>
    </div>

    <!-- 评论区 -->
    <div class='commentBox'>
        <textarea class="comment_input" id="commenttxt" placeholder="请输入评论信息(600)..." maxlength="600"></textarea>
        <input type="button" value="保存评论" class="button">
    </div>
    <div class='clearfix'></div>
    <br/><hr/>
    <div class='mb64' class="comment_list">
        <div class="comment_infor clearfix">
            <div style='border-bottom:1px solid #ccc' class="comment_word">
                <p style='border-bottom:20px solid #fff'>${comment.username}dwedewffrg 说：</p>
                <p class='mb32'>内容不错，感谢分享！</p>
            </div>
        </div>
    </div>

</div>
</body>
</html>
