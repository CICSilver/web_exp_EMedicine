<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/11
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<%@include file="../JspHead/nav.jsp"%>
<div id="preloader">
    <div class="loader"></div>
</div>
<script type="text/javascript" src="<%=basePath%>/lib/js/pro-city.js"></script>
<div class="wrapper">
        <section class="sign-section">
            <div class="container">
                <div class="sign-content">
                    <%--标题--%>
                    <h2>
                        <span>注册</span>
                    </h2>
                    <%--注册表单行--%>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="sign-content-form">
                                <form id="register-form" action="register_deal.jsp" method="post">
                                    <div class="form-group">
                                        <label class="input-label" for="name">名称</label>
                                        <input name="userName" class="form-control" type="text" id="name" placeholder="想个好名字好吧">
                                        <span id="e_name"></span>
                                    </div>
                                    <div  class="form-group">
                                        <label   for="email">邮箱</label>
                                        <input name="userEmail" class="form-control" id="email" type="email" placeholder="找个常用邮箱吧">
                                        <span id="e_email"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneNumber">手机号</label>
                                        <input name="userPhoneNumber" class="form-control" type="text" id="phoneNumber" placeholder="手机号">
                                        <span id="e_phoneNumber"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="passwd"  >密码</label>
                                        <input name="userPasswd" class="form-control" id="passwd" type="password" placeholder="想一个够强的密码吧">
                                        <span id="e_passwd"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="repetPasswd"  >重复密码</label>
                                        <input name="passwd-repeat" id="repetPasswd" type="password" class="form-control" placeholder="重复一遍密码">
                                        <span id="e_repeat"></span>
                                    </div>
                                    <div class="form-col-province">
                                        <div class="form-group">
                                            <label for="province">居住省份</label>
                                            <select name="userProvince" id="province" class="form-control">
                                                <option value="">请选择省份</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-col-city">
                                        <div class="form-group">
                                            <label for="city">居住城市</label>
                                            <select name="userCity" id="city" class="form-control"></select>
                                        </div>
                                    </div>
                                    <%--提交按钮行--%>
                                    <div class="row">
                                        <div class="sign-footer">
                                            <input id="register" type="submit" class="btn sign-btn" value="注册"/>
                                            <p>已有帐号？<a href="login.jsp">立即登录</a> </p>
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
