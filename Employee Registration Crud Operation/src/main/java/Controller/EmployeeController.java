package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.Employee;
import Dao.EmployeeDao;

/**
 * EmployeeController.java
 * The EmployeeController class handles all the request parameters and sends them to the EmployeeDao 
 * class to save this data to the database.
 * @author Darshit Patel
 */

@WebServlet("/")
public class EmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDao employeeDao;

    public void init() {
        employeeDao = new EmployeeDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewEmployeeForm(request, response);
                    break;
                case "/insert":
                    insertEmployeeDetails(request, response);
                    break;
                case "/delete":
                    deleteEmployeeDatials(request, response);
                    break;
                case "/edit":
                    showEditEmployeeForm(request, response);
                    break;
                case "/update":
                    saveEmployeeDetails(request, response);
                    break;
                default:
                    listEmployee(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Employee > listEmployee = employeeDao.listAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewEmployeeForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditEmployeeForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeDao.selectEmployee(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void insertEmployeeDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String userName = request.getParameter("user_name");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contact_number");
        Employee newEmployee = new Employee(firstName, lastName, userName, password, address, contactNumber);
        employeeDao.insertEmployeeDetails(newEmployee);
        response.sendRedirect("list");
    }

    private void saveEmployeeDetails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String userName = request.getParameter("user_name");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contact_number");

        Employee employeeUpdated = new Employee(id, firstName, lastName, userName, password, address, contactNumber);
        employeeDao.saveEmployeeDetails(employeeUpdated);
        response.sendRedirect("list");
    }

    private void deleteEmployeeDatials(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDao.deleteEmployeeDatials(id);
        response.sendRedirect("list");
    }

}