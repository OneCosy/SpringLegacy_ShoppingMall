package com.bit.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

@Repository
@Getter @Setter
public class UserDTO {
    private int no;
    private String id;
    private String password;
    private String name;

    public UserDTO() {
    }

    public UserDTO(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public UserDTO(int no, String id, String password, String name) {
        this.no = no;
        this.id = id;
        this.password = password;
        this.name = name;
    }


}
