package com.busasst.controller;

import com.busasst.dao.StaRouDao;
import com.busasst.dao.StationDao;
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
}
