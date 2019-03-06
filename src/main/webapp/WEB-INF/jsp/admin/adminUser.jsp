<%@ page language="java" import="com.buxz.enterprise_portal.entity.Function" pageEncoding="UTF-8" %>
<%@ page import="com.buxz.enterprise_portal.entity.User" %>
<%@ include file="Session.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!doctype html>
<html class="no-js">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>明日科技有限公司</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <link rel="stylesheet" href="<%=basePath%>/admin/resources/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>/admin/resources/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，快点暂不支持。 请 <a href="http://browsehappy.com/"
                                                                 target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
    <div class="am-topbar-brand">
        <strong>明日科技</strong>
        <small>后台管理</small>
    </div>

    <button
            class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}">
        <span class="am-sr-only">导航切换</span>
        <span class="am-icon-bars"></span>
    </button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul
                class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">

            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle
                   href="javascript:;"> <span class="am-icon-users"></span>
                    <%=session.getAttribute("AdminName")%>，欢迎您 <span class="am-icon-caret-down"></span> </a>
                <ul class="am-dropdown-content">
                    <li>
                        <a href="/admin/logout"><span class="am-icon-power-off"></span>
                            退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <ul class="am-list admin-sidebar-list">
                <li>
                    <a href="/admin/news" title="新闻管理"><span
                            class="am-icon-pencil-square-o"></span> 新闻管理</a>
                </li>

                <li>
                    <a href="/admin/users" title="管理员管理"><span
                            class="am-icon-bookmark"></span> 管理员管理</a>
                </li>
            </ul>

            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p>
                        公告
                    </p>
                    <p>
                        技术支持：明日科技

                    </p>
                </div>
            </div>

        </div>

    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf">
                <strong>后台管理</strong>/
                <strong>管理员信息</strong>
            </div>
        </div>


        <div class="am-g" style="height: 300px">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table
                            class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-id">
                                序号
                            </th>

                            <th class="table-title">
                                用户名
                            </th>
                            <th class="table-title">
                                用户密码
                            </th>
                            <th class="table-title">
                                创建时间
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            request.setCharacterEncoding("UTF-8");
                            User user = new User();
                            Function Fun = new Function();
                            String strPage = request.getParameter("intPage");
                            String sPage = request.getContextPath() + request.getServletPath() + "?";
                            String sOK = user.ListUser(sPage, strPage);
                            if (sOK.equals("No")) {
                                out.println("数据服务器出现错误！");
                            } else {
                                out.println(sOK);
                            }
                        %>
                        </tbody>
                    </table>
                </form>
            </div>

        </div>
    </div>
    <!-- content end -->

</div>

<div class="am-popup" id="new-popup">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">
                添加新闻
            </h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>

        <div class="am-popup-bd">
            <form action="/admin/newsAdd" method="post"
                  class="am-form" id="new-msg">
                <fieldset>
                    <div class="am-form-group">
                        <label for="NewsTitle">
                            新闻标题：
                        </label>
                        <input name="NewsTitle" type="text" maxlength="32" id="NewsTitle"
                               placeholder="请输入新闻标题" data-validation-message="不能为空" required/>
                    </div>
                    <div class="am-form-group">
                        <label for="NewsContent">
                            新闻内容：
                        </label>
                        <textarea name="NewsContent" cols="30" rows="10" id="NewsContent"
                                  placeholder="请输入新闻内容。段落间请用#分隔。" data-validation-message="不能为空" required></textarea>
                    </div>

                    <input name="Action" type="hidden" value="Add">

                    <button class="am-btn am-btn-secondary" type="submit">
                        提交
                    </button>
                    <button onclick='javascript:$("#new-popup").modal("close");'
                            class="am-btn am-btn-secondary" type="button">
                        关闭
                    </button>
                </fieldset>
            </form>
        </div>

    </div>
</div>

<div class="am-popup" id="edit-popup">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">
                修改新闻
            </h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>

        <div class="am-popup-bd">
            <form action="/admin/newsEdit" method="post"
                  class="am-form" id="edit-msg">
                <fieldset>
                    <div class="am-form-group">
                        <label for="upd_NewsTitle">
                            新闻标题：
                        </label>
                        <input id="upd_NewsTitle" name="upd_NewsTitle" type="text" maxlength="32"
                               placeholder="请输入新闻标题" data-validation-message="不能为空" required/>
                    </div>
                    <div class="am-form-group">
                        <label for="upd_NewsContent">
                            新闻内容：
                        </label>
                        <textarea id="upd_NewsContent" name="upd_NewsContent" cols="30" rows="10"
                                  placeholder="请输入新闻内容" data-validation-message="不能为空" required></textarea>
                    </div>

                    <input name="Action" type="hidden" value="Edit">
                    <input id="newsId" name="newsId" type="hidden" value="">

                    <button class="am-btn am-btn-secondary" type="submit">
                        提交
                    </button>
                    <button onclick='javascript:$("#edit-popup").modal("close");'
                            class="am-btn am-btn-secondary" type="button">
                        关闭
                    </button>
                </fieldset>
            </form>
        </div>

    </div>
</div>


<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
    <div class="am-modal-dialog">
        <div class="am-modal-bd">
            确定要删除当前主题吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>
<footer>
    <hr>
    <p class="am-padding-left">
        © 2016 明日科技
    </p>
</footer>
<script src="<%=basePath%>/admin/resources/js/jquery.min.js"></script>
<script src="<%=basePath%>/admin/resources/js/amazeui.min.js"></script>
</body>
</html>
