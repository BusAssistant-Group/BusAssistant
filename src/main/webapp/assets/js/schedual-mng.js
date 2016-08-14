/**
 * Created by Administrator on 2016/8/12.
 */

$(function(){
    my_table('2014/08/26', 'my_date', function(d) {
        console.log(d.now_date)
    });



    var schedual=new Schedual();            //Ϊ�˷��㴫����ĳ�ʼ������
})

function my_table(e, f, callback) { /*e������ʽΪy/m/d,�����now���ý��������,fΪ����������ID,callbackΪ�ص����ݣ��᷵��һЩ������Ҫ����*/
    if (e == 'now') e = GetDateStr(0);
    var now_date = e;
    var week_no = new Date(now_date).getDay();
    var date_size = getCountDays(now_date);
    var my_date = document.getElementById(f);
    //my_date.innerHTML = '<p><label id="pre_date"><</label>' + now_date.split('/')[0] + '��' + now_date.split('/')[1] + '��<label id="n_date">></label></p><table border="1"><thead><tr><td>��</td><td>һ</td><td>��</td><td>��</td><td>��</td><td>��</td><td>��</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table>';

    var nData={
        year:now_date.split('/')[0],
        month:now_date.split('/')[1]
    };
    var htmll=template('time',nData);
    my_date.innerHTML=htmll;

    var tbody = my_date.getElementsByTagName('tbody')[0];
    var td = tbody.getElementsByTagName('td');
    var pre_date = now_date.split('/');
    pre_date[1] = Number(pre_date[1]) - 1;
    if (pre_date[1] < 1) {
        pre_date[0] = Number(pre_date[0]) - 1;
        pre_date[1] = 12;
    };
    if (pre_date[1] < 10) {
        pre_date[1] = '0' + pre_date[1]
    };
    pre_date = pre_date[0] + '/' + pre_date[1] + '/' + pre_date[2];
    var pre_week_no = new Date(pre_date).getDay();
    var pre_date_size = getCountDays(pre_date);
    var n_date = now_date.split('/');
    n_date[1] = Number(n_date[1]) + 1;
    if (n_date[1] > 12) {
        n_date[0] = Number(n_date[0]) + 1;
        n_date[1] = 1;
    };
    if (n_date[1] < 10) {
        n_date[1] = '0' + n_date[1]
    };
    n_date = n_date[0] + '/' + n_date[1] + '/' + n_date[2];
    var n_week_no = new Date(n_date).getDay();
    var n_date_size = getCountDays(n_date);
    var data = {}; //�ص���������
    data.now_date = now_date;
    data.week_no = week_no;
    data.date_size = date_size;
    data.my_date = my_date;
    data.pre_date = pre_date;
    data.pre_week_no = pre_week_no;
    data.n_week_no = n_week_no;
    data.n_date_size = n_date_size;
    for (i = 0; i < date_size; i++) {
        td[(week_no + i)].innerHTML = (i + 1);
        if ((week_no + i) == week_no + Number(now_date.split('/')[2])) {
            td[(week_no + i - 1)].style.color = 'red';
        };
    };
    for (i = 0; i < week_no; i++) {
        td[i].innerHTML = (pre_date_size - week_no + i + 1);
        td[i].style.color = '#cccccc';
    }
    for (i = week_no + date_size, j = 1; i < 42; i++, j++) {
        td[i].innerHTML = j;
        td[i].style.color = '#cccccc';
    }
    if(callback)callback(data);

    document.getElementById('pre_date').onclick = function() {  //��һ����
        var ntitle = this.parentNode.innerText.split('��');
        var y = ntitle[0];
        y = y.split('<');
        y = y[1];
        var m = ntitle[1];
        m = m.split('��');
        m = m[0];
        m = m - 1;
        if (m <= 0) {
            m = 12;
            y = y - 1;
        };
        if (m < 10) {
            m = '0' + m;
        }
        my_table(y + '/' + m + '/01', f);
    }

    document.getElementById('n_date').onclick = function() {    //��һ����
        var ntitle = this.parentNode.innerText.split('��');
        var y = ntitle[0];
        y = y.split('<');
        y = y[1];
        var m = ntitle[1];
        m = m.split('��');
        m = m[0];
        m = Number(m) + 1;
        if (m > 12) {
            m = 1;
            y = Number(y) + 1;
        };
        if (m < 10) {
            m = '0' + m;
        }
        my_table(y + '/' + m + '/01', f);
    }

    function getCountDays(e) { //��ȡ��ǰ�������ڵ����ж�����
        var curDate = new Date(e);
        var curMonth = curDate.getMonth();
        curDate.setMonth(curMonth + 1);
        curDate.setDate(0);
        return curDate.getDate();
    };

    function GetDateStr(AddDayCount) {
        var dd = new Date();
        dd.setDate(dd.getDate() + AddDayCount); //��ȡAddDayCount��������
        var y = dd.getFullYear();
        var m = dd.getMonth() + 1; //��ȡ��ǰ�·ݵ�����
        var d = dd.getDate();
        return y + "/" + m + "/" + d;
    };
}

;(function($){  ///����д��������˼·�Ƚ�����
    var Schedual=function(){
        var self=this;
        console.log(";dfdfd");
        self.val;

        $(document).on("click","#table-time tbody td",function(event){
            self.val=$(this).text();
            self.poptime();
        })

        //strartScroll();
    };
    Schedual.prototype={
        poptime:function(){
            var self=this;
            self.yearmonth=$("#watchtime").text().substring(0);
            var data={
                yearmonth:self.yearmonth,
                day:self.val
            };
            var html=template('Tpopstation',data);
            console.log("html:"+html);
            $("body").append(html);
            var mask='<div class="mask"></div>';
            $("body").append(mask);
            $(".mask").fadeIn(200);
            $(".schedual-mng-popStation").fadeIn(400);


            //�����¼���
            $(".close").click(function () {
                $(".mask").fadeOut(300,function(){
                    $(this).remove();
                })
                $(this).parent().parent().fadeOut(300,function(){
                    $(this).remove();
                })
            })
            //�󶨹�����
            self.startScroll();
        },
        startScroll:function(){
            var self=this;
            $(window).on("load",function(){
                $(".scroll").mCustomScrollbar();
            });

            $(".scroll").mCustomScrollbar({
                axis:"y", // horizontal scrollbar
                theme:"minimal-dark"
            });
        }
    }
    window["Schedual"]=Schedual;
})(jQuery);