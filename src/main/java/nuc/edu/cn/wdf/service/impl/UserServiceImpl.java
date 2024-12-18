package nuc.edu.cn.wdf.service.impl;

import nuc.edu.cn.wdf.pojo.User;
import nuc.edu.cn.wdf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import nuc.edu.cn.wdf.dao.UserDao;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();  // 调用 UserDao 层的方法查询所有用户
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);  // 调用 UserDao 层的方法添加用户
    }

    @Override
    public void deleteUserByUserName(String userName) {
        userDao.deleteUserByUserName(userName);  // 调用 UserDao 层的方法删除用户
    }
    @Override
    public User findUserByUserName(String userName){
        userDao.findUserByUserName(userName);
        return userDao.findUserByUserName(userName);
    }

    @Override
    public User findUserByUserId(int id) {
        userDao.findUserByUserId(id);
        return userDao.findUserByUserId(id);
    }

    @Override
    public double getMoneyById(int userId) {
        return userDao.getMoneyById(userId);
    }
    @Override
    public void updateMoneyById(int userId, double newMoney) {
        userDao.updateMoneyById(userId, newMoney);
    }

    @Override
    public void updateuserById(int userId, String userName, String password) {
        userDao.updateuserById(userId,userName,password);
    }
}
