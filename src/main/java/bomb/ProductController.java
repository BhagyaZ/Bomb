package bomb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ProductController {

    private static boolean isSuccess;
    private static Connection con=null;
    private static Statement stmt=null;
    private static ResultSet rs=null;

    public static boolean insertdata(String name,String category,String price,String quantity,String description){
        boolean isSuccess = false;
        try{
            con=DBConnection.getConnection();
            stmt=con.createStatement();


            String sql="insert into bomb values(0,'"+name+"','"+category+"','"+price+"','"+quantity+"','"+description+"')";
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

}
