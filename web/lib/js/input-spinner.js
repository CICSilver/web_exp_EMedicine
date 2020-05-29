$(document).ready(function () {
    let MAX=999;
    let MIN=0;
    //plus
    $(".quantity-plus").click(function () {
        let curPrice = ($('.shopping-cart-price').html())*1;
        let parentId = $(this).parent().attr("id");
        let inputId = "#"+parentId+"input";
        let oldVal = $(inputId).val();
        let newVal = parseInt(oldVal)+1;
        if(newVal<MIN||newVal>MAX) {
            $(inputId).val(oldVal);
        }else {
            let newTotal = curPrice*newVal;
            $(inputId).val(newVal);
            $('.shopping-cart-total').html(newTotal)
        }
    });

    //reduce
    $(".quantity-reduce").click(function () {
        let curPrice = ($('.shopping-cart-price').html())*1;
        let parentId = $(this).parent().attr("id");
        let inputId = "#"+parentId+"input";
        let oldVal = $(inputId).val();
        let newVal = parseInt(oldVal)-1;
        if(newVal<MIN||newVal>MAX) {
            $(inputId).val(oldVal);
        }else {
            let newTotal = curPrice*newVal;
            $(inputId).val(newVal);
            $('.shopping-cart-total').html(newTotal);
        }
    });
});
