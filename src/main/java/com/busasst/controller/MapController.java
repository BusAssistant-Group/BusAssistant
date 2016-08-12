package com.busasst.controller;

import com.busasst.dao.RouteDao;
import com.busasst.dao.StationDao;
import com.busasst.entity.StationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping(value = "/getstations/{id}", method = RequestMethod.GET)
    public List<StationEntity> getStation(@PathVariable("id") int id) {
        List<StationEntity> stations = stationDao.getAllStationsById(id);
        return stations;
    }
}
