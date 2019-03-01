<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%-- 头部 --%>
<div class="header_bg">
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <a href="index.jsp">
                    <img src="<%=basePath%>/front/resources/img/logo.png" alt="">
                </a>
            </div>
            <div class="pull-icon">
                <a id="pull"></a>
            </div>
            <div class="cssmenu">
                <ul>
                    <li> <a href="<%=basePath%>/front"> 首页</a> </li>
                    <li> <a href="<%=basePath%>/front/about"> 企业简介</a> </li>
                    <li> <a href="<%=basePath%>/front/newsFrontList"> 新闻</a> </li>
                    <li> <a href="<%=basePath%>/front/content"> 核心竞争力</a> </li>
                    <li class="last"> <a href="<%=basePath%>/front/contact"> 联系我们</a> </li>
                </ul>
            </div>
            <%-- 清除浮动 --%>
            <div class="clear"></div>
        </div>
    </div>
</div>