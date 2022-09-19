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
      <link rel="stylesheet" type="text/css" href="css/register.css">
   </head>
   <body style="background-color:lightyellow">
      <header>
         <nav class="navbar navbar-expand-md navbar-dark"
            style="background-color: tomato">
            <div>
               <h2 class="navbar-brand"> Employee Registration Form </h2>
            </div>
            <ul class="navbar-nav">
               <li><a href="<%=request.getContextPath()%>/list"
                  class="nav-link">Employee List</a></li>
            </ul>
         </nav>
      </header>
      <div class="d-flex align-items-center" style="height: 100vh;">
         <div class="container" >
            <div class=" container d-flex justify-content-center">
               <div class="container col-md-5">
                  <div class="card">
                     <div class="card-body">
                        <c:if test="${employee != null}">
                           <form action="update" method="post">
                        </c:if>
                        <c:if test="${employee == null}">
                           <form action="insert" method="post">
                        </c:if>
                        <caption>
                        <h2>
                        <c:if test="${employee != null}">
                        Edit Employee
                        </c:if>
                        <c:if test="${employee == null}">
                        Add New Employee
                        </c:if>
                        </h2>
                        </caption>
                        <c:if test="${employee != null}">
                        <input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
                        </c:if>
                        <fieldset class="form-group">
                        <label>First Name</label> <input type="text"
                           value="<c:out value='${employee.firstName}' />" class="form-control"
                           name="first_name" required="required">
                        </fieldset>
                        <fieldset class="form-group">
                        <label>Last Name</label> <input type="text"
                           value="<c:out value='${employee.lastName}' />" class="form-control"
                           name="last_name" required="required">
                        </fieldset>
                        <fieldset class="form-group">
                        <label>User Name</label> <input type="text"
                           value="<c:out value='${employee.userName}' />" class="form-control"
                           name="user_name" required="required">
                        </fieldset>
                        <fieldset class="form-group">
                        <label>Password</label> <input type="password"
                           value="<c:out value='${employee.password}' />" class="form-control"
                           name="password" required="required" >
                        </fieldset>
                        <fieldset class="form-group">
                        <label>Address</label> <input type="text"
                           value="<c:out value='${employee.address}' />" class="form-control"
                           name="address" required="required">
                        </fieldset>
                        <fieldset class="form-group">
                        <label>Contact Number</label> <input type="text"
                           value="<c:out value='${employee.contactNumber}' />" class="form-control"
                           name="contact_number" required="required">
                        </fieldset>
                        <button type="submit" class="btn btn-success">Submit</button>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>