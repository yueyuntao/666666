package cn.bdqn.dao;

import cn.bdqn.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface UserMapper {


    @Select("select * from smbms_user")
    List<User> getListUser();

    @Select("select  * from smbms_user where userCode=#{userCode}")
    User getByUserCode(@Param("userCode") String userCode);

    @Delete("delete from smbms_user where id=#{id}")
    Integer delUser(Integer id);


}
