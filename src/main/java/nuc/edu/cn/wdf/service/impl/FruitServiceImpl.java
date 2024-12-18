package nuc.edu.cn.wdf.service.impl;

import nuc.edu.cn.wdf.pojo.Fruit;
import nuc.edu.cn.wdf.service.FruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import nuc.edu.cn.wdf.dao.FruitDao;

import java.util.List;

@Service
public class FruitServiceImpl implements FruitService {

    @Autowired
    private FruitDao fruitDao;

    // 查询所有水果
    @Override
    public List<Fruit> findAllFruits() {
        return fruitDao.findAllFruits();  // 调用 FruitDao 层的方法查询所有水果
    }

    // 根据名称查询水果
    @Override
    public Fruit findFruitByName(String name) {
        return fruitDao.findFruitByName(name);  // 调用 FruitDao 层的方法根据名称查询水果
    }

    @Override
    public Fruit findFruitById(int id) {
        return fruitDao.findFruitById(id);
    }

    // 添加水果
    @Override
    public void addFruit(Fruit fruit) {
        fruitDao.addFruit(fruit);  // 调用 FruitDao 层的方法添加水果
    }

    // 更新水果信息
    @Override
    public void updateFruit(Fruit fruit) {
        fruitDao.updateFruit(fruit);  // 调用 FruitDao 层的方法更新水果信息
    }

    @Override
    public List<Fruit>findFruitByKeyword(String keyword) {
        return fruitDao.findFruitByKeyword(keyword);
    }

    // 根据名称删除水果
    @Override
    public void deleteFruitByName(String name) {
        fruitDao.deleteFruitByName(name);  // 调用 FruitDao 层的方法根据名称删除水果
    }

    @Override
    public void deleteFruitById(int id) {
        fruitDao.deleteFruitById(id);
    }
}
