package com.dfxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class CenterController {
    @ResponseBody
    @RequestMapping("/index")
    public String index(){
        return "Hello SpringBoot";
    }
}
