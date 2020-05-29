<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.model.goodsInCart" %>
<%@ page import="java.util.Vector" %>
<%@ page import="javax.websocket.Session" %><%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/29
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conn" class="com.utils.ConnDB"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //获取登录信息和商品ID
    String userName = (String)session.getAttribute("userName");
    int goods_id = Integer.parseInt(request.getParameter("goods_id"));
    //判断登录信息,未登录则跳转到登录界面
    if(userName == null || userName.equals("")){
        response.sendRedirect("login.jsp");
        return;
    }
    //获取指定商品数据
    String sql = "select * from goods where goods_id ="+goods_id;
    ResultSet rs = conn.executeQuery(sql);
    double goods_currentPrice = 0.0;
    String goods_name = "";
    try{
        //判断是否成功获取商品数据
        if(rs.next()){
            goods_currentPrice = rs.getDouble("goods_currentPrice");
            goods_name = rs.getString("goods_name");
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    //创建描述购物车中商品的模型实例
    goodsInCart goods = new goodsInCart();
    goods.goods_id = goods_id;
    goods.goods_name = goods_name;
    goods.goods_currentPrice = goods_currentPrice;
    goods.num = Integer.parseInt(request.getParameter("num"));
    //记录购物车内是否已存在该商品
    boolean isExsist = false;
    //获取购物车对象
    Vector cart = (Vector) session.getAttribute("cart");
    if(cart == null){
        //若购物车对象为空，则创建一个
        cart = new Vector();
    }else {
        //判断购物车中是否已存在该商品
        for (Object o : cart) {
            goodsInCart goodsInCart = (goodsInCart) o;
            if (goodsInCart.goods_id == goods.goods_id) {
                //已存在,修改标记值
                isExsist = true;
            }
        }
    }
    //若不存在
    if(!isExsist){
        cart.add(goods);
    }
    session.setAttribute("cart",cart);
    conn.close();
    response.sendRedirect("cart_page.jsp");
%>
</body>
</html>
