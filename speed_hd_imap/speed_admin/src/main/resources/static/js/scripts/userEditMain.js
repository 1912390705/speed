require.config({
    paths:{
        "jquery":'../lib/jquery.min'
    }
});
require(['jquery'],function($) {
    var param = {}
    param.id = getUrlParam("id");
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/manager/selectOneById",
        data: param,
        cache: false,
        async: false,
        success: function (result) {
            var items = result;
            if (items) {
                var department = items.department.trim();
                var password = items.password.trim();
                var position = items.position.trim();
                var real_name = items.real_name.trim();
                var role_id = items.role_id;
                var status = items.status;
                var sex = items.sex.trim();
                var telephone = items.telephone;
                var user_Name = items.user_Name.trim();
                //角色
                $("#ddlRoleId option").each(function () {
                    var val = $(this).val();
                    var txt = $(this).text();
                    if (val == role_id) {
                        var elementSels = $(".single-select");
                        elementSels.each(function (index) {
                            var selects = $(this).find("select");
                            if(selects.length > 0 ){
                                if(selects[0].id === 'ddlRoleId') {
                                    $(this).find("span").html(txt);
                                }
                            }
                        });
                        //
                        $(this).attr("selected",true);
                    }
                });
                //部门
                $("#ddlOrganizeId option").each(function () {
                    var txt = $(this).text();
                    if (txt == department) {
                        var elementSels = $(".single-select");
                        elementSels.each(function (index) {
                            var selects = $(this).find("select");
                            if(selects.length > 0 ){
                                if(selects[0].id === 'ddlOrganizeId') {
                                    $(this).find("span").html(txt);
                                }
                            }
                        });
                        //
                        $(this).attr("selected",true);
                    }
                });
                //启用
                var elementCheckBox = $(".single-checkbox");
                elementCheckBox.each(function (index) {
                    var selects = $(this).find("a");
                    if(selects.length > 0 ){
                        if(selects[0].className === 'selected') {
                            selects[0].className = '';
                        }
                        else{
                            selects[0].className = 'selected';
                        }
                    }
                });
                $("#cbIsLock").prop("checked", status == 0 ? false : true);
                //账号
                $("#txtUserName").prop("value", user_Name);
                //登录密码
                $("#txtPassword").prop("value", password);
                //姓名
                $("#txtRealName").prop("value", real_name);
                //性别
                $("#txtGender option").each(function () {
                    var txt = $(this).val();
                    if (txt == sex) {
                        var elementSels = $(".single-select");
                        elementSels.each(function (index) {
                            var selects = $(this).find("select");
                            if(selects.length > 0 ){
                                if(selects[0].id === 'txtGender') {
                                    $(this).find("span").html(txt);
                                }
                            }
                        });
                        //
                        $(this).attr("selected",true);
                    }
                });
                //岗位
                $("#txtPost").prop("value", position);
                //电话
                $("#txtTelephone").prop("value", telephone);
                //刷新
            } else {
                alert(result.message);
            }
        },//响应成功后的回调函数
        error: function (err) {
            alert("...")
        },
    });
    //
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null)
            return decodeURI(r[2]);//unescape()

        return null; //返回参数值
    }
    //
    var app = {
        nodes: {
            submit: document.getElementById("btnSubmit"),
        },
        //下面的function 是调用最下面写的function
        handlers: {
            submit: function () {
                var param = {}
                param.id = getUrlParam("id");
                param.user_Name = $(" input[ name='txtUserName' ] ").val();
                param.password = $(" input[ name='txtPassword' ] ").val();
                param.role_id = $(" select[ name = 'ddlRoleId' ]").find("option:selected").val();
                param.telephone = $(" input[ name='txtTelephone' ] ").val();
                param.real_name = $(" input[ name='txtRealName' ] ").val();
                param.sex = $(" select[ name = 'txtGender' ]").find("option:selected").text();
                param.department = $(" select[ name = 'ddlOrganizeId' ]").find("option:selected").text();
                param.position =  $(" input[ name='txtPost' ] ").val();
                param.status = $(" input[ name='cbIsLock' ] ").prop("checked")?1 : 0;

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "/manager/updateManager",
                    data: param,
                    cache: false,
                    async: false,
                    success: function (result) {
                        var items = result;
                        if (result.code) {
                            window.location.href = "/html?page=UserInfo";
                        } else {
                            alert(result.message);
                        }
                    },//响应成功后的回调函数
                    error: function (err) {
                        alert("...")
                    },
                });
            },
        }
    };
    //
    app.nodes.submit.addEventListener('click', app.handlers.submit, false);
});