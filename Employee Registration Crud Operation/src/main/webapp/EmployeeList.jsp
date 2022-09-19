<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
   <head>
      <title>Employee Registration Form</title>
      <link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
         crossorigin="anonymous">
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" 
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
         integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
         crossorigin="anonymous">
      <link rel="stylesheet" type="text/css" href="css/register.css">
   </head>
   <body style="background-color: lightyellow">
      <header>
         <nav class="navbar navbar-expand-md navbar-dark"
            style="background-color: tomato">
            <div>
               <h2 class="navbar-brand">Employee Registration Form </h2>
            </div>
         </nav>
      </header>
      <br>
      <div class="align-items-center" style="height: 100vh;">
         <div class="row">
            <div class="container ">
               <h3 class="text-center">List of Employee</h3>
               <hr>
               <div class="container text-left">
                  <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
                  New Employee</a>
               </div>
               <br>
               <table class="table table-bordered " style ="border: solid blue;">
                  <thead>
                     <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>User Name</th>
                        <th>Address</th>
                        <th>Contact Number</th>
                        <th>Actions</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="employee" items="${listEmployee}">
                        <tr>
                           <td>
                              <c:out value="${employee.id}" />
                           </td>
                           <td>
                              <c:out value="${employee.firstName}" />
                           </td>
                           <td>
                              <c:out value="${employee.lastName}" />
                           </td>
                           <td>
                              <c:out value="${employee.userName}" />
                           </td>
                           <td>
                              <c:out value="${employee.address}" />
                           </td>
                           <td>
                              <c:out value="${employee.contactNumber}" />
                           </td>
                           <td><a href="edit?id=<c:out value='${employee.id}' />" class="btn btn-primary">Edit</a>
                              &nbsp;&nbsp;&nbsp;&nbsp; 
                              <a href="delete?id=<c:out value='${employee.id}' />" class="btn btn-danger">Delete</a>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </body>
</html>