package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.pojo.Fruit;
import nuc.edu.cn.wdf.service.FruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/administrator")
public class wdfAdministratorController {

    @Autowired
    private FruitService fruitService;
    @GetMapping("/AdministratorPage")
    public String showAdministratorPage(){
        return "Administrator/manage";
    }

    @GetMapping("/ListFruitPage")
    public String listfruitPage(Model model){

        List<Fruit> fruits;
        fruits = fruitService.findAllFruits();
        model.addAttribute("fruits", fruits);
        return "Administrator/list";
    }
    @GetMapping("/DeleteFruitPage")
    public String deletefruitpage(Model model){
        List<Fruit> fruits;
        fruits = fruitService.findAllFruits();
        model.addAttribute("fruits", fruits);
        return "Administrator/delete";

    }
    @PostMapping("/delete")
    public String deletefruit(@RequestParam(required = false) Integer id){



        fruitService.deleteFruitById(id);

        return "redirect:/administrator/DeleteFruitPage";

    }


    @GetMapping("/UpdateFruitPage")
    public String updatefruitpage(Model model){

        List<Fruit> fruits;
        fruits = fruitService.findAllFruits();
        model.addAttribute("fruits", fruits);
        return "Administrator/update";

    }
    @PostMapping("/update")
    public String updateFruit(@RequestParam(required = false) Integer id,
                              @RequestParam(required = false) String name,
                              @RequestParam(required = false) double price,
                              @RequestParam(required = false) String description,
                              @RequestParam(required = false) String image) {

        Fruit fruit = new Fruit(id, name, price, description, image);
        fruitService.updateFruit(fruit);
        return "redirect:/administrator/UpdateFruitPage";
    }

@GetMapping("AddFruitPage")
public String addfruitpage(){

        return "Administrator/add";
}
    @PostMapping("/add")
    public String addFruit(@RequestParam String name,
                           @RequestParam double price,
                           @RequestParam String description,
                           @RequestParam String image) {
        // 打印参数检查传递的值是否正确
        System.out.println("Received name: " + name);
        System.out.println("Received price: " + price);
        System.out.println("Received description: " + description);
        System.out.println("Received image: " + image);

        // 创建新的商品对象并设置属性
        Fruit fruit = new Fruit(name, price, description, image);
System.out.println(fruit.toString());
        // 调用 service 层方法添加商品
        fruitService.addFruit(fruit);

        // 重定向到添加页面或商品列表页面
        return "redirect:/administrator/AddFruitPage";  // 或者可以直接重定向到商品列表页面
    }

    @GetMapping("uploadFruitPage")
    public String uploadfruitpage(){

        return "Administrator/upload";
    }


    /**
     * 打开文件上传请求页面
     *
     * @return 指向JSP的字符串
     */

    @PostMapping("/image")
    @ResponseBody
// 使用Spring MVC的MultipartFile类作为参数，对应了保存的临时文件
    public Map<String, Object> upload(@RequestParam("photo") MultipartFile
                                              photo){
        String path = "D:/2024Y/progect/spwk/src/main/webapp/static/images/";//保存路径
// String filename=photo.getOriginalFilename();
        String filename = photo.getOriginalFilename().substring(0, photo.getOriginalFilename().lastIndexOf("."));;  // 获取文件名



        //获取上传文件的后缀suffix
        String suffix =
                photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
        if (!suffix.equals(".jpg")) {
            return dealResultMap(false, "上传失败");
//throw new RuntimeException("无效的图片格式");
        }
        try {
            //Spring提供了文件操作类FileCopyUtils
            FileCopyUtils.copy(photo.getInputStream(), new FileOutputStream(path + filename + suffix));
        } catch (IOException e) {
// TODO Auto-generated catch block
            e.printStackTrace();return dealResultMap(false, "上传失败");
        }
        return dealResultMap(true, "上传成功");
    }
    // 处理上传文件结果
    private Map<String, Object> dealResultMap(boolean success, String msg)
    {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", success);
        result.put("msg", msg);
        return result;
    }
}
