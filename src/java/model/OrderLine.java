
package model;

/**
 *
 * @author KimHo
 */
public class OrderLine {
    private Product product;
    private Order order;
    private int quantity;
    private double price;

    public OrderLine() {
    }
    
    public OrderLine(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    public OrderLine(Product product, Order order, int quantity, double price) {
        this.product = product;
        this.order = order;
        this.quantity = quantity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderLine{" + "product=" + product + ", order=" + order + ", quantity=" + quantity + ", price=" + price + '}';
    }



    
}
