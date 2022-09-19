package Util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * DBConnection.java
 * Create DBConnection Class is connect to the database.
 * @author Darshit Patel
 */

public class DBConnection {
    
	public static Connection createconnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_crud_operation", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

}
