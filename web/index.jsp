<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/4/22
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<html lang="zh-CN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <head>
    <title>E药网主页</title>
  </head>
<body>
    <div id="preloader">
      <div class="loader"></div>
    </div>
    <header class="header">
      <%@ include file="JspHead/nav.jsp"%>
    <div class="container">
  <div class="row">
    <div class="col-lg-3">
      <div class="header-logo">
        <img class="logo" alt="" src="images/logo-ts.png" href="../index.jsp">
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
              <ul>
                  <li><a href="view/medicinePart.jsp">中西药品</a> </li>
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

            <%--轮播--%>
            <div id="medicine-carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#medicine-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#medicine-carousel" data-slide-to="1"></li>
                    <li data-target="#medicine-carousel" data-slide-to="2"></li>
                    <li data-target="#medicine-carousel" data-slide-to="3"></li>
                </ol>

                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="images/carousel-images/carousel-image-0.png" alt="">
                        <div class="carousel-caption">因为找不到</div>
                    </div>
                    <div class="item">
                        <img src="images/carousel-images/carousel-image-1.png" alt="">
                        <div class="carousel-caption">差不多大小的药品图</div>
                    </div>
                    <div class="item">
                        <img src="images/carousel-images/carousel-image-2.jpg" alt="">
                        <div class="carousel-caption">就开始XP放出</div>
                    </div>
                    <div class="item">
                        <img src="images/carousel-images/carousel-image-3.jpg" alt="">
                        <div class="carousel-caption">的作者是屑</div>
                    </div>
                </div>
                <a class="left carousel-control" href="#medicine-carousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#medicine-carousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
      </div>
    </div>
  </section>
    <section class="limitAds">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <a class="limit-time">
                        <div class="clock-wrap">
                            <div class="clock">
                                <div class="clock-h"></div>
                                <div class="clock-m"></div>
                                <div class="clock-s"></div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3">
                    <a href="#">
                        <img src="images/limited-ads/a_0.jpg" alt="">
                    </a>
                </div>
                <div class="col-lg-3">
                    <a href="#">
                        <img src="images/limited-ads/a_1.jpg" alt="">
                    </a>
                </div>
                <div class="col-lg-3">
                    <a href="#">
                        <img src="images/limited-ads/a_2.jpg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>

</body>
</html>
