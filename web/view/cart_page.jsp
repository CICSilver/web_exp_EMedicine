<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.model.goodsInCart" %><%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/29
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conn" class="com.utils.ConnDB"/>
<html>
<head>
    <title>购物车</title>
</head>
<body>
<%
    //判断登录信息
    String userName = (String) session.getAttribute("userName");
    if(userName == null || userName.equals("")){
        response.sendRedirect("login.jsp");
        return;
    }else {
        Vector cart = (Vector)session.getAttribute("cart");
        if(cart==null||cart.size()==0){
            response.sendRedirect("cart_null.jsp");
        }else {
%>
<%--加载动画--%>
<div id="preloader">
    <div class="loader"></div>
</div>
<%--顶部导航栏--%>
<header class="header">
    <%@ include file="../JspHead/nav.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header-logo">
                    <img class="logo" alt="" src="../images/logo-ts.png" href="../index.jsp">
                </div>
            </div>
            <div class="col-lg-9">
                <nav class="header-menu">
                    <ul>
                        <li class="active"><a href="#">首页</a> </li>
                        <li><a href="#">热销专区</a>
                            <ul class="header-menu-dropdown">
                                <li><a href="#">滋补调养</a> </li>
                                <li><a href="#">中药专区</a></li>
                            </ul>
                        </li>
                        <li><a href="#">中药抓药</a></li>
                        <li><a href="#">专家预约</a> </li>
                        <li><a href="#">商家店铺</a> </li>
                        <li><a href="#">用药咨询</a> </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<%--搜索栏与分类下拉框--%>
<section class="exh">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div id="exh_categories" class="exh_categories">
                    <div class="exh_categories_all">
                        <i class="glyphicon  glyphicon-list"></i>
                        <span class="categories-dropdown">所有商品分类</span>
                        <i class="glyphicon glyphicon-chevron-down"></i>
                    </div>
                    <ul style="display: none">
                        <li><a href="medicinePart.jsp">中西药品</a> </li>
                        <li><a href="#">营养保健</a></li>
                        <li><a href="#">维生素钙</a></li>
                        <li><a href="#">医疗器械</a></li>
                        <li><a href="#">美妆护理</a></li>
                        <li><a href="#">体检相关</a></li>
                        <li><a href="#">母婴专区</a></li>
                        <li><a href="#">休闲零食</a></li>
                        <li><a href="#">健身用品</a></li>
                        <li><a href="#">成人用品</a></li>
                        <li><a href="#">家庭常备药</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="medicine-search">
                    <div class="medicine-search-form">
                        <form action="#">
                            <div class="medicine-search-form-categories">
                                所有类别
                                <span class="arrow-down">
                            <i class="glyphicon glyphicon-chevron-down"></i>
                        </span>
                            </div>
                            <input type="text" placeholder="想恰什么药啊？">
                            <button type="submit" class="search-button">搜索</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--分隔符--%>
<section class="delimiter-section set-bg" id="delimiter" data-setbg="../images/timg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="delimiter-text">
                    <h2>
                        购物车
                    </h2>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="shopping-cart">
    <div class="container">
        <%--购物车商品展示--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="shopping-cart-table">
                    <table>
                        <thead>
                        <tr>
                            <th class="cart-goods">商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>总计</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--显示cart中的所有商品--%>
                        <%
                            double perTotal = 0;
                            double sumTotal = 0;
                            int goods_id = -1;
                            String goods_image = "";
                            String goods_name = "";
                            for(int i=0;i<cart.size();i++){
                                goodsInCart goodsItem = (goodsInCart) cart.get(i);
                                perTotal = goodsItem.goods_currentPrice*goodsItem.num;
                                sumTotal+=perTotal;
                                goods_id = goodsItem.goods_id;
                                //判断是否为有效商品
                                if(goods_id>0){

                                    ResultSet rs = conn.executeQuery("select * from goods where goods_id ="+goods_id);
                                    try {
                                        if(rs.next()){
                                            goods_image ="http://localhost:8080/EMedicine/"+rs.getString("goods_image");
                                        }
                                        conn.close();
                                    }catch (Exception e){
                                        e.printStackTrace();
                                    }
                                }
                        %>
                        <%--一条商品信息 begin--%>
                        <tr>
                            <td class="shopping-cart-item">
                                <img src="<%=goods_image%>" alt="">
                                <h5><%=goodsItem.goods_name%></h5>
                            </td>
                            <td class="shopping-cart-price"><%=goodsItem.goods_currentPrice%></td>
                            <td class="shopping-cart-number">
                                <div class="item-number">
                                    <div class="input-group" id="<%=goods_id%>">
                                        <span class="input-group-addon quantity-reduce btn">
                        <span class="glyphicon glyphicon-minus"></span>
                    </span>
                                        <input id="<%=goods_id%>input" class="form-control text-center" type="text" value="<%=goodsItem.num%>">
                                        <span class="input-group-addon quantity-plus btn">
                        <span class="glyphicon glyphicon-plus"></span>
                    </span>
                                    </div>
                                </div>
                            </td>
                            <td class="shopping-cart-total"><%=perTotal%></td>
                            <td class="shopping-cart-item-remove">
                                <span class="glyphicon glyphicon-remove"></span>
                            </td>
                        </tr>
                        <%--一条商品信息 end--%>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row"></div>
    </div>
</section>
</body>
<%
        }
    }
%>
</html>
