<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/15
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <title>Yuu Blog | ${article.id != null ? "编辑" : "发表"}文章</title>
    <meta name="description" content="这是一个 article 页面">
    <meta name="keywords" content="article">
    <jsp:include page="../includes/head.jsp"/>
    <!-- editor.md -->
    <link rel="stylesheet" href="/static/assets/css/editormd.css"/>
</head>

<body data-type="article">
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
                            <div class="widget-title  am-cf">${article.id != null ? "编辑" : "发表"}文章</div>

                        </div>
                        <div class="widget-body am-fr">

                            <form id="inputForm" class="am-form tpl-form-line-form" method="post" action="/article/save">
                                <input type="hidden" name="id" value="${article.id}"/>
                                <label for="aname" class="am-u-sm-3 am-form-label">文章标题<span class="tpl-form-line-small-title">:</span></label>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="aname" name="aname" placeholder="请输入文章标题" value="${article.aname}">
                                    </div>
                                </div>


                                <label for="column" class="am-u-sm-3 am-form-label">所属专栏 <span class="tpl-form-line-small-title">:</span></label>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9">
                                        <select name="cid" data-am-selected="${article.cid}">
                                            <option value="0" >所有分类</option>
                                            <c:forEach items="${columnList}" var="column">
                                                <option value="${column.id}" ${article.cid == column.id ? "selected" : ""}>${column.cname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-12 am-u-sm-push-12">
                                        <div id="layout">
                                            <div id="test-editormd">
                                                 <textarea style="display:none;" id="content" name="content" required>${article.content}</textarea>
                                                <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                                                <textarea class="editormd-html-textarea" name="html"></textarea>
                                            </div>
                                        </div>
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
<!-- editor.md -->
<script src="/static/assets/js/editormd.js"></script>
<script src="/static/assets/app/validate.js"></script>

<script type="text/javascript">
    $(function() {
        var testEditor = editormd("test-editormd", {
            width: "90%",
            height: 640,
            markdown : "",
            path : '/static/assets/plugins/editor/lib/',
            saveHTMLToTextarea : true,
            //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为 true
            //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
            //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
            //dialogMaskOpacity : 0.4,      // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
            //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/article/upload",

            /*
             上传的后台只需要返回一个 JSON 数据，结构如下：
             {
                success : 0 | 1,           // 0 表示上传失败，1 表示上传成功
                message : "提示的信息，上传成功或上传失败及错误信息等。",
                url     : "图片地址"        // 上传成功时才返回
             }
             */
        });
    });
</script>

</body>

</html>