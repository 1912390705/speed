require.config({
    paths:{
        "jquery":'../lib/jquery.min'
    }
});
require(['jquery'],function($) {
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
                var param = {};
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
                    url: "/manager/addManager",
                    data: param,
                    cache: false,
                    async: false,
                    success: function (result) {
                        if (result.code) {
                            window.location.href = "/html?page=UserInfo";
                        } else {
                            alert(result.msg);
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