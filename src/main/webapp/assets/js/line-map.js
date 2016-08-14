/**
 * Created by Administrator on 2016/5/21.
 */
//$(function(){
//    var map = new BMap.Map("allmap");

    //map.enableScrollWheelZoom(true);        //允许鼠标滚轮
    //map.addControl(new BMap.NavigationControl());     //添加缩放控件
    //addMarker(118.46, 32.03);

    //function addMarker(longitude,latitude){
    //    var point = new BMap.Point(longitude, latitude);
    //    var marker = new BMap.Marker(point);  // 创建标注
    //    map.addOverlay(marker);              // 将标注添加到地图中
    //    map.centerAndZoom(point, 15);
    //    var opts = {
    //        width : 200,     // 信息窗口宽度
    //        height: 100,     // 信息窗口高度
    //        title : "海底捞王府井店" , // 信息窗口标题
    //        enableMessage:true,//设置允许信息窗发送短息
    //        message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
    //    }
    //    var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
    //    marker.addEventListener("click", function(){
    //        map.openInfoWindow(infoWindow,point); //开启信息窗口
    //    });
    //}

//});


;(function($, window, document,undefined) {        //封闭的命名空间
    //定义Map的构造函数
    var Map = function(map) {
        var self=this;
        self.id;
        self.data;
        console.log("插件开始");
        self.map=map;

        //地图初始化
        map.enableScrollWheelZoom(true);        //允许鼠标滚轮
        map.addControl(new BMap.NavigationControl());     //添加缩放控件
        self.addMarker(118.46, 32.03);

        $(".dot").click(function(){
            console.log("点击了");
            self.id=$(this).attr("dataid");
            self.getData();
        })

        $(".improve").click(function(){
            console.log("点击了");
            self.id=22;
            self.getData();
        })

        /*this.input_init();*/
    };
    //定义Popwin的方法
    Map.prototype = {
        tips:function(){
            var self=this;
        },
        getData:function(){
            var self=this;
            $.ajax({
                url:'/busasst/map/getstations/'+self.id,                 //${rootPath}失效
                type:'get',
                async : true, //默认为true 异步
                success:function(data){
                    self.data=data;
                    self.doData();
                },error:function(){
                    console.log("获取错误");
                    return "error";
                }
            });
        },
        doData:function(){
            var self=this;
            var map=self.map;
            map.clearOverlays();
         //   alert("before");
            var points = new Array();
            var index=0;
          //  alert("after");
            //console.log(self.data);
            $.each(self.data,function(i,field){
                var ll=field.longla.split(",");
                var long=ll[0];
                var lati=ll[1];
                var info=field.name;
                var addr=field.address;

                //开始标记
             if(self.id!=21){
                 self.addMarker(long,lati,info,addr);
             }



                //尝试绘制路线  start
                var point = new BMap.Point(long, lati);
                var tempmarker = new BMap.Marker(point);  // 创建标注
                points[index] = tempmarker;
                index++;
            })
            var driving = new BMap.DrivingRoute(map);    //创建驾车实例
            for(var i=1;i<index;i++){
                driving.search(points[i-1], points[i]);
            }
            driving.setSearchCompleteCallback(function() {
                var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组

                var polyline = new BMap.Polyline(pts);
                polyline.setStrokeColor("red");
                map.addOverlay(polyline);
               // alert(self.id);
                if(self.id==21){
                    map.addOverlay(points[0]);
                    map.addOverlay(points[index-1]);
                }
            });
            //尝试绘制路线 end


        },
        addMarker:function(longitude,latitude,infomation,addr){
            var self=this;
            var map=self.map;

            var point = new BMap.Point(longitude, latitude);
            var marker = new BMap.Marker(point);  // 创建标注
            var label = new BMap.Label(infomation,{offset:new BMap.Size(20,-10)});
            marker.setLabel(label);
            map.addOverlay(marker);              // 将标注添加到地图中
            map.centerAndZoom(point, 15);
            var opts = {
                width : 200,     // 信息窗口宽度
                height: 100,     // 信息窗口高度
                title : infomation , // 信息窗口标题
                enableMessage:true,//设置允许信息窗发送短息
                message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
            }
            var infoWindow = new BMap.InfoWindow("地址："+addr, opts);  // 创建信息窗口对象
            marker.addEventListener("click", function(){
                map.openInfoWindow(infoWindow,point); //开启信息窗口
            });
        }
    };
    window["Map"]=Map;      //这里将插件暴露出去，可以实例化
})(jQuery, window, document);
