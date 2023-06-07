package com.bit.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Getter @Setter
public class ProductDTO {
    private int no;
    private String productName;
    private String productOrigin;
    private int productPrice;
    private String productCategory;
    private String productFilename;
    private MultipartFile file;
    private String id;
    private String today;
    private String seller;
    private String companyName;

    public ProductDTO() {
    }

    public ProductDTO(int no, String productName, String productOrigin, int productPrice, String productCategory, String productFilename, MultipartFile file, String id, String today, String seller, String companyName) {
        this.no = no;
        this.productName = productName;
        this.productOrigin = productOrigin;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.productFilename = productFilename;
        this.file = file;
        this.id = id;
        this.today = today;
        this.seller = seller;
        this.companyName = companyName;
    }

    @Override
    public String toString() {
        return "ProductDTO{" +
                "no=" + no +
                ", productName='" + productName + '\'' +
                ", productOrigin='" + productOrigin + '\'' +
                ", productPrice=" + productPrice +
                ", productCategory='" + productCategory + '\'' +
                ", productFilename='" + productFilename + '\'' +
                ", file=" + file +
                ", id='" + id + '\'' +
                ", today='" + today + '\'' +
                ", seller='" + seller + '\'' +
                ", companyName='" + companyName + '\'' +
                '}';
    }
}
