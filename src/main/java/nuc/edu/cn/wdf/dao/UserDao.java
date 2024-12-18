package nuc.edu.cn.wdf.dao;

import nuc.edu.cn.wdf.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface UserDao {
    List<User> findAllUser();
    void addUser(User user);
    void deleteUserByUserName(String userName);
    User findUserByUserName(String userName);
    User findUserByUserId(int id);
    // 根据 id 查询 money，返回 double 类型
    double getMoneyById(int id);
    void updateMoneyById(int id, double money);
    void updateuserById(int id,String userName,String password);
}
