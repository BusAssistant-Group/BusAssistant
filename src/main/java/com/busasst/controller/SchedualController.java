package com.busasst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2016/8/13.
 */
@Controller
@RequestMapping("/schedual")
public class SchedualController {

    @RequestMapping(value = "/watch" , method = RequestMethod.GET)
    public String watchSchedual(Model model){
        return "schedual-mng";
    }
}
