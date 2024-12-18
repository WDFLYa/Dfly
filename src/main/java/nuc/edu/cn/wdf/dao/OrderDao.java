package nuc.edu.cn.wdf.dao;

import nuc.edu.cn.wdf.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface OrderDao {
    List<Order> findByUserId(int userId);
    void createOrder(Order order);
}
