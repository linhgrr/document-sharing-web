<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
</head>
<body>
<h1>Sign up successfully, redirecting to login page...</h1>
<!-- Đợi 3 giây, sau đó chuyển hướng -->
<script>
    setTimeout(function() {
        // Sử dụng phương thức assign() để chuyển hướng
        location.assign("/demo2_war_exploded/login");
    }, 3000);
</script>
</body>
</html>
