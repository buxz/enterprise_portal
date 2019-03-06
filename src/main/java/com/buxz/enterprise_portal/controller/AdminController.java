package com.buxz.enterprise_portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String index() {

        return "admin/login";
    }

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news() {

        return "admin/news";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {

        return "admin/logout";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users() {

        return "admin/adminUser";
    }

    @RequestMapping(value = "/newsAdd", method = RequestMethod.GET)
    public String newsAdd() {

        return "admin/newsAdd";
    }

    @RequestMapping(value = "/newsEdit", method = RequestMethod.GET)
    public String newsEdit() {

        return "admin/newsEdit";
    }

    @RequestMapping(value = "/newsDel", method = RequestMethod.GET)
    public String newsDel(int NewsID, Model model) {

        model.addAttribute("NewsID",NewsID);
        return "admin/newsDel";
    }


}
