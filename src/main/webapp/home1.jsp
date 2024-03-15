<%-- 
    Document   : home
    Created on : Feb 18, 2024, 7:36:49 PM
    Author     : User
--%>

<%@page import="model.Supplier"%>
<%@page import="utils.CurrencyHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .product-list {
                flex: 8;
                float: left;
            }

            .product {
                width: 20%;
                display: inline-block;
                margin: auto 10px;
            }

            .strike {
                text-decoration: line-through;
            }

            .home-container {
                display: flex;
                padding-left: 150px;
                padding-right: 150px;
                padding-top: 50px;
            }
            .filter-container {
                flex: 2;
            }
            .selected {
                font-weight: 700;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>
        <% User user = (User) session.getAttribute("user"); %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar w/ text</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                </ul>
                <span class="navbar-text">
                    <% if (user != null) {%>
                    <h4><%= user.getLastName() + " " + user.getFirstName()%></h4>
                    <% }%> 
                </span>
            </div>
        </nav>

        <div class="home-container">
            <div class="filter-container">
                <div class="filter-item">
                    <h5>Nhà cung cấp</h5>
                    <% String seletedSupplierId = (String) request.getParameter("supplierId");  %>
                    <div class="">
                        <% ArrayList<Supplier> supplierList = (ArrayList<Supplier>) request.getAttribute("supplierList"); %>
                        <% for (Supplier supplier : supplierList) {%>
                        <!--                        <div >
                                                    <a class="<%= seletedSupplierId != null && supplier.getId() == Integer.parseInt(seletedSupplierId) ? "selected" : ""%>" href="./home?supplierId=<%= supplier.getId()%>" class="btn"><%= supplier.getCompanyName()%></a>
                                                </div>-->
                        <button class="btn" onclick="handleFilterBySupplier(2)"><%= supplier.getCompanyName()%></button>
                        <br>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="product-list">
                <a href="./home?sortBy=title&order=asc" class="btn btn-primary">Sort by title</a>
                <a href="./home?sortBy=price&order=asc" class="btn btn-info">Sort by price</a>
                <a href="./home?sortBy=sale_rate&order=desc" class="btn btn-secondary">Sort by sale</a>
                <br>
                <% ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList"); %>
                <% for (Product product : productList) {%>
                <div class="card product">
                    <img class="card-img-top" src="https://dongphuckimvang.vn/uploads/shops/2020_09/ao-thun-the-thao%20(2).jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%= product.getTitle()%></h5>
                        <h5 class="card-text strike"><%= CurrencyHelper.format(product.getCompareAtPrice())%></h5>
                        <h4 class="card-text"><%= CurrencyHelper.format(product.getPrice())%></h4>
                        <h3 class="card-text" style="color: red;">SALE <%= (int) product.getSaleRate()%>%</h3>
                        <a href="/java_sql_t11/product-detail?id=<%= product.getId()%>" class="btn btn-primary">Detail</a>
                    </div>
                </div>
                <% }%>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function handleFilterBySupplier(id) {
                $.ajax({
                    url: "./home",
                    type: "get", //send it through get method
                    data: {
                        supplierId: id,
                    },
                    success: function (data) {
                        console.log(">>> data", data);
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            
            setInterval(() => {callApi()}, 5000);
            function callApi(){
                $.ajax({
                    url: "https://jsonplaceholder.typicode.com/users",
                    type: "get", //send it through get method
                    data: {
                        
                    },
                    success: function (data) {
                        console.log(">>> data", data);
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>
    </body>
</html>
