<%@ page import="model.Subject" %>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Comment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Detail</title>
    <%User user = (User) session.getAttribute("user");%>
    <!-- Bootstrap CSS -->
    <!-- Custom CSS -->
    <style>
        .navbar-scroll .nav-link,
        .navbar-scroll .navbar-toggler-icon,
        .navbar-scroll .navbar-brand {
            color: #fff;
        }

        /* Color of the links AFTER scroll */
        .navbar-scrolled .nav-link,
        .navbar-scrolled .navbar-toggler-icon,
        .navbar-scrolled .navbar-brand {
            color: #fff;
        }

        /* Color of the navbar AFTER scroll */
        .navbar-scroll,
        .navbar-scrolled {
            background-color: #cbbcb1;
        }

        .mask-custom {
            backdrop-filter: blur(5px);
            background-color: rgba(255, 255, 255, .15);
        }

        .navbar-brand {
            font-size: 1.75rem;
            letter-spacing: 3px;
        }

        .wrap-collabsible {
            margin-bottom: 1.2rem 0;
        }

        input[type='checkbox'] {
            display: none;
        }


        .lbl-toggle:hover {
            color: #ffffff;
        }

        .lbl-toggle::before {
            content: ' ';
            display: inline-block;

            border-top: 5px solid transparent;
            border-bottom: 5px solid transparent;
            border-left: 5px solid currentColor;
            vertical-align: middle;
            margin-right: .7rem;
            transform: translateY(-2px);

            transition: transform .2s ease-out;
        }

        .toggle:checked + .lbl-toggle::before {
            transform: rotate(90deg) translateX(-3px);
        }

        .collapsible-content {
            max-height: 0px;
            overflow: hidden;
            transition: max-height .25s ease-in-out;
        }

        .toggle:checked + .lbl-toggle + .collapsible-content {
            max-height: 100vh;
        }

        .toggle:checked + .lbl-toggle {
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .collapsible-content .content-inner {
            background: rgb(213, 227, 255);
            border-bottom: 1px solid rgb(255, 255, 255);
            border-bottom-left-radius: 7px;
            border-bottom-right-radius: 7px;
            padding: .5rem 1rem;
        }

        /* Custom styles */
        .course-title {
            font-size: 2.5rem;
            color: #333;
            font-weight: bold;
        }

        .course-description {
            color: #555;
            font-size: 1.1rem;
        }

        .module-list {
            list-style: none;
            padding-left: 0;
        }

        .module-list li {
            margin-bottom: 10px;
        }

        .instructor-info {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        .my-element {
            /* Điều chỉnh các giá trị dưới đây để tạo bóng đổ phù hợp */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        body {
            margin-top: 20px;
            background: #ffffff;
        }

        @media (min-width: 0) {
            .g-mr-15 {
                margin-right: 1.07143rem !important;
            }
        }

        @media (min-width: 0) {
            .g-mt-3 {
                margin-top: 0.21429rem !important;
            }
        }

        .g-height-50 {
            height: 50px;
        }

        .g-width-50 {
            width: 50px !important;
        }

        @media (min-width: 0) {
            .g-pa-30 {
                padding: 2.14286rem !important;
            }
        }

        .g-bg-secondary {
            background-color: #fafafa !important;
        }

        .u-shadow-v18 {
            box-shadow: 0 5px 10px -6px rgba(0, 0, 0, 0.15);
        }

        .g-color-gray-dark-v4 {
            color: #777 !important;
        }

        .g-font-size-12 {
            font-size: 0.85714rem !important;
        }

        .media-comment {
            margin-top: 20px
        }

        .sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 70px;
            font-size: 20px;
            border-right: 1px; /* Màu và độ dày của thanh viền bên phải */
            padding-right: 3px; /* Khoảng cách từ nội dung đến thanh viền bên phải */
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 100%;
        }

        .card {

            background-color: #ffffff;
            border: none;
        }

        .form-color {

            background-color: #ffffff;

        }

        .form-control {

            height: 48px;
            border-radius: 25px;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #0cf;
            outline: 0;
            box-shadow: none;
            text-indent: 10px;
        }

        .c-badge {
            background-color: #35b69f;
            color: white;
            height: 20px;
            font-size: 11px;
            width: 92px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 2px;
        }

        .comment-text {
            font-size: 13px;
        }

        .wish {

            color: #0cf;
        }


        .user-feed {

            font-size: 14px;
            margin-top: 12px;
        }

        .bogoc {
            border-radius: 20px; /* Điều chỉnh giá trị số px theo sở thích của bạn */
        }

        .card-img-top {
            border-radius: 20px;
        }
        .checked{
            color: #0cf;
        }

        #wrap {
            margin: 20px auto;
            text-align: center;
        }

        .btn-slide, .btn-slide2 {
            position: relative;
            display: inline-block;
            height: 50px;
            width: 200px;
            line-height: 50px;
            padding: 0;
            border-radius: 50px;
            background: #fdfdfd;
            border: 2px solid #0099cc;
            margin: 10px;
            transition: .5s;
        }

        .btn-slide2 {
            border: 2px solid #0cf;
        }

        .btn-slide:hover {
            background-color: #0099cc;
        }

        .btn-slide2:hover {
            background-color: #0cf;
        }

        .btn-slide:hover span.circle, .btn-slide2:hover span.circle2 {
            left: 100%;
            margin-left: -45px;
            background-color: #fdfdfd;
            color: #0099cc;
        }

        .btn-slide2:hover span.circle2 {
            color: #0cf;
        }

        .btn-slide:hover span.title, .btn-slide2:hover span.title2 {
            left: 40px;
            opacity: 0;
        }

        .btn-slide:hover span.title-hover, .btn-slide2:hover span.title-hover2 {
            opacity: 1;
            left: 40px;
        }

        .btn-slide span.circle, .btn-slide2 span.circle2 {
            display: block;
            background-color: #0099cc;
            color: #fff;
            position: absolute;
            float: left;
            margin: 5px;
            line-height: 42px;
            height: 40px;
            width: 40px;
            top: 0;
            left: 0;
            transition: .5s;
            border-radius: 50%;
        }

        .btn-slide2 span.circle2 {
            background-color: #0cf;
        }

        .btn-slide span.title,
        .btn-slide span.title-hover, .btn-slide2 span.title2,
        .btn-slide2 span.title-hover2 {
            position: absolute;
            left: 90px;
            text-align: center;
            margin: 0 auto;
            font-size: 16px;
            font-weight: bold;
            color: #30abd5;
            transition: .5s;
        }

        .btn-slide2 span.title2,
        .btn-slide2 span.title-hover2 {
            color: #0cf;
            left: 80px;
        }

        .btn-slide span.title-hover, .btn-slide2 span.title-hover2 {
            left: 80px;
            opacity: 0;
        }

        .btn-slide span.title-hover, .btn-slide2 span.title-hover2 {
            color: #fff;
        }

    </style>
    <!-- Bootstrap CSS -->
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
    <style id="compiled-css"></style>
</head>
<body>
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

<%Subject subject = (Subject) request.getAttribute("subject");%>


<div class="container mt-5">
    <div class="row" style="margin-top: 5%">
        <%if (user != null) {%>
        <div class="col-lg-8">
            <h1 class="course-title"><%= subject.getTitle()%>
            </h1>
            <p><br></p>

            <div style="display: flex" class="background">
                <div class="col-md-4" style="position: relative;">
                    <img src="<%= subject.getPictureUrl()%>" class="card-img-top" alt="Course Image"
                         style="width: 100%; height: auto;">
                </div>

                <div class="col-md-6" style="position: relative;">
                    <h4>Top recommend teacher</h4>
                    <%ArrayList<String> favTeacher = (ArrayList<String>) request.getAttribute("favTeacher");
                    int count = 0;
                    for(String teacher: favTeacher){
                        count++;
                        if (teacher != null){
                    %><span class="fa fa-star checked"></span>
                    <span class="fa fa-star <%=count < 3? "checked":""%>"></span>
                    <span class="fa fa-star <%=count == 1? "checked":""%>"></span>
                    <span><%=" " + teacher%></span>
                    <br>
                    <%
                        }
                    }
                    %>
                </div>
            </div>
<br>
            <div class="tabs" data-tabs="tabs_id" style="text-align: center">
                <div class="tabs__header" data-tabsheader="tabs_id">
                    <div class="active" data-tabsbutton="tabs_id"><h4>Midterm</h4></div>
                    <div data-tabsbutton="tabs_id"><h4>Final exam</h4></div>
                    <div data-tabsbutton="tabs_id"><h4>Related document</h4></div>
                </div>

                <div class="tabs__content active" data-tabscontent="tabs_id">
                    <a href="#" class="btn-slide2">
                        <span class="circle2"><i class="fa fa-download"></i></span>
                        <span class="title2">Midterm</span>
                        <span class="title-hover2">Click here</span>
                    </a>
                </div>

                <div class="tabs__content" data-tabscontent="tabs_id">
                    <a href="#" class="btn-slide2">
                        <span class="circle2"><i class="fa fa-download"></i></span>
                        <span class="title2">Final Exam</span>
                        <span class="title-hover2">Click here</span>
                    </a>
                </div>

                <div class="tabs__content" data-tabscontent="tabs_id">
                    <a href="#" class="btn-slide2">
                        <span class="circle2"><i class="fa fa-download"></i></span>
                        <span class="title2">Relating</span>
                        <span class="title-hover2">Click here</span>
                    </a>
                </div>
            </div>


            <div>
                <div class="container col-md-12" style="border: none">

                    <div class="row height d-flex justify-content-center align-items-center" style="border: none">

                        <div class="col-md-12">

                            <div class="card" style="border: none">

                                <div class="p-3">

                                    <h6>Comments</h6>

                                </div>
                                <form method="POST" action="./subject-detail?id=<%= subject.getId()%>">
                                    <div class="mt-3 d-flex flex-row align-items-center p-3 form-color">

                                        <img src="https://i.imgur.com/zQZSWrt.jpg" width="50"
                                             class="rounded-circle mr-2">
                                        <input name="comment" type="text" class="form-control"
                                               placeholder="Enter your comment...">
                                        <%
                                            request.setAttribute("id", request.getParameter("id"));
                                            String userId = "" + user.getId();
                                            request.setAttribute("oik", userId);
                                        %>
                                    </div>
                                </form>


                                <div class="mt-2">
                                    <%
                                        ArrayList<Comment> commentList = (ArrayList<Comment>) request.getAttribute("commentList");
                                        for (Comment comment : commentList) {%>
                                    <div class="d-flex flex-row p-3">

                                        <img src="https://camo.githubusercontent.com/85ec39098ca039870696ac5fc0cf4762d58e1357c2237a75c46831da1b272018/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f323639323831302f323130343036312f34643839316563302d386637362d313165332d393230322d6637333934306431306632302e706e67"
                                             width="40" height="40" class="rounded-circle mr-3">

                                        <div class="w-100">

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex flex-row align-items-center">
                                                    <span class="mr-2"><%=comment.getFirstName() + " " + comment.getLastName()%></span>
                                                </div>
                                            </div>

                                            <p class="text-justify comment-text mb-0"><%= comment.getContent()%>
                                            </p>

                                            <div class="d-flex flex-row user-feed">

                                                <span class="wish"><i
                                                        class="fa fa-heartbeat mr-2"></i><%=comment.getLikeNum()%></span>

                                            </div>

                                        </div>


                                    </div>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card my-element sticky bogoc">
                <div class="card-body">

                    <h4 class="card-title"><i class="glyphicon glyphicon-ok-circle" style="color:#0cf;"></i> Advice</h4>
                    <h6>
                        <%= subject.getDescription()%>
                    </h6>
                    <p><br></p>
                    <a href="#" class="btn btn-primary btn-block" >Donate</a>
                </div>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="col-lg-8">
            <h1 class="course-title"><%= subject.getTitle()%>
            </h1>
            <br>
            <div class="w3-panel w3-yellow" style="border-radius: 12px">
                <h3>Warning!</h3>
                <p>You have to login to see this content.</p>
            </div>
        </div>
        <%
            }%>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>



<script>
    function handleComment(id) {
        $.ajax({
            url: "./subject-detail?id=" + id,
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

    $(function () {
        $("[data-tabsheader]").on(
            "click",
            "[data-tabsbutton]:not(.active)",
            function () {
                $(this)
                    .addClass("active")
                    .siblings()
                    .removeClass("active")
                    .closest("[data-tabs]")
                    .find("[data-tabscontent]")
                    .removeClass("active")
                    .eq($(this).index())
                    .addClass("active");
            }
        );
    });

    window.onload = function() {
        document.body.style.zoom = "90%"; // Thiết lập zoom lên 120%
    };

</script>

<script>
    var scssCode = `
            // default styles
           [data-tabscontent] {
               display: none;
           }

        [data-tabscontent].active {
            display: block;
        }

        // specific styles
           [data-tabscontent] {
               padding: 10px 0;
               font-size: 45px;
           }
        .tabs__header {
            [data-tabsbutton] {
                cursor: pointer;
                display: inline-block;
                font-style: normal;
                font-weight: 700;
                font-size: 26px;
                line-height: 34px;
                list-style: none;
                margin-right: 48px;
                position: relative;

                color: rgba(33, 37, 49, 1);
                border-bottom: 4px solid transparent;
                padding: 0 0 8px 0;

                &.active {
                    color: rgba(33, 37, 49, 1);
                    border-bottom: 2px solid green;
                }

                &:hover {
                    color: rgba(0, 204, 255, 100);
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
