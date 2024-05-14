package dal;

import model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Customer;
import model.Order;
import model.OrderLine;
import model.Product;

/**
 *
 * @author KimHo
 */
public class DAO extends DBContext {
    // xac thuc ( ktra xem m co tai khoan dang nhap khong)

// Trong lớp DAO:
    public Admin checkAuthen(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Lấy fullname và role từ ResultSet
                String fullname = rs.getString("fullname");
                int role = rs.getInt("role");
                // Trả về một đối tượng Admin với username, password, fullname và role
                return new Admin(fullname, username, password, role);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // tao tai khoan
    public void add(Admin a) {
        String sql = "insert into admin values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getFullname());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPassword());
            st.setInt(4, a.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // thay doi thong tin

    public void changeAccount(Admin a) {
        String sql = "UPDATE Admin SET Password=?, Fullname=? WHERE Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getFullname());
            st.setString(3, a.getUsername());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkUser(String username) {
        String sql = "select * from admin where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // get admin by ruleId
    public Admin getAdminById(int role) {
        String sql = "select * from Admin where role=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString("fullname"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    //doc ca bang categories
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"),
                        rs.getString("describe"));
                list.add(c);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Categories where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("describe"));
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // doc ca bang product
    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // search
    public List<Product> searchProducts(String keyword) {
        List<Product> searchResults = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE name LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        c
                );
                searchResults.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }

    // 3 sản phẩm đắt tiền nhất
    public List<Product> getMaxProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 [id]\n"
                + "      ,[name]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[describe]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products]\n"
                + "	ORDER BY price DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    // 3 sản phẩm rẻ tiền nhất

    public List<Product> getMinProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 [id]\n"
                + "      ,[name]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[describe]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products]\n"
                + "	ORDER BY price ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // 3 sản phẩm acer mới nhất
    public List<Product> get3AcerProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * \n"
                + "  FROM [dbo].[Products]\n"
                + "  where cid = 1\n"
                + "  ORDER BY id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // 3 sản phẩm Mac mới nhất
    public List<Product> get3MacProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * \n"
                + "  FROM [dbo].[Products]\n"
                + "  where cid = 5\n"
                + "	ORDER BY id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // phân trang
    public List<Product> getProductByIndex(int indexPage) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] \n"
                + "  order by cid\n"
                + "  offset ? rows fetch next 9 rows only\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (indexPage - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByPage(int start, int limit) {

        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products LIMIT ?, ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, start - 1); // start từ 1
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // đếm tổng số sản phẩm 
    public int countAllProduct() {
        String sql = "select count(*) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }
    // tìm kiếm sản phẩm 

    public List<Product> getProductsUnder500() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE price < 500";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProducts500to1500() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE price >= 500 AND price <= 1500";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsAbove1500() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE price > 1500";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //them vao
    public void insert(Category c) {
        String sql = "insert into categories values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescribe());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void delete(int id) {
        String sql = "delete from categories where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    //update
    public void update(Category c) {
        String sql = "update categories set name=?,describe=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescribe());
            st.setInt(3, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public Product getProductsById(String id) {
        String sql = "select * from products where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"), c);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Product> getProductsById(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products where id=?";
        if (cid != 0) {
            sql += "and cid=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByCheck(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products where id=?";
        if (cid != null && cid[0] != 0) {
            sql += "and cid in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //insert
    public void insertP(Product p) {
        String sql = "insert into products values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getName());
            st.setInt(3, p.getQuantity());
            st.setDouble(4, p.getPrice());
            st.setString(5, p.getDescribe());
            st.setString(6, p.getImage());
            st.setInt(7, p.getCategory().getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    //delete
    public void deleteP(String id) {
        String sql = "delete from products where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    //update
    public void updateP(Product p) {
        String sql = "update products set name=?,quantity=?,price=?,"
                + " describe=?,image=?,cid=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getQuantity());
            st.setDouble(3, p.getPrice());
            st.setString(4, p.getDescribe());
            st.setString(5, p.getImage());
            st.setInt(6, p.getCategory().getId());
            st.setString(7, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public List<Product> getProductsSortedByPriceAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ORDER BY price ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        c
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ORDER BY price DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        c
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // tim kiem theo category
    public List<Product> getProductsByCid(String cid) {
        String sql = "select * from Products\n"
                + "where cid=?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    // detail products

    public Product getProductsUploadDetail(String id) {
        String sql = "select * from Products\n"
                + "where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"), c);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }
// Phương thức lấy category id từ sản phẩm

    public int getCategoryID(String pid) {
        String sql = "select cid from Products\n"
                + "where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("cid");
            }
        } catch (SQLException e) {

        }
        return -1;
    }

    // lay san pham theo cid
    public List<Product> getProductsByCid(int cid) {
        String sql = "select top 3 * from Products\n"
                + "where cid=?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("cid"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    // get customer

    public Customer getCustomer(int role) {
        String sql = "select * from Customer where role=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = getAdminById(rs.getInt("role"));
                Customer c = new Customer(rs.getDouble("amount"), a);
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // lay hoa don
    public Order getOrderById(int id) {
        String sql = "select * from [Order] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = getCustomer(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        rs.getDate("date"),
                        c,
                        rs.getDouble("totalmoney"));
                return o;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // list order detail
    public List<OrderLine> getOrderLine() {
        List<OrderLine> list = new ArrayList<>();
        String sql = "SELECT p.id, SUM(o.quantity) AS totalProduct "
                + "FROM OrderLine o INNER JOIN Products p ON o.pid = p.id "
                + "GROUP BY p.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductsById(rs.getString("id"));
                int totalProduct = rs.getInt("totalProduct"); // Lấy giá trị từ cột "totalProduct"
                OrderLine ol = new OrderLine(p, null, totalProduct, 0); // Đối tượng Order không được sử dụng ở đây
                list.add(ol);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    //test
    public List<OrderLine> getOrderLine1() {
        List<OrderLine> list = new ArrayList<>();
        String sql = "  SELECT p.name, o.date, SUM(o.quantity) AS totalProduct \n"
                + "                FROM OrderLine o \n"
                + "                INNER JOIN Products p ON o.pid = p.id \n"
                + "                GROUP BY  p.name, o.date";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                OrderLine ol = new OrderLine(p, rs.getInt("totalProduct"));
                list.add(ol);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi tại đây
        }

        return list;
    }
    public List<OrderLine> getOrderLine2() {
        List<OrderLine> list = new ArrayList<>();
        String sql = "  SELECT p.name, SUM(o.quantity) AS totalProduct \n"
                + "                FROM OrderLine o \n"
                + "                INNER JOIN Products p ON o.pid = p.id \n"
                + "                GROUP BY  p.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                OrderLine ol = new OrderLine(p, rs.getInt("totalProduct"));
                list.add(ol);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi tại đây
        }

        return list;
    }

    // doc ca bang order
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = getCustomer(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        rs.getDate("date"),
                        c,
                        rs.getDouble("totalmoney"));
                list.add(o);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // tong money
    public double getTotalMoney(List<Order> orders) {
        double totalMoney = 0;
        for (Order order : orders) {
            totalMoney += order.getTotalmoney();
        }
        return totalMoney;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Order> list = d.getAllOrder();
        for (Order o : list) {
            System.out.println(o);
        }
    }
}
