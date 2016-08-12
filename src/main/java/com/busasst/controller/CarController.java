package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import com.busasst.dao.CarDao;
import com.busasst.util.DateTurn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
    public String addCar(String number, String brand, int seatnum, String registdate,
                         String  insurancedate, String vehiclelicense){
        MessageStatus ms = carDao.insert(number,brand,Integer.valueOf(seatnum),registdate,insurancedate,vehiclelicense);
        return "redirect:/car/list";
    }

    @RequestMapping(value = "/delete/{busId}" , method = RequestMethod.POST)
    public String deleteCar(@PathVariable("busId") int busId){
        carDao.deleteByX("busId",String.valueOf(busId));
        return "redirect:/car/list";
    }


    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    public String updateCar(String number, String brand, int seatnum, String registdate,
                            String insurancedate, String vehiclelicense , String oldNumber){

        carDao.updateCar(number,brand,Integer.valueOf(seatnum),registdate,insurancedate,
                        vehiclelicense,oldNumber);
        return "redirect:/car/list";
    }
}
