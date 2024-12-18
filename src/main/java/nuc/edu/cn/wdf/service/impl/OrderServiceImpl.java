package nuc.edu.cn.wdf.service.impl;

import nuc.edu.cn.wdf.dao.OrderDao;
import nuc.edu.cn.wdf.pojo.Order;
import nuc.edu.cn.wdf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
   private OrderDao orderDao;
    @Override
    public List<Order> findByUserId(int userId) {

        return orderDao.findByUserId(userId);
    }

    @Override
    public void createOrder(Order order) {
        orderDao.createOrder(order);
    }
}
