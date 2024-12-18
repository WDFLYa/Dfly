package nuc.edu.cn.wdf.pojo;

import java.sql.Timestamp;  // 引入 java.sql.Timestamp

public class Order {

    private int userId;

    @Override
    public String toString() {
        return "Order{" +
                "userId=" + userId +
                ", createTime=" + createTime +
                ", orderDetails='" + orderDetails + '\'' +
                ", totalAmount=" + totalAmount +
                '}';
    }

    public Order() {
    }

    private Timestamp createTime;  // 使用 java.sql.Timestamp

    public Order(String orderDetails, double totalAmount, int user_id) {
        this.orderDetails = orderDetails;
        this.totalAmount = totalAmount;
        this.userId = user_id;
    }

    public Timestamp getCreateTime() {  // 修改 getter 方法
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {  // 修改 setter 方法
        this.createTime = createTime;
    }

    public String getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(String orderDetails) {
        this.orderDetails = orderDetails;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    // 订单详情
    private String orderDetails;
    // 总金额
    private double totalAmount;

    public Order(Timestamp createTime, String orderDetails, double totalAmount) {
        this.createTime = createTime;
        this.orderDetails = orderDetails;
        this.totalAmount = totalAmount;
    }



    public int getUser_id() {
        return userId;
    }

    public void setUser_id(int user_id) {
        this.userId = user_id;
    }
}
