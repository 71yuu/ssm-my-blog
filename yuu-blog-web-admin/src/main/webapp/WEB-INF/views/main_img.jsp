<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/14
  Time: 18:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Yuu Blog | 首页图片</title>
    <meta name="description" content="这是一个 img 页面">
    <meta name="keywords" content="img">
    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="img">
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
                            <div class="widget-title am-fl">背景图片</div>
                        </div>
                        <div class="widget-body am-fr">
                            <form id="inputForm" class="am-form tpl-form-line-form" enctype="multipart/form-data" action="/main/img/upload" method="post">
                                <div class="am-form-group">
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file">
                                            <div class="tpl-form-file-img">
                                                <img id="backimg" src="${img}" class="am-img-responsive" alt="" required>
                                            </div>
                                            <input id="img" name="img" type="file" multiple="" onchange="reads(this)" required>
                                        </div>
                                        <button type="submit" class="am-btn am-btn-danger am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 保存背景图片</button>
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

<!-- img -->
<script type="text/javascript">
    function reads(obj) {
        var file = obj.files[0];
        var reader = new  FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (ev) {
            $("#backimg").attr("src", ev.target.result);
        }
    }
</script>


</body>

</html>
