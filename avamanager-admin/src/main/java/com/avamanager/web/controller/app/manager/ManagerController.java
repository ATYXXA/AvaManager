package com.avamanager.web.controller.app.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/manager")
public class ManagerController {
    @GetMapping()
    public String index(){
        return "/app/manager/index";
    }
}
