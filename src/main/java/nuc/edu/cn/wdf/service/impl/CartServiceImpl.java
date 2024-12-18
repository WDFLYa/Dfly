package nuc.edu.cn.wdf.service.impl;

import nuc.edu.cn.wdf.dao.CartDao;
import nuc.edu.cn.wdf.pojo.Cart;
import nuc.edu.cn.wdf.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {

    private CartDao cartDao;

    // 构造方法注入 CartDao
    public CartServiceImpl(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    // 向购物车添加商品
    @Override
    public boolean addCart(Cart cart) {
        // 调用 CartDao 的 addCart 方法
        return cartDao.addCart(cart);
    }

    // 根据购物车 ID 删除商品
    @Override
    public boolean removeCart(int cartId) {
        // 调用 CartDao 的 removeCart 方法
        return cartDao.removeCart(cartId);
    }

    // 更新购物车中商品的数量
    @Override
    public boolean updateQuantity(int cartId, int newQuantity) {
        // 调用 CartDao 的 updateQuantity 方法
        return cartDao.updateQuantity(cartId, newQuantity);
    }

    // 根据用户 ID 获取该用户的购物车
    @Override
    public List<Cart> getCartByUserId(int userId) {
        // 调用 CartDao 的 getCartByUserId 方法
        return cartDao.getCartByUserId(userId);
    }

    // 根据购物车 ID 获取购物车条目的详细信息
    @Override
    public Cart getCartById(int cartId) {
        // 调用 CartDao 的 getCartById 方法
        return cartDao.getCartById(cartId);
    }

    @Override
    public int countCartItem(int userId, int fruitId) {
        return cartDao.countCartItem(userId,fruitId);
    }

}
