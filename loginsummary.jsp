<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Happy Tails Adoption - Login Successful</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .summary-box {
            background: #fff;
            padding: 3rem 2rem;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 6px 20px rgb(0 0 0 / 0.15);
            max-width: 450px;
            width: 100%;
        }
        .summary-box h1 {
            color: #b30000;
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }
        .summary-box .paw-icon {
            width: 40px;
            vertical-align: middle;
            margin-right: 8px;
        }
        .summary-box p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2rem;
        }
        .btn-logout {
            background-color: #b30000;
            color: white;
            border: none;
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
            border-radius: 50px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
        }
        .btn-logout:hover {
            background-color: #800000;
        }
    </style>
</head>
<body>
<div class="summary-box">
    <h1>
        <img src="https://logodix.com/logo/851601.jpg" class="paw-icon" alt="Paw Logo">
        Welcome back, <span>${username}</span>!
    </h1>
    <p>You have successfully logged in. Let’s help our furry friends find loving homes!</p>

    <a href="<c:url value='/logout'/>" class="btn-logout"><i class="fas fa-paw me-2"></i>Logout</a>
</div>
</body>
</html>
