package bomb;

import java.sql.Connection;
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

            String sql="select * from bomb where id='"+convertID+"'";
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

            String sql="select * from bomb";
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



}
