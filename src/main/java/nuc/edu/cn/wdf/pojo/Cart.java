package nuc.edu.cn.wdf.pojo;


    public class Cart {
        private int id;
        private int userId;  // 用户 ID
        private double price;
        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }



        public Cart(int userId, int fruitId, int quantity,double price) {
            this.userId = userId;
            this.fruitId = fruitId;
            this.quantity = quantity;
            this.price = price;
        }

        private int fruitId; // 水果 ID
        private int quantity; // 数量
        private String name;            // 水果名称



        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
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

        private String description;     // 水果描述
        private String image;           // 水果图片路径


        public Cart(){};
        // 构造方法
        public Cart(int id, int userId, int fruitId, int quantity) {
            this.id = id;
            this.userId = userId;
            this.fruitId = fruitId;
            this.quantity = quantity;
        }

        // Getter 和 Setter
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }

        public int getFruitId() {
            return fruitId;
        }

        public void setFruitId(int fruitId) {
            this.fruitId = fruitId;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }
    }

