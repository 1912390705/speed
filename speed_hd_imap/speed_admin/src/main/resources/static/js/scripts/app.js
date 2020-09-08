function on_iconMenu_clicked(){
    if( $('.logocolor').css('display') == "none" ){
        $(".logocolor").css("display","block");
        $(".list-group").css("display","block");
        $(".righttop").css("left","280px");
        $(".righttop").css("width","85%");
    }
    else{
        $(".logocolor").css("display","none");
        $(".list-group").css("display","none");
        $(".righttop").css("left","0px");
        $(".righttop").css("width","100%");
    }
}

function on_button_submit()
{
    var params = $('.loginIn').serialize();
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/manager/logIn",
        data:params,
        cache:false,
        async : true,
        success: function (result) {
            if(result.code == true){
                window.location.href ='logInIndex?username=' +result.manager.user_Name + '&token=' + result.token;
            }
            else{
                alert(result.message);
            }
        },//响应成功后的回调函数
        error: function (err) {
            alert("...")
        },
    });
}

function on_loginIn_clicked()
{

}