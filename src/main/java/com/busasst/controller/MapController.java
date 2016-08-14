package com.busasst.controller;

import com.busasst.dao.RouteDao;
import com.busasst.dao.StaRouDao;
import com.busasst.dao.StationDao;
import com.busasst.entity.RouteEntity;
import com.busasst.entity.StaRouEntity;
import com.busasst.entity.StationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/8/12.
 */
@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    @Qualifier("stationDao")
    private StationDao stationDao;

    @Autowired
    @Qualifier("starouDao")
    private StaRouDao staRouDao;

    @Autowired
    @Qualifier("routeDao")
    private RouteDao routeDao;

    @ResponseBody
    @RequestMapping(value = "/getstations/{id}", method = RequestMethod.GET)
    public List<StationEntity> getStation(@PathVariable("id") int id) {
        List<StaRouEntity> temp = staRouDao.getAllStationsById(id);
        List<StationEntity> stations = new ArrayList<StationEntity>();
        for(StaRouEntity sr:temp){
            stations.add(stationDao.getById(sr.getStaId()));
        }
        return stations;
    }


    @RequestMapping(value = "/createline", method = RequestMethod.GET)
    public String createLine(){
        return "create-line";
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public String confirm(Model model,String datastring){
        System.out.println(datastring);
        String points[] = datastring.split("#");
        for(String s:points){
            System.out.println(s);
        }
        int index=0;
        for(String s:points){
            if(!s.isEmpty()){
                System.out.println(s);
                stationDao.saveSation(s);
                index++;
            }
        }
        int maxid = routeDao.getMaxId();
        maxid++;
        routeDao.saveRoute("line"+maxid,index);
        maxid = routeDao.getMaxId();
        int maxstaid = stationDao.getMaxId();
        for(int i=0;i<index;i++){
            staRouDao.saveStaRou(maxstaid-i,maxid);
        }




        List<RouteEntity> routes = routeDao.getAllRoutes();
        model.addAttribute("routes",routes);
        return "line-map";
    }
}
