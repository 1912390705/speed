require.config({
    paths:{
        "jquery":'../lib/jquery.min'
    }
});
require(['jquery'],function($){
    //初始化
    var app = {
        nodes: {
            projInfo: document.getElementById("projInfo"),
            projManage: document.getElementById("projManage"),
            flow: document.getElementById("flow"),
            MissionAssistance: document.getElementById("MissionAssistance"),
            controlPanel: document.getElementById("controlPanel"),
        },
        //下面的function 是调用最下面写的function
        handlers: {
            //点击菜单事件
            Aclick: function () {
                changeAStatus(this);
            },
            controlPanel: function () {
                changeAStatus(this);
                //切换页面
                $(".list-group").append(loadControlPanel());
            },
        },
    };
    //
    app.nodes.projInfo.addEventListener('click', app.handlers.Aclick, false);
    app.nodes.projManage.addEventListener('click', app.handlers.Aclick, false);
    app.nodes.flow.addEventListener('click', app.handlers.Aclick, false);
    app.nodes.MissionAssistance.addEventListener('click', app.handlers.Aclick, false);
    app.nodes.controlPanel.addEventListener('click', app.handlers.controlPanel, false);
    //
    function getUrlParam(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r!=null)
            return decodeURI(r[2]);//unescape()

        return null; //返回参数值
    }
});