<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/14
  Time: 9:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | ${tool.id == null ? "编辑" : "新增"}工具</title>
    <meta name="description" content="这是一个 tool 页面">
    <meta name="keywords" content="tool">
    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="tool">
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
                            <div class="widget-title am-fl">${tool.id != null ? "编辑" : "新增"}工具</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body am-fr">
                            <div class="am-alert am-alert-danger" data-am-alert ${baseResult == null ? "style='display:none;'" : ""}>
                                <button type="button" class="am-close">&times;</button>
                                <p>${baseResult.message}</p>
                            </div>
                            <form id="inputForm" class="am-form tpl-form-line-form" action="/tool/save" method="post">
                                <input type="hidden" id="pid" name="pid" value="${pid}"/>
                                <input type="hidden" id="id" name="id" value="${tool.id}"/>
                                <div class="am-form-group">
                                    <label for="tname" class="am-u-sm-3 am-form-label">工具名称 <span class="tpl-form-line-small-title">:</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="tname" name="tname" placeholder="请输入工具名称" value="${tool.tname}" required>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="link" class="am-u-sm-3 am-form-label">链接地址 <span class="tpl-form-line-small-title">:</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="link" name="link" placeholder="请输入连接地址" value="${tool.link}" required>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<!-- validation -->
<script src="/static/assets/app/validate.js"></script>

</body>

</html>
