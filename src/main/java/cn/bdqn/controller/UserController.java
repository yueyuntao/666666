package cn.bdqn.controller;

import cn.bdqn.pojo.User;
import cn.bdqn.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
public class UserController {

    @Resource
    private UserService userService;


    @GetMapping("/index.html")
    public String index_01(HttpSession session){
        List<User> list = userService.getListUser();
        session.setAttribute("list",list);
        return "index";
    }

    @GetMapping("/login.html")
    public String index_02(HttpSession session){
        return "login";
    }

    @GetMapping("/doLogin")
    @ResponseBody
    public Object index_03(@RequestParam("userCode") String userCode,
                           @RequestParam("userPassword")String userPassword){
        return userService.getByUserCodeAndUserPassword(userCode, userPassword);
    }

    @RequestMapping(value = "/setColor",method = RequestMethod.POST)
    @ResponseBody
    public Object index_04(){
        Random random=new Random();
        int i = random.nextInt(5);
        String str[]={"yellow", "red", "blue", "green", "gray"};
        String strs=str[i];
        return strs;
    }

    @RequestMapping(value = "/delUser/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Object index_05(@PathVariable Integer id){
        return userService.delUser(id);
    }

}
