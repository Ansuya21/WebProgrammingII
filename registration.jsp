<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Happy Tails Adoption - Register</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: #fff;
            padding: 2.5rem 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgb(0 0 0 / 15%);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .form-container h2 {
            color: #b30000;
            margin-bottom: 1rem;
            font-weight: 700;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        .form-container h2 img {
            width: 36px;
            height: 36px;
        }
        .form-container input {
            width: 100%;
            padding: 0.75rem;
            margin: 0.5rem 0 1rem;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }
        .form-container button {
            background-color: #b30000;
            color: #fff;
            border: none;
            padding: 0.75rem;
            width: 100%;
            font-size: 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .form-container button:hover {
            background-color: #800000;
        }
        .form-container a {
            color: #b30000;
            text-decoration: none;
        }
        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2><img src="https://logodix.com/logo/851601.jpg" alt="Paw Logo"/> Register</h2>
    <form action="<c:url value='/register'/>" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="<c:url value='/login'/>">Login here</a></p>
</div>
</body>
</html>
