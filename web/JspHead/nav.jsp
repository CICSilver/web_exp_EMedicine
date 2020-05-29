<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/14
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<html>
<body>
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header-top-left">
                        <ul>
                            <li><i class="glyphicon glyphicon-home"></i><a class="nav-href" href="<%=basePath%>">首页</a> </li>
                            <li>我很可爱</li>
                            <li>请给我钱</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header-top-right">
                        <ul>
                            <li><i class="glyphicon glyphicon-shopping-cart"><a href="#"><span class="nav-href">购物车</span></a></i></li>
                            <li class="dropdown">
                                <a class="nav-href" href="#" data-toggle="dropdown" aria-expanded="true">我的<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a class="nav-href" href="<%=basePath%>/view/cart_page.jsp">购物车</a></li>
                                    <li><a class="nav-href" href="#">优惠券</a></li>
                                    <li><a class="nav-href" href="<%=basePath%>/view/logout_deal.jsp">退出登录</a> </li>
                                </ul>
                            </li>
                            <%--仅用于JSTL尝试，内嵌java也可行--%>
                            <c:choose>
                                <c:when test="${sessionScope.userName==null}">
                                    <li><a class="nav-href" href="<%=basePath%>/view/register.jsp">登录/注册</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><%=session.getAttribute("userName")%></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
