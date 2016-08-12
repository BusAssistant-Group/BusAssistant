$(function(){
    $('.btn-edit').on('click', function(){
        console.log('s121');
        var this_modal = $(this).attr('data-target');
        var toshow_info = $(this).parent().prevAll();
        //console.log('bbb');
        //alert(this_modal == "#edit_car_info");
        $(this_modal).find('form .form-group input').each(function(index,domEle){
            if(index==6){
                if(this_modal == "#edit_car_info"){
                    $(domEle).val(toshow_info.eq(5).html());
                    console.log(".........");
                }else{
                    $(domEle).val(toshow_info.eq(4).html());
                    console.log("1111111");
                }
            }else if(index==7){
                //$(domEle).val("提交修改".html());
            }else{
                $(domEle).val(toshow_info.eq(Math.abs(index-5)).html());
            }
        });
    });
})