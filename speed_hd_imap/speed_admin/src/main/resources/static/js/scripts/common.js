// 布局脚本
/*====================================
 *基于JQuery 1.9.0主框架
====================================*/
//绑定需要浮动的表头
$(function () {
    top.document.title = document.title;
    $("#floatHead").smartFloat();
    $(".rule-single-checkbox").ruleSingleCheckbox();
    $(".rule-multi-checkbox").ruleMultiCheckbox();
    $(".rule-multi-radio").ruleMultiRadio();
    $(".rule-single-select").ruleSingleSelect();
    $(".rule-multi-porp").ruleMultiPorp();
    $(".rule-date-input").ruleDateInput();
});
//全选取消按钮函数
function checkAll(chkobj) {
    if ($(chkobj).text() == "全选") {
        $(chkobj).children("span").text("取消");
        $(".checkall input:enabled").prop("checked", true);
    } else {
        $(chkobj).children("span").text("全选");
        $(".checkall input:enabled").prop("checked", false);
    }
}
//获取元素设置了[data-format]的参数
function getElementParams() {
    var wd = "";
    $("[data-format]:text").each(function (i) {
        if ($(this).val() != '') {
            if (wd != "") { wd += ","; }
            wd += $.format($(this).data("format"), $(this).data("val") || $(this).val());
        }
    });
    $("[data-format]:hidden").each(function (i) {
        if ($(this).val() != '') {
            if (wd != "") { wd += ","; }
            wd += $.format($(this).data("format"), $(this).data("val") || $(this).val());
        }
    });
    $("[data-format]select").each(function (i) {
        if ($(this).find("option:selected").val() != "-1") {
            if (wd != "") { wd += ","; }
            wd += $.format($(this).data("format"), $(this).find("option:selected").val());
        }
    });
    $("[data-format].ztree").each(function (i) {
        if (!!$(this).data("id")) {
            if (wd != "") { wd += ","; }
            wd += $.format($(this).data("format"), $(this).data("id"));
        }
    });
    return eval("({" + wd + "})");
}

//===========================工具类函数============================
//只允许输入数字
function checkNumber(e) {
    var keynum = window.event ? e.keyCode : e.which;
    if ((48 <= keynum && keynum <= 57) || (96 <= keynum && keynum <= 105) || keynum == 8) {
        return true;
    } else {
        return false;
    }
}
//只允许输入小数
function checkForFloat(obj, e) {
    var isOK = false;
    var key = window.event ? e.keyCode : e.which;
    if ((key > 95 && key < 106) || //小键盘上的0到9  
        (key > 47 && key < 60) ||  //大键盘上的0到9  
        (key == 110 && obj.value.indexOf(".") < 0) || //小键盘上的.而且以前没有输入.  
        (key == 190 && obj.value.indexOf(".") < 0) || //大键盘上的.而且以前没有输入.  
        key == 8 || key == 9 || key == 46 || key == 37 || key == 39) {
        isOK = true;
    } else {
        if (window.event) { //IE
            e.returnValue = false;   //event.returnValue=false 效果相同.    
        } else { //Firefox 
            e.preventDefault();
        }
    }
    return isOK;
}
//检查短信字数
function checktxt(obj, txtId) {
    var txtCount = $(obj).val().length;
    if (txtCount < 1) {
        return false;
    }
    var smsLength = Math.ceil(txtCount / 62);
    $("#" + txtId).html("您已输入<b>" + txtCount + "</b>个字符，将以<b>" + smsLength + "</b>条短信扣取费用。");
}
//四舍五入函数
function ForDight(Dight, How) {
    Dight = Math.round(Dight * Math.pow(10, How)) / Math.pow(10, How);
    return Dight;
}
//写Cookie
function addCookie(objName, objValue, objHours) {
    var str = objName + "=" + escape(objValue);
    if (objHours > 0) {//为0时不设定过期时间，浏览器关闭时cookie自动消失
        var date = new Date();
        var ms = objHours * 3600 * 1000;
        date.setTime(date.getTime() + ms);
        str += "; expires=" + date.toGMTString();
    }
    document.cookie = str;
}

//读Cookie
function getCookie(objName) {//获取指定名称的cookie的值
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) return unescape(temp[1]);
    }
    return "";
}

//========================基于artdialog插件========================
//可以自动关闭的提示，基于artdialog插件
function jsprint(msgtitle, url, callback) {
    var d = dialog({ content: msgtitle }).show();
    setTimeout(function () {
        d.close().remove();
    }, 2000);
    if (url == "back") {
        frames["mainframe"].history.back(-1);
    } else if (url != "") {
        frames["mainframe"].location.href = url;
    }
    //执行回调函数
    if (arguments.length == 3) {
        callback();
    }
}
//弹出一个Dialog窗口
function jsdialog(msgtitle, msgcontent, url, callback) {
    var d = dialog({
        title: msgtitle,
        content: msgcontent,
        okValue: '确定',
        ok: function () { },
        onclose: function () {
            if (url == "back") {
                history.back(-1);
            } else if (url != "") {
                location.href = url;
            }
            //执行回调函数
            if (argnum == 5) {
                callback();
            }
        }
    }).showModal();
}
//打开一个最大化的Dialog
function ShowMaxDialog(tit, url) {
    dialog({
        title: tit,
        url: url
    }).showModal();
}
//执行回传函数
function ExePostBack(objId, objmsg) {
    if ($(".checkall input:checked").size() < 1) {
        parent.dialog({
            title: '提示',
            content: '对不起，请选中您要操作的记录！',
            okValue: '确定',
            ok: function () { }
        }).showModal();
        return false;
    }
    var msg = "删除记录后不可恢复，您确定吗？";
    if (arguments.length == 2) {
        msg = objmsg;
    }
    parent.dialog({
        title: '提示',
        content: msg,
        okValue: '确定',
        ok: function () {
            __doPostBack(objId, '');
        },
        cancelValue: '取消',
        cancel: function () { }
    }).showModal();

    return false;
}
//检查是否有选中再决定回传
function CheckPostBack(objId, objmsg) {
    var msg = "对不起，请选中您要操作的记录！";
    if (arguments.length == 2) {
        msg = objmsg;
    }
    if ($(".checkall input:checked").size() < 1) {
        parent.dialog({
            title: '提示',
            content: msg,
            okValue: '确定',
            ok: function () { }
        }).showModal();
        return false;
    }
    __doPostBack(objId, '');
    return false;
}
//执行回传无复选框确认函数
function ExeNoCheckPostBack(objId, objmsg) {
    var msg = "删除记录后不可恢复，您确定吗？";
    if (arguments.length == 2) {
        msg = objmsg;
    }
    parent.dialog({
        title: '提示',
        content: msg,
        okValue: '确定',
        ok: function () {
            __doPostBack(objId, '');
        },
        cancelValue: '取消',
        cancel: function () { }
    }).showModal();

    return false;
}
//======================以上基于artdialog插件======================

//========================基于Validform插件========================
//初始化验证表单
$.fn.initValidform = function () {
    var checkValidform = function (formObj) {
        $(formObj).Validform({
            tiptype: function (msg, o, cssctl) {
                /*msg：提示信息;
                o:{obj:*,type:*,curform:*}
                obj指向的是当前验证的表单元素（或表单对象）；
                type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态；
                curform为当前form对象;
                cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）；*/
                //全部验证通过提交表单时o.obj为该表单对象;
                if (!o.obj.is("form")) {
                    //定位到相应的Tab页面
                    if (o.obj.is(o.curform.find(".Validform_error:first"))) {
                        var tabobj = o.obj.parents(".tab-content"); //显示当前的选项
                        var tabindex = $(".tab-content").index(tabobj); //显示当前选项索引
                        if (!$(".content-tab ul li").eq(tabindex).children("a").hasClass("selected")) {
                            $(".content-tab ul li a").removeClass("selected");
                            $(".content-tab ul li").eq(tabindex).children("a").addClass("selected");
                            $(".tab-content").hide();
                            tabobj.show();
                        }
                    }
                    //页面上不存在提示信息的标签时，自动创建;
                    if (o.obj.parents("dd").find(".Validform_checktip").length == 0) {
                        o.obj.parents("dd").append("<span class='Validform_checktip' />");
                        o.obj.parents("dd").next().find(".Validform_checktip").remove();
                    }
                    var objtip = o.obj.parents("dd").find(".Validform_checktip");
                    cssctl(objtip, o.type);
                    objtip.text(msg);
                }
            },
            showAllError: true
        });
    };
    return $(this).each(function () {
        checkValidform($(this));
    });
}
//======================以上基于Validform插件======================
//智能浮动层函数
$.fn.smartFloat = function () {
    var position = function (element) {
        var obj = element.children("div");
        var top = obj.position().top;
        var pos = obj.css("position");
        $(window).scroll(function () {
            var scrolls = $(this).scrollTop();
            if (scrolls > top) {
                obj.width(element.width());
                element.height(obj.outerHeight());
                if (window.XMLHttpRequest) {
                    obj.css({
                        position: "fixed",
                        top: 0
                    });
                } else {
                    obj.css({
                        top: scrolls
                    });
                }
            } else {
                obj.css({
                    position: pos,
                    top: top
                });
            }
        });
    };
    return $(this).each(function () {
        position($(this));
    });
};

//复选框
$.fn.ruleSingleCheckbox = function () {
    var singleCheckbox = function (parentObj) {
        //查找复选框
        var checkObj = parentObj.children('input:checkbox').eq(0);
        parentObj.children().hide();
        //添加元素及样式
        var newObj = $('<a href="javascript:;">'
            + '<i class="off">否</i>'
            + '<i class="on">是</i>'
            + '</a>').prependTo(parentObj);
        parentObj.addClass("single-checkbox");
        //判断是否选中
        if (checkObj.prop("checked") == true) {
            newObj.addClass("selected");
        }
        //检查控件是否启用
        if (checkObj.prop("disabled") == true) {
            newObj.css("cursor", "default");
            return;
        }
        //绑定事件
        newObj.click(function () {
            if ($(this).hasClass("selected")) {
                $(this).removeClass("selected");
            } else {
                $(this).addClass("selected");
            }
            checkObj.trigger("click"); //触发对应的checkbox的click事件
        });
        //绑定反监听事件
        checkObj.on('click', function () {
            if ($(this).prop("checked") == true && !newObj.hasClass("selected")) {
                alert();
                newObj.addClass("selected");
            } else if ($(this).prop("checked") == false && newObj.hasClass("selected")) {
                newObj.removeClass("selected");
            }
        });
    };
    return $(this).each(function () {
        singleCheckbox($(this));
    });
};

//多项复选框
$.fn.ruleMultiCheckbox = function () {
    var multiCheckbox = function (parentObj) {
        parentObj.addClass("multi-checkbox"); //添加样式
        parentObj.children().hide(); //隐藏内容
        var divObj = $('<div class="boxwrap"></div>').prependTo(parentObj); //前插入一个DIV
        parentObj.find(":checkbox").each(function () {
            var indexNum = parentObj.find(":checkbox").index(this); //当前索引
            var newObj = $('<a href="javascript:;">' + parentObj.find('label').eq(indexNum).text() + '</a>').appendTo(divObj); //查找对应Label创建选项
            if ($(this).prop("checked") == true) {
                newObj.addClass("selected"); //默认选中
            }
            //检查控件是否启用
            if ($(this).prop("disabled") == true) {
                newObj.css("cursor", "default");
                return;
            }
            //绑定事件
            $(newObj).click(function () {
                if ($(this).hasClass("selected")) {
                    $(this).removeClass("selected");
                    //parentObj.find(':checkbox').eq(indexNum).prop("checked",false);
                } else {
                    $(this).addClass("selected");
                    //parentObj.find(':checkbox').eq(indexNum).prop("checked",true);
                }
                parentObj.find(':checkbox').eq(indexNum).trigger("click"); //触发对应的checkbox的click事件
                //alert(parentObj.find(':checkbox').eq(indexNum).prop("checked"));
            });
        });
    };
    return $(this).each(function () {
        multiCheckbox($(this));
    });
}

//多项选项PROP
$.fn.ruleMultiPorp = function () {
    var multiPorp = function (parentObj) {
        parentObj.addClass("multi-porp"); //添加样式
        parentObj.children().hide(); //隐藏内容
        var divObj = $('<ul></ul>').prependTo(parentObj); //前插入一个DIV
        parentObj.find(":checkbox").each(function () {
            var indexNum = parentObj.find(":checkbox").index(this); //当前索引
            var liObj = $('<li></li>').appendTo(divObj)
            var newObj = $('<a href="javascript:;">' + parentObj.find('label').eq(indexNum).text() + '</a><i></i>').appendTo(liObj); //查找对应Label创建选项
            if ($(this).prop("checked") == true) {
                liObj.addClass("selected"); //默认选中
            }
            //检查控件是否启用
            if ($(this).prop("disabled") == true) {
                newObj.css("cursor", "default");
                return;
            }
            //绑定事件
            $(newObj).click(function () {
                if ($(this).parent().hasClass("selected")) {
                    $(this).parent().removeClass("selected");
                } else {
                    $(this).parent().addClass("selected");
                }
                parentObj.find(':checkbox').eq(indexNum).trigger("click"); //触发对应的checkbox的click事件
                //alert(parentObj.find(':checkbox').eq(indexNum).prop("checked"));
            });
        });
    };
    return $(this).each(function () {
        multiPorp($(this));
    });
}

//多项单选
$.fn.ruleMultiRadio = function () {
    var multiRadio = function (parentObj) {
        parentObj.addClass("multi-radio"); //添加样式
        parentObj.children().hide(); //隐藏内容
        var divObj = $('<div class="boxwrap"></div>').prependTo(parentObj); //前插入一个DIV
        parentObj.find('input[type="radio"]').each(function () {
            var indexNum = parentObj.find('input[type="radio"]').index(this); //当前索引
            var newObj = $('<a href="javascript:;">' + parentObj.find('label').eq(indexNum).text() + '</a>').appendTo(divObj); //查找对应Label创建选项
            if ($(this).prop("checked") == true) {
                newObj.addClass("selected"); //默认选中
            }
            //检查控件是否启用
            if ($(this).prop("disabled") == true) {
                newObj.css("cursor", "default");
                return;
            }
            //绑定事件
            $(newObj).click(function () {
                $(this).siblings().removeClass("selected");
                $(this).addClass("selected");
                parentObj.find('input[type="radio"]').prop("checked", false);
                parentObj.find('input[type="radio"]').eq(indexNum).prop("checked", true);
                parentObj.find('input[type="radio"]').eq(indexNum).trigger("click"); //触发对应的radio的click事件
                //alert(parentObj.find('input[type="radio"]').eq(indexNum).prop("checked"));
            });
        });
    };
    return $(this).each(function () {
        multiRadio($(this));
    });
}

//单选下拉框
$.fn.ruleSingleSelect = function () {
    var singleSelect = function (parentObj) {
        parentObj.addClass("single-select"); //添加样式
        parentObj.children().hide(); //隐藏内容
        var divObj = $('<div class="boxwrap"></div>').prependTo(parentObj); //前插入一个DIV
        //创建元素
        var titObj = $('<a class="select-tit" href="javascript:;"><span></span><i></i></a>').appendTo(divObj);
        var itemObj = $('<div class="select-items"><ul></ul></div>').appendTo(divObj);
        var arrowObj = $('<i class="arrow"></i>').appendTo(divObj);
        var selectObj = parentObj.find("select").eq(0); //取得select对象
        //遍历option选项
        selectObj.find("option").each(function (i) {
            var indexNum = selectObj.find("option").index(this); //当前索引
            var liObj = $('<li>' + $(this).text() + '</li>').appendTo(itemObj.find("ul")); //创建LI
            if ($(this).prop("selected") == true) {
                liObj.addClass("selected");
                titObj.find("span").text($(this).text());
            }
            //检查控件是否启用
            if ($(this).prop("disabled") == true) {
                liObj.css("cursor", "default");
                return;
            }
            //绑定事件
            liObj.click(function () {
                $(this).siblings().removeClass("selected");
                $(this).addClass("selected"); //添加选中样式
                selectObj.find("option").prop("selected", false);
                selectObj.find("option").eq(indexNum).prop("selected", true); //赋值给对应的option
                titObj.find("span").text($(this).text()); //赋值选中值
                arrowObj.hide();
                itemObj.hide(); //隐藏下拉框
                selectObj.trigger("change"); //触发select的onchange事件
                //alert(selectObj.find("option:selected").text());
            });
        });
        //设置样式
        //titObj.css({ "width": titObj.innerWidth(), "overflow": "hidden" });
        //itemObj.children("ul").css({ "max-height": $(document).height() - titObj.offset().top - 62 });

        //检查控件是否启用
        if (selectObj.prop("disabled") == true) {
            titObj.css("cursor", "default");
            return;
        }
        //绑定单击事件
        titObj.click(function (e) {
            e.stopPropagation();
            if (itemObj.is(":hidden")) {
                //隐藏其它的下位框菜单
                $(".single-select .select-items").hide();
                $(".single-select .arrow").hide();
                //位于其它无素的上面
                arrowObj.css("z-index", "1");
                itemObj.css("z-index", "1");
                //显示下拉框
                arrowObj.show();
                itemObj.show();
            } else {
                //位于其它无素的上面
                arrowObj.css("z-index", "");
                itemObj.css("z-index", "");
                //隐藏下拉框
                arrowObj.hide();
                itemObj.hide();
            }
        });
        //绑定页面点击事件
        $(document).click(function (e) {
            selectObj.trigger("blur"); //触发select的onblure事件
            arrowObj.hide();
            itemObj.hide(); //隐藏下拉框
        });
    };
    return $(this).each(function () {
        singleSelect($(this));
    });
}

//日期控件
$.fn.ruleDateInput = function () {
    var dateInput = function (parentObj) {
        parentObj.wrap('<div class="date-input"></div>');
        parentObj.before('<i></i>');
    };
    return $(this).each(function () {
        dateInput($(this));
    });
}

/* 模拟表单提交下载文件
 * 调用：$('abc','a=1&b=2','post')
 * 结果：无 */
$.download = function (url, data, method) {
    if (url && data) {
        data = typeof data == 'string' ? data : jQuery.param(data);
        var inputs = '';
        $.each(data.split('&'), function () {
            var pair = this.split('=');
            inputs += '<input type="hidden" name="' + pair[0] + '" value="' + pair[1] + '" />';
        });
        $('<form action="' + url + '" method="' + (method || 'post') + '">' + inputs + '</form>').appendTo('body').submit().remove();
    };
};
/* json数据查询过滤
 * 调用：$.jsonWhere(d,function(a){return a>5})
 * 结果：返回过滤后的json数组 */
$.jsonWhere = function (data, action) {
    if (action == null) return;
    var reval = new Array();
    $(data).each(function (i, v) {
        if (action(v)) {
            reval.push(v);
        }
    });
    return reval;
}
/* 表单序列化赋值或取值
 * 调用：$('#form').formSerialize()
 * 结果：表单赋值或取值 */
$.fn.formSerialize = function (formdate) {
    var element = $(this);
    if (!!formdate) {
        for (var key in formdate) {
            var value = $.trim(formdate[key]).replace(/&nbsp;/g, '');
            var $id = element.find('#' + key);
            if ($id.length == 0) { continue; }
            var type = $id.attr('type') || $id.get(0).tagName.toLowerCase();
            switch (type) {
                case "checkbox":
                    $id.attr("checked", (value == "true" || value == 1));
                    break;
                case "radio":
                    $("input[name='" + $id.attr('name') + "'][value='" + value + "']").attr("checked", true);
                    break;
                case "select":
                    $id.val(value).trigger("change");
                    break;
                case "img":
                    $id.attr("src", value);
                    break;
                default:
                    $id.val(value);
                    break;
            }
        }
        return false;
    }
    var postdata = {};
    element.find('input,select,textarea,img').each(function (r) {
        var $this = $(this);
        var id = $this.attr('id');
        var type = $this.attr('type') || $this.get(0).tagName.toLowerCase();
        switch (type) {
            case "checkbox":
                postdata[id] = $this.is(":checked") ? 1 : 0;
                break;
            case "radio":
                var name = $this.attr('name');
                postdata[name] = $("input[name='" + name + "']:checked").val();
                break;
            case "img":
                postdata[id] = $this.attr('src');
                break;
            default:
                var value = $this.val() == "" ? "" : $this.val();
                if (!$.request("keyValue")) { value = value.replace(/&nbsp;/g, ''); }
                postdata[id] = value;
                break;
        }
    });
    if ($('[name=__RequestVerificationToken]').length > 0) {
        postdata["__RequestVerificationToken"] = $('[name=__RequestVerificationToken]').val();
    }
    return postdata;
};
/* ajax绑定radiolist
 * 调用：$('#abc').bindRadios({url:'abc'})
 * 结果：绑定下拉框选项 */
$.fn.bindRadios = function (options) {
    var defaults = {
        id: "id",
        text: "text",
        url: "",
        param: [],
        change: null
    };
    var options = $.extend(defaults, options);
    var $element = $(this);
    if (options.url != "") {
        $.ajax({
            url: options.url,
            data: options.param,
            dataType: "json",
            async: false,
            success: function (data) {
                $.each(data, function (i) {
                    var id = data[i][options.id];
                    var text = data[i][options.text];
                    var $container = $('<div class="rdio"></div>');
                    $container.append($('<input id="' + id + '_' + i + '" name="' + id + '" type="checkbox"><label for="">' + text + '</label>'));
                    $element.append($container);
                });
            }
        });
    }
}
/* ajax绑定下拉框
 * 调用：$('#abc').bindSelect({url:'abc'})
 * 结果：绑定下拉框选项 */
$.fn.bindSelect = function (options) {
    var defaults = {
        id: "id",
        text: "text",
        search: false,
        data: null,
        url: "",
        param: [],
        change: null
    };
    var opts = $.extend(defaults, options);
    var $element = $(this);
    if (opts.url != "") {
        $.ajax({ url: opts.url, data: opts.param, dataType: "json", async: false, success: bindData });
    } else if (opts.data != null) {
        var dataJson = [];
        for (var item in opts.data) { dataJson.push({ id: item, text: opts.data[item] }); }
        bindData(dataJson);
    } else {
        $element.select2({ minimumResultsForSearch: opts.search == true ? 0 : -1 });
    }
    function bindData(data) {
        $.each(data, function (i) { $element.append($("<option></option>").val(data[i][opts.id]).html(data[i][opts.text])); });
        $element.select2({ minimumResultsForSearch: opts.search == true ? 0 : -1 });
        $element.on("change", function (e) {
            if (opts.change != null) { opts.change(data[$(this).find("option:selected").index()]); }
            $("#select2-" + $element.attr('id') + "-container").html($(this).find("option:selected").text().replace(/　/g, ''));
        });
    }
}
$.request = function (name) {
    //var search = location.search.slice(1);
    //var arr = search.split("&");
    //for (var i = 0; i < arr.length; i++) {
    //    var ar = arr[i].split("=");
    //    if (ar[0] == name) {
    //        if (unescape(ar[1]) == 'undefined') {
    //            return "";
    //        } else {
    //            return unescape(ar[1]);
    //        }
    //    }
    //}
    //return "";
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

//解密Url
$.decodeURIRequest = function () {
    var url = decodeURI(decodeURI(window.location.search)); //获取url中"?"符后的字串，使用了两次decodeRUI解码
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
        return theRequest;
    }

    return theRequest;
}

Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
Date.prototype.toJSON = function () {
    return this.format("yyyy-MM-dd hh:mm:ss"); // util.formatDate是自定义的个时间格式化函数
};
/* 正则js模板引擎
 * 调用：$("#template").template({name: "moban"});
 * 结果：返回解析后得html */
$.fn.template = function (data) {
    var $template = $(this).html();
    var regex = /{{(.+?)}}/g, cursor = 0, reExp = /(^( )?(var|if|for|else|switch|case|break|{|}|;))(.*)?/g, code = 'var r=[];\n';
    while ((match = regex.exec($template)) !== null) {
        parseHtml($template.slice(cursor, match.index));
        parseJS(match[1]);
        cursor = match.index + match[0].length;
    }
    parseHtml($template.substr(cursor, $template.length - cursor));
    code += 'return r.join("");';
    function parseHtml(line) {
        line = line.replace(/('|")/g, '\\$1').replace(/\n/g, ' ').replace(/(^\s+)|(\s+$)/g, "");
        code += 'r.push("' + line + '");\n';
    }
    function parseJS(line) {
        line = line.replace(/(^\s+)|(\s+$)/g, "");
        code += line.match(reExp) ? line + '\n' : 'r.push(' + line + ');\n';
    }
    return new Function(code.replace(/[\r\t\n]/g, '')).apply(data);
}



/**
 * 获取本周开始和结束时间
 * @param n
 * @returns {string|*}
 */
function getTime(n, curDate) {
    var now = curDate;
    var year = now.getFullYear();
    //因为月份是从0开始的,所以获取这个月的月份数要加1才行
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var day = now.getDay();
    //判断是否为周日,如果不是的话,就让今天的day-1(例如星期二就是2-1)
    if (day !== 0) {
        n = n + (day - 1);
    }
    else {
        n = n + day;
    }
    if (day) {
        //这个判断是为了解决跨年的问题
        if (month > 1) {
            month = month;
        }
        //这个判断是为了解决跨年的问题,月份是从0开始的
        else {
            year = year - 1;
            month = 12;
        }
    }
    now.setDate(now.getDate() - n);
    year = now.getFullYear();
    month = now.getMonth() + 1;
    date = now.getDate();
    var s = year + "-" + (month < 10 ? ('0' + month) : month) + "-" + (date < 10 ? ('0' + date) : date);
    return s;
}
function addDate(date, days) {
    var d = new Date(date);
    d.setDate(d.getDate() + days);
    var m = d.getMonth() + 1;
    return new Date(d.getFullYear() + '-' + m + '-' + d.getDate());
}
function dateToStr(date) {
    var d = new Date(date);
    var m = d.getMonth() + 1;
    return d.getFullYear() + '-' + m + '-' + d.getDate();

}

/*
* 检测对象是否是空对象(不包含任何可读属性)。
* 方法既检测对象本身的属性，也检测从原型继承的属性(因此没有使用hasOwnProperty)。
*/
function isEmpty(obj) {
    for (var name in obj) {
        return false;
    }
    return true;
};


