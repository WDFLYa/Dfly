package nuc.edu.cn.wdf.service;

import nuc.edu.cn.wdf.pojo.Fruit;

import java.util.List;

public interface FruitService {
    List<Fruit> findAllFruits();
    Fruit findFruitByName(String name);
    Fruit findFruitById(int id);
    public void deleteFruitByName(String name);
    public void deleteFruitById(int id);

    void addFruit(Fruit fruit);
    void updateFruit(Fruit fruit);
    List<Fruit> findFruitByKeyword(String keyword);
}
