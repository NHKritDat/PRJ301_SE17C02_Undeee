package fpt.fu.prj301_se17c02_undeee.controllers.email;


import java.util.Objects;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author kienb
 */
public class UserDTO {
    private String email;
    private String code;

    public UserDTO() {
    }

    public UserDTO(String email, String code) {
        this.email = email;
       
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    
}
