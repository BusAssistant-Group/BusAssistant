$(function(){
    $('.btn-edit').on('click', function(){
        console.log('s');
        var this_modal = $(this).attr('data-target');
        var toshow_info = $(this).parent().prevAll();
        //alert($(this).parent());
        console.log(toshow_info);
        $(this_modal).find('form .form-group input').each(function(index,domEle){
            if(index==6){
                $(domEle).val(toshow_info.eq(4).html());
            }else if(index==7){
                //$(domEle).val("提交修改".html());
            }else{
                $(domEle).val(toshow_info.eq(Math.abs(index-5)).html());
            }
        });
    });
});
