<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/21
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conn" class="com.utils.ConnDB"/>
<jsp:useBean id="goodsDAO" class="com.dao.goodsDAO"/>
<jsp:useBean id="g" class="com.model.goods"/>
<html>
<head>
    <title>今天，你恰药了吗？</title>
</head>
<body>
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
                        中西药品
                    </h2>
                </div>
            </div>
        </div>
    </div>
</section>
    <%--连接数据库获取数据--%>
<%
    String sql = "select * from goods";
    //获取数据库中的所有货品
    ResultSet rs = conn.executeQuery(sql);
    int goods_num = 0;
    try {
        rs.last();
        //获取货品总数
        goods_num = rs.getRow();
    }catch (Exception e){
        e.printStackTrace();
    }
    if(goods_num == 0){
        out.println("<script language='javascript'>alert('读取失败或数据库信息为空')</script>");
    }
    conn.close();
    session.setAttribute("pageSize",8);
    int Page = request.getParameter("Page")!=null?Integer.parseInt(request.getParameter("Page")):1;
    int pageSize = (int)session.getAttribute("pageSize");
    int maxPage = goods_num%pageSize==0?goods_num /pageSize:goods_num /pageSize+1;
%>
<section class="selling">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="filter-goods">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="filter-sort">
                                <label for="sort">排序规则</label>
                                <select name="sort" id="sort">
                                    <option value="0" selected>按价格升序排列</option>
                                    <option value="1">按价格降序排列</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="filter-found">
                                <h6>
                                    <span id="goods-found"><%=goods_num%></span>
                                    件商品在售
                                </h6>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="filter-option">
                                <span class="glyphicon glyphicon-th-large"></span>
                                <span class="glyphicon glyphicon-th-list"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="goods-list">
                    <jsp:include page="asceOrderGoods.jsp"/>
                </div>
                <div class="pagination">
                    <div class="row">
                        <ul>
                            <%
                                for(int i = 1; i<= maxPage; i++){
                                    if(i== Page){
                                        %>
                            <li class="active" value="<%=i%>"><a href="medicinePart.jsp?Page=<%=i%>"><%=i%></a></li>
                            <%
                                    }else {
                            %>
                            <li value="<%=i%>"><a href="medicinePart.jsp?Page=<%=i%>"><%=i%></a></li>
                            <%
                                    }
                                }
                            %>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
