package model;

/**
 *
 * @author KimHo
 */
public class Customer {

    private double amount;
    private Admin admin;

    public Customer() {
    }

    public Customer(double amount, Admin admin) {
        this.amount = amount;
        this.admin = admin;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
    
  
    public int getAdminId() {
        return admin != null ? admin.getRole() : -1; // Hoặc giá trị mặc định phù hợp
    }

    @Override

    public String toString() {
        if (admin != null) {
            return "Customer{" + "amount=" + amount + ", adminRole=" + admin.getRole() + "}";
        } else {
            return "Customer{" + "amount=" + amount + ", admin=null}";
        }
    }

}
