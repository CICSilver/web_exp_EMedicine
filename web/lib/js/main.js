'use strict';
(function ($) {
    let $body = $('body');
    /*      PreLoader    */
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloader").delay(200).fadeOut();

        /*      data-setbg    */
        $('.set-bg').each(function () {
            let bg = $(this).data('setbg');
            console.log("111");
            $(this).css('background-image', 'url(' + bg + ')');
        });
    });



    /*      Categories Slider       */
    $body.on('click','#exh_categories .exh_categories_all',function () {
        $('.exh_categories ul').slideToggle(400);
    });

    /*      Form Check      */
    let nameisOkay = false;
    let emailisOkay = false;
    let passwdisOkay = false;
    let proAndCityisOkay = false;
    let phoneNumisOkay = false;
    //昵称,4-16位，不可以数字或特殊符号开头且不包括空格
    $body.on('blur','#name',function () {
        let name = $('#name').val();
        let reg_name = /^[\u4E00-\u9FA5a-zA-Z_]+[^\s]*\w*$/;
        let $e_name = $('#e_name');
        $e_name.empty();
        if(name.length>3&&reg_name.test(name)&&name.length<=16){
            $e_name.append("<span class='okay'>用户名可用</span>");
            nameisOkay = true;
        }else{
            $e_name.append("<span class='error'>用户名无效！(4-16位，不可以数字或特殊符号开头且不包括空格)</span>");
            nameisOkay = false;
        }
    });
    //邮箱
    $body.on('blur','#email',function () {
        let email = $('#email').val();
        let reg_email = /^[a-zA-Z0-9]+([_\.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,6}$/;
        let $e_email = $('#e_email');
        $e_email.empty();
        if(reg_email.test(email)){
            $e_email.append("<span class='okay'>邮箱可用</span>");
            emailisOkay = true;
        }else {
            $e_email.append("<span class='error'>邮箱无效</span>");
            emailisOkay = false;
        }
    });

    $body.on('blur','#phoneNumber',function () {
        let phoneNum = $('#phoneNumber').val();
        let reg_phoneNum = /^1([34578])\d{9}$/;
        let $e_phoneNum = $('#e_phoneNumber');
        $e_phoneNum.empty();
        if(!reg_phoneNum.test(phoneNum)){
            $e_phoneNum.append("<span class='error'>请填写正确的手机号</span>");
            phoneNumisOkay = false;
        }else {
            phoneNumisOkay = true;
        }

    });
    //密码强度
    // 纯数字:弱，   字母加数字：中，    大写字母+字母+数字：强，   特殊符号+字母+数字：最强大脑
    $body.on('blur','#passwd',function () {
        let passwd = $('#passwd').val();
        let reg_passwd_week = /\d/;
        let reg_passwd_middle = /[a-z]+\d*/;
        let reg_passwd_strong = /[A-Z]+[a-z0-9]*/;
        let reg_passwd_ultra = /[^a-zA-Z0-9]+\w*/;
        let $e_passwd = $('#e_passwd');
        $e_passwd.empty();
        if(passwd.length<9){
            $e_passwd.append("<span class='error'>请输入至少9位密码</span>");
            passwdisOkay = false;
        }else if(reg_passwd_ultra.test(passwd)) {
            $e_passwd.append("<span class='ultra'>您就是最强大脑？</span>");
            passwdisOkay = true;
        }else if(reg_passwd_strong.test(passwd)){
            $e_passwd.append("<span class='okay'>强</span>");
            passwdisOkay = true;
        }else if(reg_passwd_middle.test(passwd)){
            $e_passwd.append("<span class='middle'>中</span>");
            passwdisOkay = true;
        }else if(reg_passwd_week.test(passwd)){
            $e_passwd.append("<span class='error'>弱</span>");
            passwdisOkay = true;
        }
    });
    //重复密码验证
    $body.on('blur','#repetPasswd',function () {
        let passwd = $('#passwd').val();
        let repeat = $('#repetPasswd').val();
        let $e_repeat = $('#e_repeat');
        $e_repeat.empty();
        if(passwd !== repeat){
            $e_repeat.append("<span class='error'>两次输入的密码不相等</span>");
            passwdisOkay = false;
        }else {
            passwdisOkay = true;
        }
    });

    /*      Register        */
    $body.on('click','#register',function () {
        if($("#province").val()!=="") {
            if($("#city").val()!==""){
                proAndCityisOkay = true;
            }
        }
        if(nameisOkay&&emailisOkay&&passwdisOkay&&proAndCityisOkay&&phoneNumisOkay) {
            let json = $('#register-form').serialize();
            console.log('json : ',decodeURIComponent(json));
        } else {
            alert("请按正确格式填写信息");
        }
    });

    $body.on('change','#sort',function () {
        let val =  $('#sort').children('option:selected').val();
        let $list = $('.goods-list');
        console.log('刷新中');
        switch (val) {
            case '0':
                $list.load("asceOrderGoods.jsp");
                break;
            case '1':
                $list.load("descOrderGoods.jsp");
                break;
            default:break;
        }
    });
    /*  数字增减框   */
    let MAX = 999;
    let MIN = 0;
    $body.on('click','.quantity-reduce',function () {
        let curPrice = ($('.shopping-cart-price').html())*1;
        let inputId = "#"+$(this).parent().attr("id")+"input";
        let oldVal = $(inputId).val();
        let newVal = parseInt(oldVal)-1;
        if(newVal<MIN||newVal>MAX){
            $(inputId).val(oldVal);
        }else {
            let newTotal = curPrice*newVal;
            $(inputId).val(newVal);
            $('.shopping-cart-total').html(newTotal);
        }
    });

    $body.on('click','.quantity-plus',function () {
        let curPrice = ($('.shopping-cart-price').html())*1;
        let inputId = "#"+$(this).parent().attr("id")+"input";
        let oldVal = $(inputId).val();
        let newVal = parseInt(oldVal)+1;
        if(newVal<MIN||newVal>MAX){
            $(inputId).val(oldVal);
        }else {
            let newTotal = curPrice*newVal;
            $(inputId).val(newVal);
            $('.shopping-cart-total').html((parseFloat(newTotal)));
        }
    });


})(jQuery);
