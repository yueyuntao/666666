package cn.bdqn.service;

import cn.bdqn.pojo.User;

import java.util.List;

public interface UserService {

    List<User> getListUser();

    User getByUserCode(String userCode);

    boolean getByUserCodeAndUserPassword(String userCode,String userPassword);

    Integer delUser(Integer id);
}
