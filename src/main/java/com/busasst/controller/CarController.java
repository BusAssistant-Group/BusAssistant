package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import com.busasst.dao.CarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Timestamp;

/**
 * Created by sl on 16-8-11.
 */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarDao carDao;

    @RequestMapping("/list")
    public String list(Model model){
        model.addAttribute("cars",carDao.getAll());
        return "cars-mng";
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST)
    public String addCar(String number, String brand, int seatnum, Timestamp registdate,
                         Timestamp insurancedate, String vehiclelicense){
        MessageStatus ms = carDao.insert(number,brand,Integer.valueOf(seatnum),registdate,insurancedate,vehiclelicense);
        return "cars-mng";
    }
}
