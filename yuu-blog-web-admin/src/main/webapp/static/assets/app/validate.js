/**
 * 函数对象
 * @constructor
 */
var Validate = function() {

    /**
     * 初始化 jQuery Validation
     */
    var handlerInitValidate = function () {
        $("#inputForm").validate({
            errorElement:'span',
            errorClass:'error_tip',

            rules:{
                username:{
                    required:true
                },
                password:{
                    required:true
                },
                tname:{
                    required:true
                },
                link:{
                    required:true
                },
                img:{
                    required:true
                },
                bannerName:{
                    required:true
                },
                cname:{
                    required:true
                },
                desc:{
                    required:true
                },
                aname:{
                    required:true
                },
                cid:{
                    required:true
                },
                content:{
                    required:true
                }
            },
            messages:{
                username:{
                    required:"账号不能为空"
                },
                password:{
                    required:"密码不能为空"
                },
                tname:{
                    required:"工具名称不能为空"
                },
                link:{
                    required:"链接地址不能为空"
                },
                img:{
                    required:"请先上传图片"
                },
                bannerName:{
                    required:"标语名称不能为空"
                },
                cname:{
                    required:"专栏名称不能为空"
                },
                desc:{
                    required:"专栏描述不能为空"
                },
                aname:{
                    required:"文章标题不能为空"
                },
                cid:{
                    required:"所属专栏不能为空"
                },
                content:{
                    required:"文章内容不能为空"
                }
            },

            errorPlacement:function(error, element){
                element.attr("class", "am-field-error");
                error.insertAfter(element);
            }
        });
    };

    return{
        /**
         * 初始化
         */
        init:function () {
            handlerInitValidate();
        }
    }

}();

$(document).ready(function () {
    Validate.init();
});