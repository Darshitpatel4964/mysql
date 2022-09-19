package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Bean.Employee;
import Util.DBConnection;

/**
 * EmployeeDaO.java This DAO class provides CRUD database operations for the
 * table employee_crud_operation in the database.
 * @author Darshit Patel
 */

public class EmployeeDao {
	
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee_data" + "  (first_name, last_name, user_name, password, address, contact_number) VALUES " +
        " (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "select id, first_name, last_name, user_name, password, address, contact_number from employee_data where id =?";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee_data";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee_data where id = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee_data set first_name = ?,last_name= ?, user_name =?, password =?, address =?, contact_number =? where id = ?;";

    public void insertEmployeeDetails(Employee newEmployee) throws SQLException {
        System.out.println(INSERT_EMPLOYEE_SQL);
        try (Connection connection = DBConnection.createconnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, newEmployee.getFirstName());
            preparedStatement.setString(2, newEmployee.getLastName());
            preparedStatement.setString(3, newEmployee.getUserName());
            preparedStatement.setString(4, newEmployee.getPassword());
            preparedStatement.setString(5, newEmployee.getAddress());
            preparedStatement.setString(6, newEmployee.getContactNumber());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }

    }

    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = DBConnection.createconnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                String address = resultSet.getString("address");
                String contactNumber = resultSet.getString("contact_number");
                employee = new Employee(id, firstName, lastName, userName, password, address, contactNumber);
            }
        } catch (SQLException e) {

        }
        return employee;

    }

    public List < Employee > listAllEmployee() {

        List < Employee > employeeList = new ArrayList < > ();
        try (Connection connection = DBConnection.createconnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                String address = resultSet.getString("address");
                String contactNumber = resultSet.getString("contact_number");
                employeeList.add(new Employee(id, firstName, lastName, userName, password, address, contactNumber));
            }
        } catch (SQLException e) {

        }
        return employeeList;

    }

    public boolean deleteEmployeeDatials(int id) throws SQLException {
        boolean employeeDeleted;
        try (Connection connection = DBConnection.createconnection(); PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            statement.setInt(1, id);
            employeeDeleted = statement.executeUpdate() > 0;
        }
        return employeeDeleted;

    }

    public boolean saveEmployeeDetails(Employee employee) throws SQLException {
        boolean employeeUpdated;
        try (Connection connection = DBConnection.createconnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setString(3, employee.getUserName());
            statement.setString(4, employee.getPassword());
            statement.setString(5, employee.getAddress());
            statement.setString(6, employee.getContactNumber());
            statement.setInt(7, employee.getId());
            employeeUpdated = statement.executeUpdate() > 0;
        }
        return employeeUpdated;
    }

}