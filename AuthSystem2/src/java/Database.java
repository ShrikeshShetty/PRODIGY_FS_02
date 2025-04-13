import java.sql.*;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/shrikesh_authentication";
    private static final String USER = "root"; // Change as per your MySQL credentials
    private static final String PASSWORD = "";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
