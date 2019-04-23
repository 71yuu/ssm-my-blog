<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/14
  Time: 22:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Yuu Blog | 标语管理</title>
    <meta name="description" content="这是一个 banner 页面">
    <meta name="keywords" content="banner">

    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="banner">
<script src="/static/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <jsp:include page="../includes/header.jsp"/>
    <!-- 侧边导航栏 -->
    <jsp:include page="../includes/left.jsp"/>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title  am-cf">标语管理</div>
                        </div>
                        <div class="row am-cf">
                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                                <div class="widget am-cf">
                                    <div class="widget-body  widget-body-lg am-fr">

                                        <table width="100%" class="am-table am-table-compact tpl-table-black ">
                                            <thead>
                                            <tr>
                                                <th>类别</th>
                                                <th>标语</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="gradeX">
                                                <td>H1</td>
                                                <td>${main.h1}</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="/main/banner/edit?h1=${main.h1}">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>H2</td>
                                                <td>${main.h2} </td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="/main/banner/edit?h2=${main.h2}">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>H3</td>
                                                <td>${main.h3}</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="/main/banner/edit?h3=${main.h3}">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>H4</td>
                                                <td>${main.h4}</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="/main/banner/edit?h4=${main.h4}">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
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
    </div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"/>
</body>

</html>
