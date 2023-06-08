package com.bit.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Repository
@Getter @Setter @ToString
public class CartDTO {
    private int no;
    private String id;
    private String productName;
    private String productFilename;
    private String productOrigin;
    private String productPrice;
    private String productCategory;
    private String regDate;
}
