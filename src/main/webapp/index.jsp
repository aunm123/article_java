<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.bean.ArticleBean" %>
<%@ page import="com.service.ArticleService" %>
<%@ page import="com.bean.CategoryBean" %>
<%@ page import="com.service.CategoryService" %><%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/16
  Time: 上午1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <title>Title</title>

    <style>

        .category {
            margin-top: 10px;
            margin-bottom:20px;
        }
        .category .title {
            margin-bottom: 10px;
            margin-top: 30px;
            border-bottom: 1px solid #cac5c5;
            height: 30px;
            text-indent:1em;
            font-size:18px;
            color:#666;
        }
        .category .items {
            margin-left:10px;
        }
        .category .items .item {
            width: 160px;
            height: 231px;
            background: #ccc;
            margin: 20px;
            float: left;
        }
        .category .items .item div {
            text-align:center;
        }
        .item-banner {
            background: #666;
            color: #FFF;
            height: 67%;
        }
        .item-header {
            font-size: 10px;
            line-height: 40px;
            padding: 7px;
        }
        .item-name{
            margin-top: 10px;
            font-size: 17px;
        }
        .item-author {
            text-align: right!important;
            margin-right: 22px;
            font-size: 12px;
            margin-top: 20px;
        }
        .item-description {
            font-size: 12px;
            text-align: right!important;
            margin-right: 20px;
            margin-top: 22px;
        }
    </style>
    <script type="text/javascript">
        function detail(id) {
            var a = document.createElement('a');
            a.href = "detail.jsp?id=" + id;
            console.log(a)
            a.target = '_new';
            a.click();
        }
    </script>
</head>
<body>
    <!-- 头部页面 -->
    <%@include file="common/header.jsp" %>

    <div class='h600' style='border:1px solid #ccc'>

        <%
            List<CategoryBean> allCategory  = CategoryService.getCategoryList();
            pageContext.setAttribute("allCategory",allCategory);
        %>

        <c:forEach items="${allCategory}" var="category">
            <div class='category'>
                <div class='title'>${category.name}</div>
                <ul class='items'>
                    <%
                        CategoryBean categoryBean = (CategoryBean) pageContext.getAttribute("category");
                        List<ArticleBean> allArticle  = ArticleService.getArticleListWithCategoryid(categoryBean.getId());
                        pageContext.setAttribute("allArticle",allArticle);
                    %>

                    <c:forEach items="${allArticle}" var="article">
                        <li class='item' onclick="detail('${article.id}');">
                            <div class='item-banner'>
                                <div class='item-header'>${article.header}</div>
                                <div class='item-name'>${article.name}</div>
                                <div class='item-author'>@${article.author} 著</div>
                            </div>
                            <div class='item-description'>${article.description}</div>
                        </li>
                    </c:forEach>
                    <div style="clear: both"></div>
                </ul>
            </div>
        </c:forEach>

    </div>
</body>
</html>
