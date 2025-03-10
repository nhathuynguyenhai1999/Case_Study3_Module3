<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Chaien Model Shoes Store Manage Product |Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Product</b> | Chaien Model Shoes Store</h2>
                    </div>
                    <div class="col-sm-6">
<%--                        <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>--%>
<%--                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>--%>
                            <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-success" ><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a class="btn btn-success" href="${pageContext.request.contextPath}/Login.jsp"><i class="fas fa-sign-out-alt"></i> <span>Log Out</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
<%--                    <th>--%>
<%--                        <span class="custom-checkbox">--%>
<%--                            <input type="checkbox" id="selectAll">--%>
<%--                            <label for="selectAll"></label>--%>
<%--                        </span>--%>
<%--                    </th>--%>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="o">
                    <tr>
    <%--                        <td>--%>
    <%--                            <span class="custom-checkbox">--%>
    <%--                                <input type="checkbox" id="checkbox1" name="options[]" value="1">--%>
    <%--                                <label for="checkbox1"></label>--%>
    <%--                            </span>--%>
    <%--                        </td>--%>
<%--                        <td>${o.id}</td>--%>
                        <td>${o.name}</td>
                        <td>
                            <img src="${o.image}">
                        </td>
                        <td>${o.price} $</td>
                        <td>${o.category.cname}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/products?action=edit&id=${o.id}"  class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="${pageContext.request.contextPath}/products?action=delete&id=${o.id}" onclick="return confirm('Do you want to delete product')" class="delete" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="${pageContext.request.contextPath}/products?action=create" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <label>
                                    <input name="name" type="text" class="form-control" required>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <label>
                                    <input name="image" type="text" class="form-control" required>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <label>
                                    <input name="price" type="text" class="form-control" required>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <label>
                                    <textarea name="title" class="form-control" required></textarea>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categories}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <c:if test="${productEdit!=null}">
                                    <input value="${productEdit.name}" type="text" class="form-control" required>
                                </c:if>

                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <c:if test="${productEdit!=null}">
                                    <input value="${productEdit.image}" type="text" class="form-control" required>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <label>
                                    <input type="text" class="form-control" required>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categories}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
    <form id="deleteProductForm" action="${pageContext.request.contextPath}/products?action=?deleteEmployeeModal">
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
    <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function(){
                $('#deleteProductForm').on('submit',function(event){
                    event.preventDefault();
                    var productID = $(this).find('input[name="productID"]').val();
                    $.ajax({
                        url:'delete_product',
                        method:'POST',
                        data: {productID: productID},
                        success: function(response){
                            $('#deleteEmployeeModal').modal('hide');
                        },
                        error: function (xhr,status,error){
                            console.log(xhr.responseText);
                        }
                    });
                });
            });
        </script>
    </body>
</html>