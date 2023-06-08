package com.bit.service;

import com.bit.dao.ShoppingDao;
import com.bit.dto.CartDTO;
import com.bit.dto.ProductDTO;
import com.bit.dto.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Service
public class ShoppingServiceImp implements ShoppingService {
    @Autowired
    SqlSessionTemplate sqlSession;
    static String nameSpace = "com.bit.dto.cartMapper";

//    @Resource(name="shoppingDaoImp")
    @Autowired
    private ShoppingDao dao;

    @Override
    public String getIdCheck(UserDTO user) {
        return dao.getIdCheck(user);
    }

    @Override
    public int productAdminInsert(ProductDTO dto) {
        return checkFileName(dto) ? dao.productAdminInsert(dto) : 0;
    }

    private boolean checkFileName(ProductDTO dto) {
        if (!dto.getFile().isEmpty()) {
            File file = new File("C:\\SpringLegacy_ShoppingMall\\src\\main\\webapp\\resources\\upload\\",
                    dto.getFile().getOriginalFilename());
            try {
                dto.getFile().transferTo(file);
                dto.setProductFilename(file.getName());
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }
        return true;
    }

    @Override
    public int productAdminUpdate(ProductDTO dto) {
        return checkFileName(dto) ? dao.productAdminUpdate(dto) : 0;
    }

    @Override
    public int productAdminDelete(int no) {
        return dao.productAdminDelete(no);
    }

    @Override
    public List<ProductDTO> clientList() {
        return dao.clientList();
    }

    @Override
    public List<ProductDTO> productList(HashMap<String, Object> map) {
        return dao.prodcutList(map);
    }

    @Override
    public ProductDTO productAdminInfo(int no) {
        return dao.productAdminInfo(no);
    }

    @Override
    public List<ProductDTO> searchList(HashMap<String, Object> map) {
        return dao.searchList(map);
    }

    @Override
    public List<ProductDTO> searchInsertList(HashMap<String, Object> map) {
        return dao.searchInsertList(map);
    }

    @Override
    public void insertCartProduct(ProductDTO dto) {
        dao.insertCartProduct(dto);
    }

    @Override
    public List<CartDTO> cartList(HashMap<String, Object> map) {
        return dao.cartList(map);
    }

    @Override
    public int deleteCart(int no) {
        return dao.deleteCart(no);
    }
}
