package com.busasst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by sl on 16-8-15.
 */
@Controller
@RequestMapping("/static")
public class StaticController {

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpSession session) {
        session.setAttribute("activeId",5);
        return "statistics";
    }
}
