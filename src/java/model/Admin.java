/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KimHo
 */
public class Admin {
    private String fullname, username, password;
    private int role;

    public Admin() {
    }

    public Admin(String username, String password) {
    this(null, username, password, 0);
    }
    public Admin(String fullname, String username, String password, int role) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    

    


    
}
