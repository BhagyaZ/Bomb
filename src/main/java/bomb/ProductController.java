package bomb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductController {

    private static boolean isSuccess;
    private static Connection con=null;
    private static Statement stmt=null;
    private static ResultSet rs=null;

    public static boolean insertdata(String name,String category,String price,String quantity,String description){
        boolean isSuccess = false;

        try{
            con= DBConnectionPM.getConnection();
            stmt=con.createStatement();


            String sql ="insert into products values(0,'"+name+"','"+category+"','"+price+"','"+quantity+"','"+description+"')";
            int rs=stmt.executeUpdate(sql);

            if(rs>0){
                isSuccess=true;
            }
            else{
                isSuccess=false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return isSuccess;

    }

    public static List<ProductModel> getById (String Id){
        int convertID = Integer.parseInt(Id);

        ArrayList <ProductModel> product = new ArrayList<>();

        try{
            con= DBConnectionPM.getConnection();
            stmt=con.createStatement();

            String sql="select * from products where id='"+convertID+"'";
            rs=stmt.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String category = rs.getString(3);
                String price = rs.getString(4);
                String quantity = rs.getString(5);
                String description = rs.getString(6);

                ProductModel p = new ProductModel(id,name,category,price,quantity,description);
                product.add(p);


            }

        }
        catch(Exception e){
            e.printStackTrace();

        }
        return product;

    }
    public static List<ProductModel> getAll(){
        ArrayList <ProductModel> products = new ArrayList<>();
        try{
            con= DBConnectionPM.getConnection();
            stmt=con.createStatement();

            String sql="select * from products";
            rs=stmt.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String category = rs.getString(3);
                String price = rs.getString(4);
                String quantity = rs.getString(5);
                String description = rs.getString(6);


                ProductModel p = new ProductModel(id,name,category,price,quantity,description);
                products.add(p);




            }

        }
        catch(Exception e){
            e.printStackTrace();

        }
        return products;
    }
    public static boolean updatedata(String name,String category,String price,String quantity,String description, String id){
        System.out.println(name);
        System.out.println(category);
        System.out.println(price);

        try {
            con = DBConnectionPM.getConnection();
            stmt = con.createStatement();

            // Use PreparedStatement to avoid SQL injection
            String sql = "UPDATE products SET name = ?, category = ?, price = ?, quantity = ?, description = ? WHERE product_id = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, category);
            stmt.setString(3, price);
            stmt.setString(4, quantity);
            stmt.setString(5, description);
            stmt.setString(6, id); // Assuming 'id' is an integer

            int rs = stmt.executeUpdate();

            isSuccess= rs > 0;

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return isSuccess;

    }

    public static boolean deletedata(String id){
        int convID = Integer.parseInt(id);

        try{
            con= DBConnectionPM.getConnection();
            stmt=con.createStatement();
            String sql ="delete from products where product_id ='"+convID+"'";

            int rs = stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }



}
