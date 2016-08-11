package com.busasst.controller;

import com.busasst.dao.CarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
