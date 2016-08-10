package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import com.busasst.entity.WorkerEntity;
import com.busasst.dao.WorkerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by sl on 16-8-2.
 */
@Controller
@RequestMapping("/worker")
public class WorkerController {


    @Autowired
    private WorkerDao workerDao;

    @RequestMapping("/list")
    public String list(Model model){
        model.addAttribute("workers",workerDao.getAllWorker());
        return "workers-mng";
    }

    //@ResponseBody
    @RequestMapping("/add")
    public String addWorker(String name , int workerId , String dept ,
                                   String group , int routeId , int stationId){
        MessageStatus ms = workerDao.insert(workerId, routeId, stationId, name, dept, group);
        System.out.println("-----addWorker----- "+name+" "+dept);
        return "redirect:/worker/list";
    }

    @RequestMapping(value = "/delete/{id}" , method = RequestMethod.POST)
    public String deleteWorker(@PathVariable("id") int id){
        workerDao.deleteByX("workerId", String.valueOf(id));
        return "redirect:/worker/list";
    }


}
