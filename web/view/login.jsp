<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/13
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<%@include file="../JspHead/nav.jsp"%>
<div id="preloader">
    <div class="loader"></div>
</div>
<div class="wrapper">
    <section class="sign-section">
        <div class="container">
            <div class="sign-content">
                <%--标题--%>
                <h2>
                    <span>登录</span>
                </h2>
                <%--注册表单行--%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="sign-content-form">
                            <form action="login_deal.jsp" method="post">
                                <div class="form-group">
                                    <label for="email">邮箱账号</label>
                                    <input name="userEmail" class="form-control" type="email" id="email" placeholder="邮箱账号">
                                </div>

                                <div  class="form-group">
                                    <label   for="passwd">密码</label>
                                    <input name="userPasswd" class="form-control" id="passwd" type="password" placeholder="请输入您的密码">
                                </div>
                                <%--功能按钮行--%>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="checkbox-list">
                                            <ul class="unstyled centered">
                                                <li>
                                                    <input class="styled-checkbox" id="styled-checkbox" type="checkbox" value="value2">
                                                    <label for="styled-checkbox">自动登录</label>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="glyphicon glyphicon-hand-right"></i>找回密码</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <%--提交按钮行--%>
                                <div class="row">
                                    <div class="sign-footer">
                                        <input type="submit" class="btn sign-btn" value="登录">
                                        <p>没有帐号？<a href="register.jsp">立即注册</a> </p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div>
    </section>
</div>
</body>
</html>
