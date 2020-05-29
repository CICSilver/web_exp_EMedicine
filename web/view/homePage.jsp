<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/4/22
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<html lang="zh-CN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../JspHead/header.jsp"%>
<link rel="stylesheet" href="../lib/css/input-spinner.css">
<script rel="script" src="../lib/js/input-spinner.js"></script>
<head>
    <title>E药网主页</title>
</head>
<body
<%--导航栏--%>>
<div id="nav"></div>
<script type="text/babel" src="../components/navbar.js"></script>
<%--首页图片--%>
<img src="../images/homeIMG.png" class="img-responsive center-block" alt=""/>
<div class="container-fluid">
    <div class="col-md-2">

    </div>
    <div class="col-md-8">
        <%--表格--%>
        <table class="table table-bordered table-hover text-center">
            <thead>
            <tr>
                <th width="10%" class="text-center">序号</th>
                <th class="text-center">名称</th>
                <th class="text-center" width="20%">商店名</th>
                <th class="text-center" width="10%">零售价</th>
                <th class="text-center" width="20%"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>阿司匹林</td>
                <td>XXXXX药房</td>
                <td>12.0</td>
                <td>
                    <div class="col-md-12">
                        <div id="1" class="input-group">
                    <span class="input-group-addon quantity-reduce btn">
                        <span class="glyphicon glyphicon-minus"></span>
                    </span>
                            <input id="1input" class="form-control text-center" type="text" value="0">
                            <span class="input-group-addon quantity-plus btn">
                        <span class="glyphicon glyphicon-plus"></span>
                    </span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td></td>
                <td></td>
                <td></td>
                <td><div class="col-md-12">
                    <div id="2" class="input-group">
                    <span class="input-group-addon quantity-reduce btn">
                        <span class="glyphicon glyphicon-minus"></span>
                    </span>
                        <input id="2input" class="form-control text-center" type="text" value="0">
                        <span class="input-group-addon quantity-plus btn">
                        <span class="glyphicon glyphicon-plus"></span>
                    </span>
                    </div>
                </div></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-2">

    </div>

</div>
</body>
</html>
