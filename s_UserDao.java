package student;
import java.sql.*;
import java.util.*;
import student.s_user;
public class s_UserDao {
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
			System.out.println("Connected..");
		}
		catch(Exception e) {System.out.println(e);
		System.out.println("Not connected");
		}
		return con;
	}
	public static int save(s_user u) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into student1(sname,spassword,scpassword,smail) values(?,?,?,?)");
			ps.setString(1,u.getSname());
			ps.setString(2,u.getSpassword());
			ps.setString(3,u.getScpassword());
			ps.setString(4,u.getSmail());
			status=ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("Not connected..!");
		}
		return status;
	}
	public static List<s_user> getAllRecords(){
		List<s_user> list=new ArrayList<s_user>();
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from student1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s_user u=new s_user();
				u.setSname(rs.getString("sname"));
				u.setSpassword(rs.getString("spassword"));
				u.setScpassword(rs.getString("scpassword"));
				u.setSmail(rs.getString("smail"));
				list.add(u);
			}//while
		}catch(Exception e) {System.out.println(e);}
		return list;
	}
	public static boolean authenticateUser(String sname, String spassword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            ps = con.prepareStatement("SELECT * FROM student1 WHERE sname = ? AND spassword = ?");
            ps.setString(1, sname);
            ps.setString(2, spassword);
            rs = ps.executeQuery();

            return rs.next(); // If a matching record is found, authentication is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Authentication failed due to an exception
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
