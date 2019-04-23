<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/15
  Time: 10:17
--%>
<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/12
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | ${column.id != null ? "编辑" : "新增" }专栏</title>
    <meta name="description" content="这是一个 column 页面">
    <meta name="keywords" content="column">
    <jsp:include page="../includes/head.jsp"/>

</head>

<body data-type="column">
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
                            <div class="widget-title am-fl">${column.id != null ? "编辑" : "新增"}专栏</div>
                        </div>
                        <div class="widget-body am-fr">

                            <form id="inputForm" class="am-form tpl-form-line-form" enctype="multipart/form-data" method="post" action="/column/save">
                                <input type="hidden" name="id" value="${column.id}"/>
                                <label for="cname" class="am-u-sm-3 am-form-label">名称 <span class="tpl-form-line-small-title">:</span></label>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="cname" name="cname" placeholder="请输入专栏名称" value="${column.cname}">
                                    </div>
                                </div>

                                <label for="desc" class="am-u-sm-3 am-form-label">描述 <span class="tpl-form-line-small-title">:</span></label>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="desc" name="desc" placeholder="请输入专栏描述" value="${column.describe}">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="backimg" class="am-u-sm-3 am-form-label">封面图 <span class="tpl-form-line-small-title">:</span></label>
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file" style="width: 300px; height: 160px;">
                                            <div class="tpl-form-file-img" >
                                                <img id="backimg" class="am-img-responsive" src="${column.img}" alt="">
                                            </div>
                                            <input id="doc-form-file" name="backimg" type="file" multiple="" onchange="reads(this)"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <input type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success " value="提交" />
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

