<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Subject" %>
<%@ page import="model.Semester" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Tuan Linh
  Date: 3/4/2024
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        .carousel-caption h5 {
            font-size: 45px;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 25px;
        }

        .carousel-caption p {
            width: 75%;
            margin: auto;
            font-size: 18px;
            line-height: 1.9;
        }

        .navbar-light .navbar-brand {
            color: #fff;
            font-size: 25px;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .navbar-light .navbar-nav .active > .nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show > .nav-link {
            color: #fff;
        }

        .navbar-light .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-toggler {
            background: #fff;
        }

        .navbar-nav {
            text-align: center;
        }

        .nav-link {
            padding: .2rem 1rem;
        }

        .nav-link.active,.nav-link:focus{
            color: #fff;
        }

        .navbar-toggler {
            padding: 1px 5px;
            font-size: 18px;
            line-height: 0.3;
        }

        .navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
            color: #fff;
        }


        .link-area a
        {
            text-decoration:none;
            color:#fff;
            font-size:25px;
        }

        body {
            display: table;
            width: 100%;
            height: 100%;
        }

        html {
            height: 100%;
        }


        .product-list {
            flex: 8;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }


        .container {
            font-weight: 700;
            position: relative;
            justify-content: center; /* căn giữa theo chiều ngang */
        }

        .div-top {
            margin-bottom: 25px; /* Khoảng cách 20px */
        }

        .home-container {
            display: flex;
            margin-left: 10%;
            margin-right: 10%;
        }

        .card-container .card {
            display: flex;
            justify-content: space-between;
            /* Đảm bảo .card mở rộng theo nội dung bên trong */
        }

        .filter-container {
            flex: 2;
        }

        .main {
            display: table-row;
            height: 100%;
            /* Các thuộc tính khác */
        }

        .footer {
            background-color: #333; /* Màu nền của footer */
            color: white; /* Màu chữ của footer */
            padding: 20px; /* Khoảng cách giữa nội dung footer và biên */
            text-align: center; /* Căn giữa nội dung trong footer */
            width: 100%;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 100%;
        }

        .card {
            width: 100%;
            background-color: #f1f1f1;
            border: none;
            margin-bottom: 15px;
        }
        .sidebar {
            position: sticky; /* Đặt vị trí của sidebar là sticky */
            top: 0; /* Đặt vị trí bắt đầu của sidebar từ đầu trang */
            z-index: 1000;
            width: 100%; /* Set the width of the sidebar */ /* Set the height of the sidebar to 100% (full viewport height) */
            background-color: #ffffff; /* Set the background color of the sidebar */
            padding: 0;
        }

        @media (max-width: 768px) {
            .sidebar {
                position: static;
            }
        }

        .sidebar a {
            display: block;
            color: #8e1414;
            text-align: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: color 0.3s ease; /* Thêm hiệu ứng chuyển màu cho thẻ a */
        }

        .sidebar a:hover {
            text-decoration: none;
            color: #e07c51;
            font-size: 16px;
            line-height: 22px;
            font-weight: 600;
            transition: 0.3s;
        }

        .main-content h1 {
            padding: 20px 0; /* Add some padding to the top of the content */
            border-bottom: 1px solid #ddd; /* Add a border to the bottom of the heading */
        }

        .faded-line {
            border: none;
            height: 1px; /* Độ dài của đường gạch */
            background: rgba(0, 0, 0, 0.3); /* Màu nền của đường gạch với độ mờ */
        }
        .search-container {
            position: relative;
            display: inline-block;
            border-radius: 20px;
            overflow: hidden;
            border: #0cf;
        }

        .search-input {
            padding: 10px 15px;
            border: none;
            border-radius: 20px;
            outline: none;
            width: 200px;
        }

        .search-button {
            background-color: #0cf;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 0 20px 20px 0;
        }

        /* Để tìm kiếm button trở nên tròn, bạn có thể sử dụng một icon */
        .search-button i {
            vertical-align: middle;
        }
        .indam{
            font-weight: bold;
            color: #0cf;
        }


    </style>


    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sass.js/dist/sass.sync.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>NguyenLinhNP</title>
    <%User user = (User) session.getAttribute("user");%>
    <style id="compiled-css"></style>
</head>
<body>

<div class="main div-top">
    <div>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="/demo2_war_exploded/home">NguyenLinhNP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/demo2_war_exploded/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/demo2_war_exploded/donate">Donate meoemoe </a>
                        </li>
                        <li class="nav-item">
                                <% if (user == null) { %>
                            <a href="/demo2_war_exploded/login" class="nav-link">Login</a>
                        <% } else {
                        %><li class="nav-item">
                        <a class="nav-link"><%=user.getFirstname() + " " + user.getLastname()%></a>
                    </li><%
                        }
                    %>
                        </li>
                        <li class="nav-item">
                            <% if (user == null) { %>
                            <a href="/demo2_war_exploded/register" class="nav-link">Register</a>
                            <% }else{%>
                            <a class="nav-link" href = "/demo2_war_exploded/logout">Logout</a>
                            <%}
                            %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <svg style="color: #0cf; width: 100%"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1833 640" fill="none">
            <!-- Đoạn path của bạn -->
            <path d="M319 467.5C193.004 459.391 0.5 523 0.5 523V0.5L1832.5 15.5V452.5C1832.5 452.5 1709.4 598.332 1602 603C1473.46 608.586 1457.71 383.898 1332.5 413.5C1227.1 438.419 1264.58 595.445 1163 633C1028.57 682.699 963.312 433.344 828.5 482C760.11 506.683 754.437 575.821 687 603C544.957 660.247 471.829 477.336 319 467.5Z" fill="#00CCFF"/>
            <!-- Văn bản bạn muốn thêm -->
        </svg>

    </div>
    <p></p>
    <p><br></p>
    <p><br></p>
    <div class="home-container" style="margin-top: 20px">
        <div class="filter-container col-md-3">
            <div class="sidebar col-md-11" style="position: sticky; top: 65px">
                <div class="card" style="border-radius: 10px; background-color: #0cf; padding: 7px">
                    <h5 style="color: white">SEMESTER</h5>
                </div>
                <div class="card" style="border-radius: 10px; background-color: #f1f1f1">
                    <%
                        ArrayList<Semester> semesterList = (ArrayList<Semester>) request.getAttribute("semesterList");
                        String selectedId = request.getParameter("semester-id");
                        if (selectedId == null) selectedId = "0";
                        if (semesterList != null) {
                            for (Semester semester : semesterList) {
                    %>
                    <a class="danh-sach-ky" style="width: 100%;"
                       onclick="handleFilterBySemester(<%=semester.getId()%>)"><%= semester.getName()%>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="container col-md-9">
            <div class="search-container" style="border: #0cf; width: 100%">
                <input name="search" type="text" placeholder="Search..." class="search-input">
                <button onclick="handleSearch()" class="search-button"><i class="fa fa-search"></i></button>
            </div>

            <div class="div-top product-list">
                <% ArrayList<Subject> subjectList = (ArrayList<Subject>) request.getAttribute("subjectList");
                    if (subjectList != null) {
                        int count = 0;
                        for (Subject subject : subjectList) { %>
                <div class="card-container col-md-12">
                <div class="card col-md-12"
                     style="width: 100%; display: inline-block; margin-right: 20px; border-radius: 10px; background-color: #f1f1f1;">
                    <h4 class="card-title" style="margin-top: 20px;"><%= subject.getTitle() %>
                    </h4>
                    <div>
                        <div class="icon-container" style="margin-top: 15px">
                            <h6>
                                <i class="glyphicon glyphicon-eye-open" style="color:#0cf;"></i>
                                <!-- Biểu tượng View -->
                                View: <%=subject.getViewCount()%>
                                <span style="margin-left: 20px;"> <!-- Tạo khoảng cách 10px -->
            <i class="glyphicon glyphicon-user" style="color: #0cf;"></i> <!-- Biểu tượng Author -->
            Author: Nguyễn Linh
        </span>
                            </h6>
                        </div>

                    </div>
                    <hr class="faded-line">
                    <div class="card-body" style="text-align: right;">
                        <a href="/demo2_war_exploded/subject-detail?id=<%=subject.getId()%>" class="button">See document
                            ></a>
                    </div>
                </div>

            </div>

            <br>
            <%
                    }
                } %>
                <%String semesterId = request.getParameter("semester-id");
                String search = request.getParameter("search");
                %>
                <%if (semesterId == null && search == null){%>
        </div>
        <% String pageStr = request.getParameter("page-num");
            int countSub = (int)request.getAttribute("countSub");
            int maxPage = (int) Math.ceil(1.0 * countSub/5);
            System.out.println(maxPage);
            int pageNum;
            try {
                pageNum = Integer.parseInt(pageStr);
            } catch (Exception e) {
                pageNum = 1;
            }
            int page1, page2, page3;
            if (pageNum < 3) {
                page1 = 1;
                page2 = 2;
                page3 = 3;
            }else if (pageNum == maxPage){
                page1 = pageNum-2;
                page2 = pageNum-1;
                page3 = pageNum;
            } else {
                page1 = pageNum - 1;
                page2 = pageNum;
                page3 = pageNum + 1;
            }
        %>
        <div class="div-bottom" style="display: flex; justify-content: center;">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <button type="button" class="btn" onclick="handlePage(<%= pageNum==1? pageNum:pageNum-1%>)"
                                aria-label="Previous">
                            <span aria-hidden="true"><h6>&laquo;</h6></span>
                            <span class="sr-only">Previous</span>
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="button" class="btn"
                                onclick="handlePage(<%=page1%>)"><h6 class="<%= pageNum == 1? "indam":""%>"><%= page1%>
                        </h6>
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="button" class="btn" onclick="handlePage(<%= page2%>)"><h6 class="<%= (pageNum != 1 && pageNum != maxPage)? "indam":""%>"><%= page2%>
                        </h6>
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="button" class="btn" onclick="handlePage(<%= page3%>)"><h6 class="<%= (pageNum == maxPage)? "indam":""%>"><%= page3%>
                        </h6>
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="button" class="btn" onclick="handlePage(<%= pageNum!= maxPage?pageNum+1:pageNum%>)" aria-label="Next">
                            <span aria-hidden="true"><h6>&raquo;</h6></span>
                            <span class="sr-only">Next</span>
                        </button>
                    </li>
                </ul>
            </nav>
        </div>
            <%}%>
    </div>
</div>
</div>
<p><br></p>
<p><br></p>
<p><br></p>

<div class="footer div-bottom">
    @Coppyright by Linh đẹp trai
</div>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>


<script>
    function handleFilterBySemester(id) {
        $.ajax({
            url: "./home?semester-id=" + id,
            type: "get", //send it through get method
            success: function (data) {
                console.log(">>> data", data);
                $('body').html(data);

            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function handleFilter(cmt) {
        $.ajax({
            url: "./home?sortBy=" + cmt,
            type: "get", //send it through get method
            success: function (data) {
                console.log(">>> data", data);
                $('body').html(data);
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function handlePage(cmt) {
        $.ajax({
            url: "./home?page-num=" + cmt,
            type: "get", //send it through get method
            success: function (data) {
                console.log(">>> data", data);
                $('body').html(data);
                $('html, body').animate({
                    scrollTop: $('.home-container').offset().top
                }, 'medium');
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function handleSearch() {
        // Lấy giá trị từ input
        var searchString = document.querySelector('input[name="search"]').value;

        // Xử lý tìm kiếm với giá trị này
        // Ví dụ:
        $.ajax({
            url: "./home?search=" + searchString,
            type: "get", //send it through get method
            success: function (data) {
                console.log(">>> data", data);
                $('body').html(data);
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }


    window.onload = function() {
        document.body.style.zoom = "90%"; // Thiết lập zoom lên 120%
    };


</script>

<script>
    var scssCode = `
            // Định nghĩa SCSS trực tiếp
            $color: #0cf;

.button {
  text-decoration: none;
  display: inline-block;
  padding: .75rem 1.25rem;
  border-radius: 10rem;
  color: #fff;
  text-transform: uppercase;
  font-size: 0.7rem;
  letter-spacing: .15rem;
  transition: all .3s;
  position: relative;
  overflow: hidden;
  z-index: 1;
  &:after {
    text-decoration: none;
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 90%;
    height: 90%;
    background-color: $color;
    border-radius: 10rem;
    z-index: -2;
  }
  &:before {
    text-decoration: none;
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0%;
    height: 90%;
    background-color: darken($color, 15%);
    transition: all .3s;
    border-radius: 10rem;
    z-index: -1;
  }
  &:hover {
    color: #fff;
    text-decoration: none;
    &:before {
      width: 90%;
      text-decoration: none;
    }
  }
}

        `;

    // Biên dịch SCSS thành CSS và áp dụng vào trang
    Sass.compile(scssCode, function (result) {
        document.getElementById('compiled-css').innerHTML = result.text;
    });
</script>
</body>
</html>
