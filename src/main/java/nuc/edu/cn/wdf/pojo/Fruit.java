package nuc.edu.cn.wdf.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class Fruit {


    private int id;                 // 主键
    private String name;            // 水果名称
    private int num;                // 水果数量
    private double price;           // 水果价格
    private String description;     // 水果描述
    private String image;           // 水果图片路径

    public Fruit(int id, String name, double price, String description, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    // 构造方法
    public Fruit() { }

    public Fruit(String name, int num, double price, String description, String image) {
        this.name = name;
        this.num = num;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public Fruit(String name, double price, String description, String image) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.image=image;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Fruit{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", num=" + num +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    // 用于显示水果的基本信息
    public String getDetails() {
        return "名称: " + name + "\n" +
                "价格: " + price + "\n" +
                "描述: " + description;
    }
}
