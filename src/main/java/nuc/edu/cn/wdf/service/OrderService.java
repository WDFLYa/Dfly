package nuc.edu.cn.wdf.service;

import nuc.edu.cn.wdf.pojo.Order;

import java.util.List;

public interface OrderService {
    List<Order> findByUserId(int userId);
    void createOrder(Order order);

}
