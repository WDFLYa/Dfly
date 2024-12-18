package nuc.edu.cn.wdf.service;

import nuc.edu.cn.wdf.pojo.Cart;

import java.util.List;
import java.util.Map;

public interface CartService {
    // 向购物车添加商品
    boolean addCart(Cart cart);

    // 根据购物车 ID 删除商品
    boolean removeCart(int cartId);

    // 更新购物车中商品的数量
    boolean updateQuantity(int cartId, int newQuantity);

    // 根据用户 ID 获取该用户的购物车
    List<Cart> getCartByUserId(int userId);

    // 根据购物车 ID 获取购物车条目的详细信息
    Cart getCartById(int cartId);
    int countCartItem(int userId,int fruitId); // 返回匹配的记录数
}
