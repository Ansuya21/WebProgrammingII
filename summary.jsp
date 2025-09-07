<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Happy Tails Adoption - Registration Successful</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .success-box {
            background: #fff;
            padding: 3rem 2rem;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgb(0 0 0 / 0.15);
            text-align: center;
            max-width: 450px;
        }
        .success-box h1 {
            color: #b30000;
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }
        .success-box .highlight {
            color: #ff4d4d;
        }
        .success-text {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 0.5rem;
        }
        .username-text {
            font-size: 1rem;
            color: #555;
            margin-bottom: 2rem;
        }
        .btn-big {
            background-color: #b30000;
            color: white;
            border: none;
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
            border-radius: 50px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: 600;
        }
        .btn-big:hover {
            background-color: #800000;
        }
        .paw-icon {
            width: 40px;
            vertical-align: middle;
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div class="success-box">
    <h1>
        <img src="https://logodix.com/logo/851601.jpg" class="paw-icon" alt="Paw Logo">
        Welcome, <span class="highlight">${name}</span>!
    </h1>
    <p class="success-text">Your registration was successful ✅</p>
    <p class="username-text">Your username: <b>${username}</b></p>
    <p class="success-text">Thank you for joining Happy Tails Adoption. Let’s help our furry friends find loving homes!</p>
    <a href="<c:url value='/login'/>">
        <button type="button" class="btn-big"><i class="fas fa-paw me-2"></i>Go to Login</button>
    </a>
</div>
</body>
</html>
