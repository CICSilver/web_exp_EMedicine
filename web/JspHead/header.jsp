<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/4/29
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <% String path = request.getContextPath();
        String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
        String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%--boostrap引入--%>
    <%--核心css--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/lib/css/bootstrap.min.css">
    <%--JQuery的js--%>
    <script type="text/javascript" src="<%=basePath%>/lib/js/jquery-3.4.1.min.js"></script>
    <%--核心javascript--%>
    <script type="text/javascript" src="<%=basePath%>/lib/js/bootstrap.min.js"></script>
    <%--主题文件--%>
    <link rel="stylesheet" href="<%=basePath%>/lib/css/bootstrap-theme.css">
    <%--自定义css引入--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/lib/css/style.css">
    <%--自定义js引入--%>
    <script type="text/javascript" src="<%=basePath%>/lib/js/main.js"></script>
    <%--React引入--%>
    <script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
    <%--babel转码器引入--%>
    <script type="text/babel" src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <%--jsp标准标签库引入--%>


</html>
