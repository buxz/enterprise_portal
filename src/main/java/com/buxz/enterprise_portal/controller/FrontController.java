package com.buxz.enterprise_portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/front")
public class FrontController {

    @RequestMapping(value = "/{path}", method = RequestMethod.POST)
    public String path(@PathVariable String path) {
        return "admin/" + path;
    }

    @RequestMapping(value = "/newsFrontDetail", method = RequestMethod.POST)
    public String newsFrontDetail(Integer newsId, Model model) {
        model.addAttribute("newsId", newsId);
        return "admin/newsFrontDetail";
    }

}
