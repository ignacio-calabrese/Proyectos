package model;

import com.PGConnector;

public class Products{

    protected int code;
    protected String name;
    protected String description;
    protected int stock;

    public Products(int code, String name, String description, int stock) {
        this.code = code;
        this.name = name;
        this.description = description;
        this.stock = stock;
    }
    public int getCode(){
        return code;
    }

    public void setCode(int code){
        this.code = code;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public int getStock(){
        return stock;
    }

    public void setStock(int stock){
        this.stock = stock;
    }
}
