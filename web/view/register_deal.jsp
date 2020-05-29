<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/16
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conn" class="com.utils.ConnDB"/>
<jsp:useBean id="memberDao" class="com.dao.memberDAO"/>
<jsp:useBean id="member" scope="request" class="com.model.member">
    <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String userName = member.getUserName();
    ResultSet resultSet = conn.executeQuery("select * from member where userName = '"+userName+"'");
    try {
        if(resultSet.next()){
            //如果结果集不为空，则用户名重复
            out.println(member.getUserPhoneNumber());
        }else {
            int ret = 0;
            ret = memberDao.insert(member);
            if(ret!=0) {
                out.println("<script language='javascript'>alert('注册成功！');"
                        + "window.location.href='register.jsp';</script>");
            }else {
                out.println("<script language='javascript'>alert('注册失败！');"
                        + "window.location.href='register.jsp';</script>");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
