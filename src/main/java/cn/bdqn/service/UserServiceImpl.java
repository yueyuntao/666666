package cn.bdqn.service;

import cn.bdqn.dao.UserMapper;
import cn.bdqn.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Integer delUser(Integer id) {
        Integer integer = null;
        try {
            integer = userMapper.delUser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return integer;
    }

    @Override
    public boolean getByUserCodeAndUserPassword(String userCode, String userPassword) {
        User user = null;
        try {
            user = userMapper.getByUserCode(userCode);
            if (user != null && user.getUserPassword().equals(userPassword)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User getByUserCode(String userCode) {
        User user = null;
        try {
            user = userMapper.getByUserCode(userCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> getListUser() {
        List<User> list = null;
        try {
            list = userMapper.getListUser();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
