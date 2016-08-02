package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import com.busasst.entity.WorkerEntity;
import com.busasst.dao.WorkerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by sl on 16-8-2.
 */
@Controller
@RequestMapping("/worker")
public class WorkerController {


    @Autowired
    private WorkerDao workerDao;

    @RequestMapping("/")
    public List<WorkerEntity> list(){
        return workerDao.getAllWorker();
    }


    @RequestMapping("/add")
    public MessageStatus addWorker(String name , int workerId , String dept ,
                                   String group , int routeId , int stationId){
        return workerDao.insert(workerId,routeId,stationId,name,dept,group);
    }


}
