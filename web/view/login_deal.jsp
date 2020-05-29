<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 10385
  Date: 2020/5/17
  Time: 15:37
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
    String userEmail = request.getParameter("userEmail");
    try{
        String sql = "select * from member where userEmail='"+userEmail+"'";
        ResultSet rs =conn.executeQuery(sql);
        if(rs.next()) {
            String passwd = request.getParameter("userPasswd");
            out.println(userEmail+":"+passwd);
            if(passwd.equals(rs.getString("userPasswd"))) {
                out.println("<script language='javascript'>alert('登陆成功');"
                        +"window.location.href='login.jsp';</script>");
                session.setAttribute("userEmail",userEmail);
                //保存账号到session中，实现登陆效果
                session.setAttribute("userName",rs.getString("userName"));
                response.sendRedirect("../index.jsp");
            }else {
                out.println("<script language='javascript'>alert('登陆失败');"
                        +"window.location.href='login.jsp';</script>");

            }
        }else {
            out.println("<script language='javascript'>alert('账号不存在');"
                    +"window.location.href='login.jsp';</script>");
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    conn.close();
%>
</body>
</html>
