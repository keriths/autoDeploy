package com.krs.backend.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by fanshuai on 17/1/20.
 */
@Controller
public class IndexAction {
    @RequestMapping(value = "/")
    public String index(){
        return "mainFrame";
    }
}
