//注册页面校验
$(function(){
    $("#registForm").validate({

        //规则：
        rules:{
            "username":{
                "required":true
            },
            "password":{
                "required":true,
                "rangelength":[6,30]
            },
            "confirmpwd":{
                "required":true,
                "equalTo":"#password"
            },
            "email":{
                "required":true,
                "email":true,
                "validateEmail_regist":true
            },
            "telephone":{
                "required":true,
                "rangelength":[11,11],
                "validateTelephone_regist":true
            },
            "name":{
                "required":true
            },
            "person_id":{
                "required":true,
                "rangelength":[18,18],
                "validatePerson_id_regist":true
            },
            "sex":{
                "required":true
            },
            "birthday":{
                "date":true
            }
        },

        //信息
        messages:{
            "username":{
                "required":"昵称必填"
            },
            "password":{
                "required":"密码必填",
                "rangelength":"密码长度为6~30位"
            },
            "confirmpwd":{
                "required":"确认密码必填",
                "equalTo":"两次密码不一致"
            },
            "email":{
                "required":"邮箱必填",
                "email":"邮箱格式不正确",
                "validateEmail_regist":"该邮箱已被使用"
            },
            "telephone":{
                "required":"手机号必填",
                "rangelength":"手机号长度为11位",
                "validateTelephone_regist":"该手机号已被注册"
            },
            "name":{
                "required":"真实姓名必填"
            },
            "person_id":{
                "required":"身份证号必填",
                "rangelength":"有效身份证号长度为18位",
                "validatePerson_id_regist":"该身份证号已注册"
            },
            "sex":{
                "required":"性别必选"
            },
            "birthday":{
                "date":"生日格式不正确"
            }
        },

        /**
         * errorPlacement  指定错误信息出现的位置
         * 第一个参数error： 错误信息
         * 第二个参数element：产生错误的标签元素
         */
        errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加到当前元素的祖父节点后面
                error.appendTo(element.parent().parent());
            } else {
                //将错误信息直接插入到当前元素的后面
                error.insertAfter(element);
            }
        }

    });
    $("#updateForm").validate({
        //规则
        rules:{
            "username":{
                "required":true
            },
            "password":{
                "required":true,
                "rangelength":[6,12]
            },
            "confirmpwd":{
                "required":true,
                "equalTo":"#password"
            },
            "email":{
                "required":true,
                "email":true,
                "validateEmail":true
            },
            "telephone":{
                "required":true,
                "rangelength":[11,11],
                "validateTelephone":true
            },
            "address":{
            },
            "name":{
                "required":true
            },
            "person_id":{
                "required":true,
                "rangelength":[18,18],
                "validatePerson_id":true
            },
            "sex":{
                "required":true
            },
            "birthday":{
                "date":true
            }
        },

        //信息
        messages:{
            "username":{
                "required":"昵称必填"
            },
            "password":{
                "required":"密码必填",
                "rangelength":"密码长度为6~12"
            },
            "confirmpwd":{
                "required":"重复密码必填",
                "equalTo":"两次输入的密码要一致"
            },
            "email":{
                "required":"邮箱必填",
                "email":"邮箱格式不正确",
                "validateEmail":"该邮箱已被注册"
            },
            "telephone":{
                "required":"手机号必填",
                "rangelength":"手机号长度为11位",
                "validateTelephone":"该手机号已被注册"
            },
            "address":{
            },
            "name":{
                "required":"真实姓名必填"
            },
            "person_id":{
                "required":"身份证号必填",
                "rangelength":"有效身份证号长度为18位",
                "validatePerson_id":"该身份证号已注册"
            },
            "sex":{
                "required":"性别必选"
            },
            "birthday":{
                "date":"生日格式不正确"
            }
        },

        /**
         * errorPlacement  指定错误信息出现的位置
         * 第一个参数error： 错误信息
         * 第二个参数element：产生错误的标签元素
         */
        errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加到当前元素的祖父节点后面
                error.appendTo(element.parent().parent());
            } else {
                //将错误信息直接插入到当前元素的后面
                error.insertAfter(element);
            }
        }
    })
});

/**
 *  自定义校验规则：
 *  $.validator.addMethod("校验规则名称",function(输入框中的值,标签对象,输入参数){});
 */
/*注册校验*/
$.validator.addMethod("validateTelephone_regist",function(value,element,params){
    /*避免出现修改后和修改前值相同的情况*/

        var flag = false;
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "post",
            url: "/user?method=validateTelephone",
            data: {"telephone": value},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
                var message = rs.message;
                if(flag==true){
                    $(".telephoneMsg").html("<font style='color: #009688'>"+message+"</font>");
                }else if(flag==false){
                    $(".telephoneMsg").html("<font style='color: #009688'>"+message+"</font>");
                }
            }
        });
        return !flag;  //flag为true，代表存在此手机号码；false为不存在

});
$.validator.addMethod("validatePerson_id_regist",function(value,element,params){
        var flag = false;
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "post",
            url: "/user?method=validatePerson_id",
            data: {"person_id": value},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
                var message = rs.message;
                if(flag=='true'){
                    $(".person_idMsg").html("<font style='color: red'>"+message+"</font>");
                }else if(flag=='false'){
                    $(".person_idMsg").html("<font style='color: #009688'>"+message+"</font>");
                }
            }
        });
        return !flag;  //flag为true，代表存在此身份证号码；false为不存在此

});
$.validator.addMethod("validateEmail_regist",function(value,element,params){
        var flag = false;
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "post",
            url: "/user?method=validateEmail",
            data: {"email": value},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
                var message = rs.message;
                if(flag=='true'){
                    $(".emailMsg").html("<font style='color: red'>"+message+"</font>");
                }else if(flag=='false'){
                    $(".emailMsg").html("<font style='color: #009688'>"+message+"</font>");
                }
            }
        });
        return !flag;  //flag为true，代表存在此邮箱；false为不存在

});

/*修改校验*/
$.validator.addMethod("validateTelephone",function(value,url,oldTelephone){
   /*避免出现修改后和修改前值相同的情况*/
    var newTelephone = $('#telephone').val();
    var oldPhone = $("#oldTel").val();
    var flag = false;
    if(oldPhone!=newTelephone) {
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "post",
            url: "/user?method=validateTelephone",
            data: {"telephone": newTelephone},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
            }
        });
    }
    return !flag;  //flag为true，代表存在此手机号码；false为不存在
});
$.validator.addMethod("validatePerson_id",function(url,oldPerson_id){
    var oldPeronId = $("#oldPersonId").val();
    console.log("url+"+url);
    console.log("oldPerson_id="+oldPerson_id);
    var newPerson_id=$('#person_id').val();
    console.log('newPersonid='+newPerson_id);
    var flag = false;
    if(oldPeronId!=newPerson_id) {
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "get",
            url: "/user?method=validatePerson_id&person_id="+newPerson_id,
            //data: {"person_id": newPerson_id},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
            }
        });
    }
    return !flag;  //flag为true，代表存在此身份证号码；false为不存在此
});
$.validator.addMethod("validateEmail",function(url,oldEmail){
    var oldEmailAddr = $("#oldEmail").val();
    console.log(oldEmailAddr)
    var newEmail = $('#email').val();
    var flag = false;
    console.log(newEmail);
    if(oldEmailAddr!=newEmail) {
        console.log("进入邮箱校验");
        $.ajax({
            async: false,  //若为true，异步；若false，同步
            type: "post",
            url: "/user?method=validateEmail",
            data: {"email": newEmail},
            dataType: "json",
            success: function (rs) {
                flag = rs.flag;
            }
        });
      //  return !flag;
    }

    //本函数返回的结果是false的时候，会有提示信息，返回true则没有
    return !flag;  //flag为true，代表存在此邮箱；false为不存在
});


/*修改密码校验*/
$("#editPasswordForm").validate({
    //规则
    rules:{
        "password":{
            "required":true,
            "rangelength":[6,12]
        },
        "confirmpwd":{
            "required":true,
            "equalTo":"#password"
        }
    },

    //信息
    messages:{

        "password":{
            "required":"密码必填",
            "rangelength":"密码长度为6~12"
        },
        "confirmpwd":{
            "required":"重复密码必填",
            "equalTo":"两次输入的密码要一致"
        }
    },

    /**
     * errorPlacement  指定错误信息出现的位置
     * 第一个参数error： 错误信息
     * 第二个参数element：产生错误的标签元素
     */
    errorPlacement: function (error, element) {
        //如果是radio或checkbox
        if (element.is(':radio') || element.is(':checkbox')) {
            //将错误信息添加到当前元素的祖父节点后面
            error.appendTo(element.parent().parent());
        } else {
            //将错误信息直接插入到当前元素的后面
            error.insertAfter(element);
        }
    }
});



