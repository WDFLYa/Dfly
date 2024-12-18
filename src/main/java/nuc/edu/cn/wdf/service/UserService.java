package nuc.edu.cn.wdf.service;

import nuc.edu.cn.wdf.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findAllUser();
    void addUser(User user);
    void deleteUserByUserName(String userName);
    User findUserByUserName(String userName);
    User findUserByUserId(int id);
    double getMoneyById(int id);
    void updateMoneyById(int id, double money);
    void updateuserById(int id,String userName,String password);

}
