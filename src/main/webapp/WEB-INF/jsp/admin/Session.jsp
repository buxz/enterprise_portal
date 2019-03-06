<%@ page language="java" import="com.buxz.enterprise_portal.entity.Function" pageEncoding="UTF-8" %>
<%
    Function Function1 = new Function();
    boolean isLogin = Function1.StringToBoolean((String) session.getAttribute("Login"));
    if (!isLogin) {
        out.print("<script>alert('请重新登录!');location.href='admin/login';</script>");
    }
%>