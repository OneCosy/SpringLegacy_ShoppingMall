package com.bit.dao;

import com.bit.dto.CartDTO;
import com.bit.dto.ProductDTO;
import com.bit.dto.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ShoppingDaoImp implements ShoppingDao {
    @Autowired
    private SqlSessionTemplate sqlSession;
    static String nameSpace = "com.bit.dto.cartMapper";

    @Override
    public String getIdCheck(UserDTO user) {

        return sqlSession.selectOne(nameSpace + ".getIdCheck", user);
    }

    @Override
    public int productAdminInsert(ProductDTO dto) {
        return sqlSession.insert(nameSpace+".productAdminInsert", dto);
    }

    @Override
    public int productAdminUpdate(ProductDTO dto) {
        return sqlSession.update(nameSpace + ".productAdminUpdate", dto);
    }

    @Override
    public int productAdminDelete(int no) {
        return sqlSession.delete(nameSpace + ".productAdminDelete", no);
    }

    @Override
    public List<ProductDTO> clientList() {
        return sqlSession.selectList(nameSpace + ".clientList");
    }

    @Override
    public List<ProductDTO> prodcutList(HashMap<String, Object> map) {
        return sqlSession.selectList(nameSpace+".productList", map);
    }

    @Override
    public ProductDTO productAdminInfo(int no) {
        return sqlSession.selectOne(nameSpace+".productAdminInfo", no);
    }

    @Override
    public List<ProductDTO> searchList(HashMap<String, Object> map) {
        return sqlSession.selectList(nameSpace + ".searchList", map);
    }

    @Override
    public List<ProductDTO> searchInsertList(HashMap<String, Object> map) {
        return sqlSession.selectList(nameSpace + ".searchInsertList", map);
    }

    @Override
    public void insertCartProduct(ProductDTO dto) {
        sqlSession.insert(nameSpace + ".insertCartProduct", dto);
    }

    @Override
    public List<CartDTO> cartList(HashMap<String, Object> map) {
        return sqlSession.selectList(nameSpace + ".selectCartList", map);
    }

    @Override
    public int deleteCart(int no) {
        return sqlSession.delete(nameSpace + ".deleteCartProduct", no);
    }
}
