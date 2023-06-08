package com.bit.service;

import com.bit.dto.CartDTO;
import com.bit.dto.ProductDTO;
import com.bit.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

public interface ShoppingService {

    public String getIdCheck(UserDTO user);
    public int productAdminInsert(ProductDTO dto);
    public int productAdminUpdate(ProductDTO dto);
    public int productAdminDelete(int no);
    public ProductDTO productAdminInfo(int no);
    public List<ProductDTO> clientList();
    public List<ProductDTO> productList(HashMap<String, Object> map);
    public List<ProductDTO> searchList(HashMap<String, Object> map);
    public List<ProductDTO> searchInsertList(HashMap<String, Object> map);
    public void insertCartProduct(ProductDTO dto);
    public List<CartDTO> cartList(HashMap<String, Object> map);
    public int deleteCart(int no);
}
