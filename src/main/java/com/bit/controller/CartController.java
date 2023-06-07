package com.bit.controller;

import com.bit.dto.ProductDTO;
import com.bit.dto.UserDTO;
import com.bit.service.ShoppingService;
import com.bit.service.ShoppingServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
public class CartController {
    @Resource(name = "shoppingServiceImp")
    private ShoppingService service;

    @GetMapping("/login")
    public String loginView(@CookieValue(value = "id", required = false) Cookie cookie, Model model) { // 쿠키 생성 여부 확인
        if (cookie != null)
            model.addAttribute("id", cookie.getValue());

        return "cart/adminLogin";
    }

    @ResponseBody
    @RequestMapping(value = "loginCheck", method = RequestMethod.POST)
    public String loginCheckPro(String user_id, String user_passwd, String checker, HttpServletRequest request, HttpServletResponse response) {
        // login DBLOGIN CHECK
        // TRUE ----->
        System.out.println("id = " + user_id);
        System.out.println("pass = " + user_passwd);
        String dbPass = service.getIdCheck(new UserDTO(user_id, user_passwd));
        System.out.println("checker = " + checker);

        if (dbPass!=null && dbPass.equals(user_passwd)) {
            Cookie cookie = new Cookie("id", user_id);
            cookie.setMaxAge((checker!=null) ? 50 : 0);
            response.addCookie(cookie);
            request.setAttribute("checker", checker);
//            request.setAttribute("id", user_id);
            request.getSession().setAttribute("id", user_id);
            return "T";
        }
        else {
            return "F";
        }
    }

    @GetMapping("productAdd")
    public String productListProcess(HttpSession session, Model model) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id", session.getAttribute("id"));

        model.addAttribute("productList", service.productList(map));

        return "cart/productAdd";
    }

    @ResponseBody
    @PostMapping("productInsert")
    public int productAddProcess(ProductDTO dto, HttpSession session) {
        dto.setId((String)session.getAttribute("id"));
        return service.productAdminInsert(dto);
    }

    @RequestMapping(value ="clientProductList")
    public String clientListProcess(Model model) {
        model.addAttribute("productList", service.clientList());

        return "cart/productList";
    }

//    @RequestMapping(value = "loginProductList")
//    public String loginProductList(HttpSession session, Model model) {
//        HashMap<String, Object> map = new HashMap<String, Object>();
//        map.put("id", session.getAttribute("id"));
//        model.addAttribute("productList", service.productList(map));
//
//        return "cart/productList";
//    }

    @GetMapping("productInfo/{no}")
    public String productInfoProcess(@PathVariable("no")int no, HttpServletRequest request) {
        request.setAttribute("info", service.productAdminInfo(no));
        return "cart/productInfo";
    }

    @GetMapping(value = "cartAdd")
    public String cartAddProcess() {
        System.out.println("cartAddProcess");
        return "cart/cartList";
    }

    @ResponseBody
    @PostMapping("productModify")
    public ProductDTO getProduct(int no, HttpServletResponse response) {
        Cookie cookie = new Cookie("no", String.valueOf(no));
        cookie.setMaxAge(30);
        response.addCookie(cookie);
        return service.productAdminInfo(no);
    }

    @ResponseBody
    @PostMapping(value = "productDelete")
    public int productDelete(int no) {
        return service.productAdminDelete(no);
    }

    @ResponseBody
    @PostMapping(value = "productUpdate")
    public int productUpdate(ProductDTO dto, HttpServletRequest request, HttpSession session) {
        Cookie[] cookie = request.getCookies();

        if (cookie!=null && cookie.length>0) {
            for (int i=0; i<cookie.length; i++) {
                if (cookie[i].getName().trim().equalsIgnoreCase("no")) {
                    dto.setNo(Integer.parseInt(cookie[i].getValue()));
                }
            }
        }
        dto.setId((String)session.getAttribute("id"));
        System.out.println("dto : " + dto.toString());
        return service.productAdminUpdate(dto);
    }

    @RequestMapping(value ="searchListProcess", method = RequestMethod.POST)
    public String searchListProcess(@RequestParam("company") String company,
                                    @RequestParam("column") String column,
                                    @RequestParam("inputText") String inputText,
                                    Model model) {

        HashMap<String, Object> map = new HashMap<String, Object>();

        map.put("company", company);
        map.put("column", column);
        map.put("inputText", inputText);

        System.out.println("company = " + company);
        System.out.println("column = " + column);
        System.out.println("inputText = " + inputText);

        List<ProductDTO> productList = service.searchList(map);
        model.addAttribute("productList", productList);

        return "cart/productList";
    }

    @RequestMapping(value ="searchInsertListProcess", method = RequestMethod.POST)
    public String searchInsertListProcess(@RequestParam("company") String company,
                                          @RequestParam("inputText") String inputText,
                                          Model model) {

        HashMap<String, Object> map = new HashMap<String, Object>();

        map.put("company", company);
        map.put("inputText", inputText);

        System.out.println("company = " + company);
        System.out.println("inputText = " + inputText);

        List<ProductDTO> productList = service.searchInsertList(map);
        model.addAttribute("productList", productList);

        return "cart/productAdd";
    }
}
