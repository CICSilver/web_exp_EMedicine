<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.model.goods" %>
<%@ page import="java.util.*" %>
<%@ page import="com.utils.ConvertList" %>
<%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/28
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conn" class="com.utils.ConnDB"/>
<jsp:useBean id="goodsDAO" class="com.dao.goodsDAO"/>
<jsp:useBean id="g" class="com.model.goods"/>
<html>
<body>
<%
    int pageSize = (int)session.getAttribute("pageSize");
    int Page = request.getParameter("Page")!=null?Integer.parseInt(request.getParameter("Page")):1;
    int curGoods = (Page -1)*pageSize;
    String sql = "select * from goods";
    ResultSet rs = conn.executeQuery(sql);
    List<goods> allGoods = ConvertList.goodsConvertList(rs,g);
    Collections.sort(allGoods);
%>
<div class="row">
    <div class="asce-order">
        <%
            try{
                rs.close();
                for(int i = 0; i<pageSize; i++){
        %>
        <div class="col-lg-3">
            <div class="goods">
                <div class="goods-pic set-bg" data-setbg=<%=allGoods.get(curGoods).getGoods_image()%>>
                    <ul class="goods-hover">
                        <li><a href="cart_add.jsp?goods_id=<%=allGoods.get(curGoods).getGoods_id()%>&num=1">
                            <i class="glyphicon glyphicon-heart"></i>
                        </a> </li>
                        <li><a href="cart_add.jsp?goods_id=<%=allGoods.get(curGoods).getGoods_id()%>&num=1">
                            <i class="glyphicon glyphicon-shopping-cart"></i>
                        </a> </li>
                    </ul></div>
                <div class="goods-text">
                    <h6><a href="#"><%=allGoods.get(curGoods).getGoods_name()%></a> </h6>
                    <h5>¥<%=allGoods.get(curGoods).getGoods_currentPrice()%>/件</h5>
                </div>
            </div>
        </div>
        <%
                        curGoods++;
                    if(curGoods>allGoods.size()){
                        break;
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
    </div>

</div>
<script language="JavaScript">
    $.fn.setbg = function setbg () {
        let bg = $(this).data('setbg');
        console.log("111");
        $(this).css('background-image', 'url(' + bg + ')');
    };
    $('.set-bg').each(function () {
        $(this).setbg();
    })
</script>
</body>
</html>
