<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/16
  Time: 下午8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("username");
    session.invalidate();
    response.sendRedirect("http://localhost:8080/login.jsp");
%>
