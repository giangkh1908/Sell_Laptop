
package model;

import java.util.Date;

public class Order {

    private int id;
    private Date date;
    private Customer customer;
    private double totalmoney;

    public Order() {
    }

    public Order(int id, Date date, Customer customer, double totalmoney) {
        this.id = id;
        this.date = date;
        this.customer = customer;
        this.totalmoney = totalmoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    @Override
    public String toString() {
        if (customer != null && customer.getAdmin() != null) {
            return "Order{"
                    + "id=" + id
                    + ", date=" + date
                    + ", customer=" + customer.getAdmin().getRole()
                    + ", totalmoney=" + totalmoney
                    + '}';
        } else {
            return "Order{"
                    + "id=" + id
                    + ", date=" + date
                    + ", customer=null"
                    + ", totalmoney=" + totalmoney
                    + '}';
        }
    }

}
