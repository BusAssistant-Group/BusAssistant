$(function(){
    $('.btn-edit').on('click', function(){
        console.log('s');
        var this_modal = $(this).attr('data-target');
        var toshow_info = $(this).parent().prevAll();
        $(this_modal).find('form .form-group input').each(function(index,domEle){
            $(domEle).val(toshow_info.eq(index).html());
        });
    });
});
