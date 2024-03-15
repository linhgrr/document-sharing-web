<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Filter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            position: fixed; /* Fix the sidebar to the left side of the screen */
            width: 160px; /* Set the width of the sidebar */
            height: 100vh; /* Set the height of the sidebar to 100% (full viewport height) */
            background-color: #f1f1f1; /* Set the background color of the sidebar */
            padding: 0;
        }

        .sidebar a {
            display: block; /* Make the sidebar items display as block elements */
            color: black; /* Set the color of the links */
            text-align: left; /* Align the text to the left */
            padding: 8px 16px; /* Add some padding to the links */
            text-decoration: none; /* Remove underline from links (optional) */
        }


        .sidebar a.active {
            background-color: #4CAF50; /* Add a green background color to the active link */
            color: white; /* Add a white color to the text of the active link */
        }

        .sidebar a:hover:not(.active) {
            background-color: #ddd; /* Add a hover effect to the links */
        }

        .main-content {
            margin-left: 160px; /* Add a left margin to main content to avoid sidebar overlap */
            padding: 0 20px; /* Add some padding to the main content */
            height: 100vh; /* Set the height of the main content to 100% */
        }

        .main-content h1 {
            padding: 20px 0; /* Add some padding to the top of the content */
            border-bottom: 1px solid #ddd; /* Add a border to the bottom of the heading */
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="#" class="active">DANH SÁCH TÀI LIỆU</a>
    <a href="#">IELTS Academic</a>
    <a href="#">IELTS General</a>
    <a href="#">NEW SAT</a>
    <a href="#">TOEIC</a>
    <a href="#">Thi THPTQG</a>
    <a href="#">Lớp 12</a>
    <a href="#">Lớp 11</a>
    <a href="#">Lớp 10</a>
    <a href="#">Thi Vào Lớp 10</a>
</div>

<div class="main-content">
    <h1>This is the main content area</h1>
    <p>You can put any content you want here. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div>

</body>
</html>