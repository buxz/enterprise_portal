package com.buxz.enterprise_portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/front")
public class FrontController {

    @RequestMapping(value = "/{path}")
    public String path(@PathVariable String path) {
        return "front/" + path;
    }

    @RequestMapping(value = "/newsFrontDetail", method = RequestMethod.POST)
    public String newsFrontDetail(Integer newsId, Model model) {
        model.addAttribute("newsId", newsId);
        return "front/newsFrontDetail";
    }

}
