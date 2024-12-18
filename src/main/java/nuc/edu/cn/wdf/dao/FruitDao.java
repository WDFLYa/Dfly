package nuc.edu.cn.wdf.dao;

import nuc.edu.cn.wdf.pojo.Fruit;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FruitDao {
    List<Fruit> findAllFruits();
    Fruit findFruitByName(String name);
    List<Fruit> findFruitByKeyword(String keyword);
    Fruit findFruitById(int id);
    public void deleteFruitByName(String name);
    public void deleteFruitById(int id);

    void addFruit(Fruit fruit);
    void updateFruit(Fruit fruit);

}
