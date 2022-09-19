package Bean;

/**
 * Employee.java
 * This is a POJO class represents a User entity
 * @author Darshit patel
 *
 */

public class Employee {
    private int id;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String address;
    private String contactNumber;

    public Employee() {}

    public Employee(int id, String firstName, String lastName, String userName, String password, String address, String contactNumber) {
        super();
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.contactNumber = contactNumber;
    }

    public Employee(String firstName, String lastName, String userName, String password, String address,
        String contactNumber) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.contactNumber = contactNumber;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getContactNumber() {
        return contactNumber;
    }
    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

}