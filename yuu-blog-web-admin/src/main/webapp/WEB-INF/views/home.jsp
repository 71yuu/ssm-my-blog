<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/13
  Time: 18:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | 管理首页</title>
    <meta name="description" content="这是一个 home 页面">
    <meta name="keywords" content="home">
    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="home">
<script src="/static/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <jsp:include page="../includes/header.jsp"/>
    <!-- 侧边导航栏 -->
    <jsp:include page="../includes/left.jsp"/>

    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">

        <div class="row-content am-cf">
            <div class="row  am-cf">
                <div class="am-u-sm-12 am-u-md-4 am-u-lg-4">
                    <div class="widget widget-primary am-cf">
                        <div class="widget-statistic-header">
                            总发表文章
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                ${home.articleNum}
                            </div>
                            <span class="widget-statistic-icon am-icon-book">篇</span>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-4 am-u-lg-4">
                    <div class="widget widget-purple am-cf">
                        <div class="widget-statistic-header">
                            总发表专栏
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                ${home.columnNum}
                            </div>
                            <span class="widget-statistic-icon am-icon-users">栏</span>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-4 am-u-lg-4">
                    <div class="widget widget-purple am-cf">
                        <div class="widget-statistic-header">
                            总文章点击次数
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                ${home.articleClick}
                            </div>
                            <span class="widget-statistic-icon am-icon-eye">次</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row am-cf">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">最近十篇文章</div>
                        </div>
                        <div class="widget-body  widget-body-lg am-fr">

                            <table width="100%" class="am-table am-table-compact tpl-table-black ">
                                <thead>
                                <tr>
                                    <th>文章标题</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${articleList}" var="article">
                                    <tr class="gradeX">
                                        <td>${article.aname}</td>
                                        <td><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                </c:forEach>
                                <!-- more data -->
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"/>

</body>

</html>