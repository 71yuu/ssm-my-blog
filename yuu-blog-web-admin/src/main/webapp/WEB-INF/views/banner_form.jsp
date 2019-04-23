<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/15
  Time: 8:24
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | 编辑标语</title>
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
                            <div class="widget-title am-fl">编辑标语</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body am-fr">

                            <form id="inputForm" class="am-form tpl-form-line-form" action="/main/banner/save" method="post">
                                <div class="am-form-group">
                                    <label for="bannerName" class="am-u-sm-3 am-form-label">标语 <span class="tpl-form-line-small-title">:</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="bannerName" name="${name}" placeholder="请输入标语名称" value="${main[name]}" required>
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
<script src="/static/assets/app/validate.js"></script>

</body>

</html>