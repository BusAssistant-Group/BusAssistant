/**
 * Created by Administrator on 2016/5/19.
 */

//����input
function popwin(){
    var html=template('popwin-template');
    $('body').prepend(html);
    //��ʼ����
    $('.mask').fadeIn(300);
    $('.popwin').addClass("bounceIn animated");
}
//���عر�
$(document).on("click",".popwin .popclose",function(event){
    event.stopPropagation();

    $('.popwin').addClass("bounceOut animated");
    $(".mask").fadeOut(500);
    $(".popwin").one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        $(".mask").remove();
        $(this).remove();
    });
})
//ȡ��
$(document).on("click",".popwin .cancel",function(event){
    event.stopPropagation();

    $('.popwin').addClass("bounceOut animated");
    $(".mask").fadeOut(500);
    $(".popwin").one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        $(".mask").remove();
        $(this).remove();
    });
})
//ȷ��
$(document).on("click",".popwin .confirm",function(event){
    event.stopPropagation();

    $('.popwin').addClass("bounceOut animated");
    $(".mask").fadeOut(500);
    $(".popwin").one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        $(".mask").remove();
        $(this).remove();
        setTimeout(
            function(){
                $parent.append("<li><input type='text' \class='changename'\ value='�½��ļ���'/></li>");
            },300);
    });
})